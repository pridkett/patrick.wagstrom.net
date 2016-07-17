---
date: '2004-12-01T16:33:00-05:00'
old:
  layout: post
  oldcategories:
  - python
  status: published
  timestamp: 04:33 PM Wednesday, December 01, 2004 EST
  wordpress_id: '298'
slug: pythondbus
tags:
- python
title: Python and DBus
url: /weblog/2004/12/01/pythondbus/
---

I found [this article](http://s1x.homelinux.net/documents/python/hal-listing-devs) about how to
list devices using hal and dbus from Python, however, I couldn't get it to work properly.  After some hacking
I managed to get a little script working to list all the ethernet devices.





    <span style="font-weight: bold"><span style="color: #0000FF">import</span></span> dbus
    bus <span style="color: #990000">=</span> dbus<span style="color: #990000">.</span><span style="font-weight: bold"><span style="color: #000000">Bus</span></span><span style="color: #990000">(</span>dbus<span style="color: #990000">.</span>Bus<span style="color: #990000">.</span>TYPE_SYSTEM<span style="color: #990000">)</span>
    hal_service <span style="color: #990000">=</span> bus<span style="color: #990000">.</span><span style="font-weight: bold"><span style="color: #000000">get_service</span></span><span style="color: #990000">(</span><span style="color: #FF0000">"org.freedesktop.Hal"</span><span style="color: #990000">)</span>
    hal_manager <span style="color: #990000">=</span> hal_service<span style="color: #990000">.</span><span style="font-weight: bold"><span style="color: #000000">get_object</span></span><span style="color: #990000">(</span><span style="color: #FF0000">"/org/freedesktop/Hal/Manager"</span><span style="color: #990000">,</span>
    <span style="color: #FF0000">"org.freedesktop.Hal.Manager"</span><span style="color: #990000">)</span>
    eth_devs <span style="color: #990000">=</span> hal_manager<span style="color: #990000">.</span><span style="font-weight: bold"><span style="color: #000000">FindDeviceByCapability</span></span> <span style="color: #990000">(</span><span style="color: #FF0000">"net"</span><span style="color: #990000">)</span>
    <span style="font-weight: bold"><span style="color: #0000FF">for</span></span> dev_uri <span style="font-weight: bold"><span style="color: #0000FF">in</span></span> eth_devs<span style="color: #990000">:</span>
    	dev <span style="color: #990000">=</span> hal_service<span style="color: #990000">.</span><span style="font-weight: bold"><span style="color: #000000">get_object</span></span> <span style="color: #990000">(</span>dev_uri<span style="color: #990000">,</span> <span style="color: #FF0000">"org.freedesktop.Hal.Device"</span><span style="color: #990000">)</span>
    	iface <span style="color: #990000">=</span> dev<span style="color: #990000">.</span><span style="font-weight: bold"><span style="color: #000000">GetPropertyString</span></span> <span style="color: #990000">(</span><span style="color: #FF0000">"net.interface"</span><span style="color: #990000">)</span>
    	prod <span style="color: #990000">=</span> <span style="color: #FF0000">""</span>
    <span style="font-weight: bold"><span style="color: #0000FF">try</span></span><span style="color: #990000">:</span>
    		prod <span style="color: #990000">=</span> <span style="color: #FF0000">"("</span> <span style="color: #990000">+</span> dev<span style="color: #990000">.</span><span style="font-weight: bold"><span style="color: #000000">GetPropertyString</span></span> <span style="color: #990000">(</span><span style="color: #FF0000">"info.product"</span><span style="color: #990000">)</span> <span style="color: #990000">+</span> <span style="color: #FF0000">")"</span>
    <span style="font-weight: bold"><span style="color: #0000FF">except</span></span><span style="color: #990000">:</span>
    <span style="font-weight: bold"><span style="color: #0000FF">pass</span></span>
    <span style="font-weight: bold"><span style="color: #0000FF">print</span></span> <span style="color: #FF0000">"%s - %s"</span> <span style="color: #990000">%</span> <span style="color: #990000">(</span>iface<span style="color: #990000">,</span> prod<span style="color: #990000">)</span>
