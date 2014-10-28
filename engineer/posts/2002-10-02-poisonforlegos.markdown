title: Poison for Legos
timestamp: 07:50 PM Wednesday, October 02, 2002 EDT
status: published
slug: poisonforlegos
tags:
- old
url: /weblog/2002/10/02/poisonforlegos/

layout: post
oldcategories:
- old
wordpress_id: '92'

---

This is a file I wrote a while ago for [Lego Mindstorms](http://www.legomindstorms.com/) competitions.  It's called Poison.  Bascially, it turns off the other robots.
To use it, save the code as **poison.nqh** and then put a line **#include "poison.nqh"**.  In your program just add then line **start poison;** and you will start poisoning other robots.



    
    
    /*-----------------------------------------------------------------------------
     * legos/zacks2/poison.nqc
     *-----------------------------------------------------------------------------
     * $Header: /home/patrick/cvs/www/pyblosxom/data/old/poisonForLegos.txt,v 1.1 2004/09/15 14:34:41 patrick Exp $
     *-----------------------------------------------------------------------------
     * Operation poison the other robots...
     *
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
    




If you want to make it an andidote change the data to 0x10 instead of 0x68.  This sends out a constant stream of harmless "Hello" signals to the other RCX's.  When the RCX is transmitting it cannot be interrupted.  However, you still have the problem of the other RCX beating you to the punch.

