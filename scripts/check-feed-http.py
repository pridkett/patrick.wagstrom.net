#!/usr/bin/env python3
"""Exercise the production feed snippet with a temporary local Caddy server."""

import argparse
from pathlib import Path
import socket
import subprocess
import tempfile
import time
import urllib.error
import urllib.request


class NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, request, fp, code, message, headers, newurl):
        return None


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--hugo", default="hugo")
    parser.add_argument("--caddy", default="caddy")
    args = parser.parse_args()
    repo = Path(__file__).resolve().parents[1]
    with tempfile.TemporaryDirectory(prefix="feed-http-check-") as directory:
        root = Path(directory)
        output = root / "public"
        subprocess.run([args.hugo, "--source", str(repo), "--destination", str(output),
                        "--panicOnWarning"], check=True)
        # Simulate old deployment files; routing must win over existing files.
        legacy = ("/index.xml", "/weblog/index.rss", "/weblog/index.xml", "/tags/index.xml",
                  "/tags/index.rss", "/tags/firewall/index.xml", "/tags/firewall/index.rss",
                  "/categories/index.xml", "/categories/technology/index.xml")
        for name in legacy:
            target = output / name.lstrip("/")
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_text("Stale feed")
        with socket.socket() as listener:
            listener.bind(("127.0.0.1", 0))
            port = listener.getsockname()[1]
        config = root / "Caddyfile"
        config.write_text(
            '{\n admin off\n auto_https off\n}\n'
            f'http://127.0.0.1:{port} {{\n root * "{output}"\n'
            f' import "{repo / "ops/feeds.caddy"}"\n file_server\n}}\n')
        # Adapt validates the snippet without changing any running server.
        subprocess.run([args.caddy, "adapt", "--config", str(config), "--validate"],
                       check=True, capture_output=True)
        opener = urllib.request.build_opener(NoRedirect)

        def request(path, headers=None):
            req = urllib.request.Request(f"http://127.0.0.1:{port}" + path, headers=headers or {})
            try:
                response = opener.open(req, timeout=3)
            except urllib.error.HTTPError as response_error:
                response = response_error
            with response:
                return response.status, response.headers, response.read()

        with (root / "server.log").open("w+") as log:
            server = subprocess.Popen([args.caddy, "run", "--config", str(config)],
                                      stdout=log, stderr=log)
            try:
                deadline = time.monotonic() + 10
                while True:
                    try:
                        request("/index.rss")
                        break
                    except urllib.error.URLError:
                        if server.poll() is not None or time.monotonic() >= deadline:
                            log.seek(0)
                            raise AssertionError("Caddy failed to start: " + log.read())
                        time.sleep(0.1)
                for name, mime in (("/index.rss", "application/rss+xml"),
                                   ("/index.atom", "application/atom+xml")):
                    status, headers, body = request(name, {"Origin": "https://example.org"})
                    assert status == 200 and body == (output / name.lstrip("/")).read_bytes()
                    assert headers.get_content_type() == mime, headers
                    assert headers.get("Cache-Control") == "public, max-age=3600", headers
                    assert headers.get("Access-Control-Allow-Origin") == "*", headers
                    for conditional, value in (("If-None-Match", headers.get("ETag")),
                                               ("If-Modified-Since", headers.get("Last-Modified"))):
                        assert value, f"Missing conditional request metadata: {name}"
                        assert request(name, {conditional: value})[0] == 304
                for name in legacy:
                    status, headers, _ = request(name + "?legacy=1")
                    assert status == 308, (name, status)
                    assert headers.get("Location") == "https://patrick.wagstrom.net/index.rss"
                for name in ("/weblog/", "/tags/firewall/", "/tutorials/mythTV64/googleLinks.html"):
                    assert request(name)[0] == 200, f"Feed routing affected {name}"
            finally:
                server.terminate()
                try:
                    server.wait(timeout=5)
                except subprocess.TimeoutExpired:
                    server.kill()
                    server.wait()
    print("Feed redirects, HTTP headers, and conditional requests passed.")


if __name__ == "__main__":
    main()
