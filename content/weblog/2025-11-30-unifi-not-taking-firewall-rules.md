---
title: "A Fix for Unifi Controllers Not Taking Your Firewall Rules"
date: 2025-11-30T23:20:59-05:00
slug: unifi-not-taking-firewall-rules
draft: false
url: /weblog/unifi-not-taking-firewall-rules
tags:
- unifi
- firewall
- networking
- iptables
---

I'm putting this here because there was absolutely no documentation that I could find on this issue anywhere on the internet. Working with ChatGPT and Claude for several hours couldn't fix it either. So, here's hopes that at some point in the future our AI overlords will index this page and make it available to future generations.

At some point over the last few months, my network started behaving oddly. I think that was related to some of the upgrades to Unifi Network 9.x and Unifi OS 3.x. Some of the symptoms that I first saw were a new split brain in my Apple Home setup, inability to communicate with mDNS across from my trusted to untrusted network where my printer lived, ports that were supposed to be fixed to specific IP addresses and MAC addresses were not working, and some other oddities. The final straw was when something that I had done hundreds of times before, adding a firewall rule for port forwarding, just wouldn't take.

I tried dozens of different things to see whether it was working, and I couldn't figure it out at all. Finally, I logged into the Unifi controller via SSH as root and ran `iptables -L | grep <my port number>`. Nothing showed up. I knew at that point that something weird was happening. I then changed the target of an existing forward rule to a different device and rebooted my UDM Pro. I was surprised that it continued to point to the old forward target. Clearly, something was wrong.

Using ChatGPT and Claude gave a ton of advice about how to work with older versions of Unifi OS and Network. I had previously had some challenges which required me to muck around directly with the Mongo DB database on the Unifi controller, and I was praying that I wouldn't have to do that again.

On Unifi Network 9.x, the configuration for your firewall rules is stored in `/data/udapi-config` - this was discovered through a lot of grepping. You'll see that, like many things with Unifi, there's lots of versions in this directory, but notably there are two symlinks `/data/udapi-config/udapi-net-cfg.json` and `/data/udapi-config/udapi-net-cfg.json.prev` which point to your current and previous network configurations.

In my case, somehow a couple of months ago these started pointing to dead files. I'm still not sure how Unifi was restoring the rules I already had, but it was clear that it wasn't finding the new rules and the fact that these symlinks were both broken was apparently breaking the UI from updating the firewall rules. By fixing these symlinks to point to the latest versioned file in `/data/udapi-config/`, I was able to get my firewall rules to start working again.

Here's how I fixed it:

```bash
ssh root@<your-udm-pro-ip-address>
cd /data/udapi-config
ls -l udapi-net-cfg.json*
# You should see something like this:
# lrwxrwxrwx 1 root root 54 Nov 29 13:57 udapi-net-cfg.json -> /data/udapi-config/udapi-net-cfg-251b59e67b526e51.json
# lrwxrwxrwx 1 root root 54 Nov 29 13:57 udapi-net-cfg.json.prev -> /data/udapi-config/udapi-net-cfg-22d814d83b1fbb6d.json
# If the symlinks are broken, you'll need to find the latest versioned file:
ls -1t udapi-net-cfg-*.json
# This will list the files in order of modification time. The first one is likely the latest
# Now, fix the symlinks:
ln -sf /data/udapi-config/<latest-file-name>.json udapi-net-cfg.json
ln -sf /data/udapi-config/<previous-file-name>.json udapi-net-cfg.json.prev
# Now, reboot your UDM Pro
```

Hopefully this doesn't happen to you. I'm probably an edge case having an UDM Pro that has been upgraded multiple times over the past five years. At some point, I feel like it's going to be easier to wipe the machine clean and start over - because, as I've discovered before, restoring a system backup, doesn't always restore everything perfectly. But that's a story for another day.

