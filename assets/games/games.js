(() => {
  "use strict";
  const player = document.getElementById("w2-single-player");
  const fullscreen = document.getElementById("w2-fullscreen");
  if (!player || !fullscreen) return;
  const playArea = document.getElementById("w2-play-area");
  fullscreen.hidden = !document.fullscreenEnabled;
  fullscreen.addEventListener("click", async () => {
    try {
      if (document.fullscreenElement === playArea) await document.exitFullscreen();
      else await playArea.requestFullscreen();
    } catch { /* Inline play remains available. */ }
  });
  document.addEventListener("fullscreenchange", () => {
    fullscreen.textContent = document.fullscreenElement === playArea ? "Exit fullscreen" : "Fullscreen";
  });
  // Flush this same-origin player's battery RAM before navigating away.
  window.addEventListener("pagehide", () => {
    try { player.querySelector("iframe")?.contentWindow.w2FlushSave?.(); } catch { /* The player's autosave remains available. */ }
  });
})();
