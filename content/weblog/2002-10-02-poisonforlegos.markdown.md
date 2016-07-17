---
date: '2002-10-02T19:50:00-04:00'
old:
  layout: post
  oldcategories:
  - old
  status: published
  timestamp: 07:50 PM Wednesday, October 02, 2002 EDT
  wordpress_id: '92'
slug: poisonforlegos
tags:
- old
- legos
title: Poison for Legos
url: /weblog/2002/10/02/poisonforlegos/
---

This is a file I wrote a while ago for [Lego
Mindstorms](http://www.legomindstorms.com/) competitions.  It's called Poison.
Bascially, it turns off the other robots.  To use it, save the code as
<span class="command">poison.nqh</span> and then put a line <span class="command">#include "poison.nqh"</span>.  In your program
just add then line <span class="command">start poison;</span> and you will start poisoning other robots.

{{< highlight c >}}

/*-----------------------------------------------------------------------------
 * legos/zacks2/poison.nqc
 *-----------------------------------------------------------------------------
 * Operation poison the other robots...
 *---------------------------------------------------------------------------*/

task poison()
{
    SetSerialComm (SERIAL_COMM_DEFAULT);
    SetSerialPacket(SERIAL_PACKET_DEFAULT);
    SetTxPower(TX_POWER_HI);
    while(1) {
        SetSerialData(0,0x68);
        SendSerial(0,1);
    }
}

{{< /highlight >}}

If you want to make it an andidote change the data to 0x10 instead of 0x68.
This sends out a constant stream of harmless "Hello" signals to the other
RCX's.  When the RCX is transmitting it cannot be interrupted.  However, you
still have the problem of the other RCX beating you to the punch.

