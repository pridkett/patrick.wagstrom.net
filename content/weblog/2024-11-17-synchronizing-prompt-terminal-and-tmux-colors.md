---
title: "Synchronizing Prompt, Terminal Emulator, and Tmux Colors"
date: 2024-11-17T09:56:59-05:00
slug: synchronizing-prompt-terminal-emulator-and-tmux-colors
draft: false
url: /weblog/2024/11/17/synchronizing-prompt-terminal-emulator-and-tmux-colors
tags:
- linux
- iterm
- terminal
- cli
- projects
- rust
---

As I've built out my home network, I've ended up with a hodgepodge of different machines. Various Raspberry Pi machines perform small tasks from managing 3D printers to custom DNS. A Windows machine with WSL2 provides local AI inference on an NVIDIA 3090. And a handful of other machines around the house run automation, backups, collect IoT style sensor data, and more. The challenge with this is that it can be very easy for me to forget what machine I'm working with over an SSH connection. In most cases this is benign, but more than once I've accidentally deleted files from a machine that wasn't supposed to have them deleted (don't worry - all my machines are backed up).

A big part of the problem stems from [tmux](https://github.com/tmux/tmux/wiki), which is a terrific piece of software, but defaults to a green status bar on all of the machines. It's possible to customize the status bar, but I'd need to find a way to make each host have a different color.

Likewise, I do most of connections from a Mac using iTerm2 as my terminal emulator. The need thing about that is that [iTerm2 has proprietary escape codes](https://iterm2.com/documentation-escape-codes.html) that can also be used to set the window title and tab chrome background color. Now, we might be getting somewhere.

Finally, I use [powerline-go](https://github.com/justjanne/powerline-go) for my prompt on almost every system. This probably contributes to my problems to be honest because all of my prompts tend to look very similar. Thankfully, powerline-go is aware of this and if you're connected by SSH it automatically colorizes the hostname using an algorithm. This was the key to my solution.

[Powerline-go's algorithm is relatively straightforward](https://github.com/justjanne/powerline-go/blob/059f7f230760f8800307b3ae632c6cc6ca3f81d4/segment-hostname.go#L42-L43) - calculate the md5 of the short hostname, take the first byte and mod 128 it to give a number from 0-127. This is [used as the color of the hostname according to the xterm color set](https://www.ditig.com/publications/256-colors-cheat-sheet). So, if the value of the first byte is 225, then that will be <span style="background-color: #875faf; color: #080808; padding-left: 1ex; padding-right: 1ex;">color 97 and look like this</span>. The logical question, of course, is how did it pick that forground color, which is color 232 in the xterm color table? That's done via [a static lookup table in powerling-go for each theme](https://github.com/justjanne/powerline-go/blob/059f7f230760f8800307b3ae632c6cc6ca3f81d4/defaults.go#L654C1-L909C14). While I could easily hack in the first part into configuration files, the lookup table is going to be a pain. As an alternative, I could probably set something up with Ansible to pre-calculate the colors for each host, but that seems less interesting and would've have given me an excuse to create a program in Rust.

This is why I wrote [prompt-color-tool](https://github.com/prikett/prompt-color-tool) a small utility that can be used to calculate the foreground and background color to be used in prompts and status bars on your terminals. As with most things, a picture, or in this case an animated gif, is probably the easiest way to show this.

<figure><img src="/weblog/media/2024/11/prompt-color-tool-demo.gif" width="570" height="398"><figcaption>Look at the prompt, window chrome, and tmux colors all staying in sync.</figure>

This doesn't come 100% for free, there are small snippets that you'll need to add to your configuraiton files, but those are all documented in the README for the project. If you've got more that integrations that you'd like to see added, as I primarily use powerline-go, tmux, iterm2, and fish shell, feel free to submit a PR or just ping me and I'll see about getting them into the documentation.

Until then, have fun making your terminal windows look beautifully colorized, and if you can give it a star on GitHub, I'd appreciate it.
