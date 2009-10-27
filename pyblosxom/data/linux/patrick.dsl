/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20051216
 *
 * Disassembly of patrick.aml, Fri Aug  4 09:05:27 2006
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x000063F4 (25588)
 *     Revision         0x01
 *     OEM ID           "NVIDIA"
 *     OEM Table ID     "AWRDACPI"
 *     OEM Revision     0x00001000 (4096)
 *     Creator ID       "MSFT"
 *     Creator Revision 0x0100000E (16777230)
 */
DefinitionBlock ("DSDT.aml", "DSDT", 1, "NVIDIA", "AWRDACPI", 0x00001000)
{
    Scope (\_PR)
    {
        Processor (\_PR.CPU0, 0x00, 0x00000000, 0x00) 
        {
            Name (_PCT, Package (0x02)
            {
                ResourceTemplate ()
                {
                    Register (FFixedHW, 
                        0x00,               // Register Bit Width
                        0x00,               // Register Bit Offset
                        0x0000000000000000, // Register Address
                        )
                }, 

                ResourceTemplate ()
                {
                    Register (FFixedHW, 
                        0x00,               // Register Bit Width
                        0x00,               // Register Bit Offset
                        0x0000000000000000, // Register Address
                        )
                }
            })
            Name (_PSS, Package (0x04) // number of p-states
            {
                Package (0x06)
                {
                    0x0898, // 2200 MHz
                    0x000105B8, 
                    0x64, 
                    0x07, 
                    0xE020298E, 
                    0x018E
                },

                Package (0x06)
                {
                    0x07D0, // 2000 MHz
                    0xFCBC, 
                    0x64, 
                    0x07, 
                    0xE0202A0C, 
                    0x020C
                }, 

                Package (0x06)
                {
                    0x0708, // 1800 MHz
                    0xD610, 
                    0x64, 
                    0x07, 
                    0xE0202A8A, 
                    0x028A
                }, 

                Package (0x06)
                {
                    0x03E8, // 1000 MHz
                    0x6B6C, 
                    0x64, 
                    0x07, 
                    0xE0202C82, 
                    0x0482
                }
            })
            Name (PSXG, Buffer (0x18)
            {
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (PSXF, Buffer (0x18)
            {
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (PSXE, Buffer (0x18)
            {
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (PSXD, Buffer (0x18)
            {
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (PSXC, Buffer (0x18)
            {
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Name (PSXB, Buffer (0x18)
            {
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            })
            Method (_PPC, 0, NotSerialized)
            {
                Return (Zero)
            }

            Name (PSSC, 0x0A)
        }
        Processor (\_PR.CPU1, 0x01, 0x00000000, 0x00) 
        {
            Name (APCT, Package (0x02)
            {
                ResourceTemplate ()
                {
                    Register (FFixedHW, 
                        0x00,               // Register Bit Width
                        0x00,               // Register Bit Offset
                        0x0000000000000000, // Register Address
                        )
                }, 

                ResourceTemplate ()
                {
                    Register (FFixedHW, 
                        0x00,               // Register Bit Width
                        0x00,               // Register Bit Offset
                        0x0000000000000000, // Register Address
                        )
                }
            })
            Name (APSS, Package (0x0A)
            {
                Package (0x06)
                {
                    0x09999999, 
                    0x00099999, 
                    0x00999999, 
                    0x00999999, 
                    0x99999999, 
                    0x99999999
                }, 

                Package (0x06)
                {
                    0x09999999, 
                    0x00099999, 
                    0x00999999, 
                    0x00999999, 
                    0x99999999, 
                    0x99999999
                }, 

                Package (0x06)
                {
                    0x09999999, 
                    0x00099999, 
                    0x00999999, 
                    0x00999999, 
                    0x99999999, 
                    0x99999999
                }, 

                Package (0x06)
                {
                    0x09999999, 
                    0x00099999, 
                    0x00999999, 
                    0x00999999, 
                    0x99999999, 
                    0x99999999
                }, 

                Package (0x06)
                {
                    0x09999999, 
                    0x00099999, 
                    0x00999999, 
                    0x00999999, 
                    0x99999999, 
                    0x99999999
                }, 

                Package (0x06)
                {
                    0x09999999, 
                    0x00099999, 
                    0x00999999, 
                    0x00999999, 
                    0x99999999, 
                    0x99999999
                }, 

                Package (0x06)
                {
                    0x09999999, 
                    0x00099999, 
                    0x00999999, 
                    0x00999999, 
                    0x99999999, 
                    0x99999999
                }, 

                Package (0x06)
                {
                    0x09999999, 
                    0x00099999, 
                    0x00999999, 
                    0x00999999, 
                    0x99999999, 
                    0x99999999
                }, 

                Package (0x06)
                {
                    0x09999999, 
                    0x00099999, 
                    0x00999999, 
                    0x00999999, 
                    0x99999999, 
                    0x99999999
                }, 

                Package (0x06)
                {
                    0x09999999, 
                    0x00099999, 
                    0x00999999, 
                    0x00999999, 
                    0x99999999, 
                    0x99999999
                }
            })
            Method (APPC, 0, NotSerialized)
            {
                Return (Zero)
            }

            Name (PSSC, 0x0A)
        }
    }

    Name (\_S0, Package (0x04)
    {
        0x00, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S1, Package (0x04)
    {
        0x01, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\SS3, Package (0x04)
    {
        0x05, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S4, Package (0x04)
    {
        0x06, 
        0x00, 
        0x00, 
        0x00
    })
    Name (\_S5, Package (0x04)
    {
        0x07, 
        0x00, 
        0x00, 
        0x00
    })
    OperationRegion (\DEBG, SystemIO, 0x80, 0x01)
    Field (\DEBG, ByteAcc, NoLock, Preserve)
    {
        DBG1,   8
    }

    OperationRegion (KBC, SystemIO, 0x64, 0x01)
    Field (KBC, ByteAcc, NoLock, Preserve)
    {
        KCMD,   8
    }

    OperationRegion (KBCD, SystemIO, 0x60, 0x01)
    Field (KBCD, ByteAcc, NoLock, Preserve)
    {
        KDAT,   8
    }

    OperationRegion (EXTM, SystemMemory, 0x000FF830, 0x10)
    Field (EXTM, WordAcc, NoLock, Preserve)
    {
        ROM1,   16, 
        RMS1,   16, 
        ROM2,   16, 
        RMS2,   16, 
        ROM3,   16, 
        RMS3,   16, 
        AMEM,   32
    }

    OperationRegion (\PM1S, SystemIO, 0x4000, 0x02)
    Field (\PM1S, ByteAcc, NoLock, Preserve)
    {
        Offset (0x01), 
        PBTS,   1, 
            ,   1, 
        RTCS,   1, 
            ,   4, 
        WAKS,   1
    }

    OperationRegion (ELCR, SystemIO, 0x04D0, 0x02)
    Field (ELCR, ByteAcc, NoLock, Preserve)
    {
        ELC1,   8, 
        ELC2,   8
    }

    OperationRegion (\STUS, SystemIO, 0x4400, 0x04)
    Field (\STUS, ByteAcc, NoLock, Preserve)
    {
        G_ST,   32
    }

    OperationRegion (\GPS0, SystemIO, 0x4020, 0x04)
    Field (\GPS0, ByteAcc, NoLock, Preserve)
    {
        GS00,   8, 
        GS01,   8, 
        GS02,   8, 
        GS03,   8
    }

    OperationRegion (\P20S, SystemIO, 0x4020, 0x04)
    Field (\P20S, ByteAcc, NoLock, Preserve)
    {
        P_20,   32
    }

    OperationRegion (\SMIC, SystemIO, 0x442E, 0x01)
    Field (\SMIC, ByteAcc, NoLock, Preserve)
    {
        SCP,    8
    }

    OperationRegion (\GP1, SystemIO, 0x44C0, 0x32)
    Field (\GP1, ByteAcc, NoLock, Preserve)
    {
        GP00,   8, 
        GP01,   8, 
        GP02,   8, 
        GP03,   8, 
        GP04,   8, 
        GP05,   8, 
        GP06,   8, 
        GP07,   8, 
        GP08,   8, 
        GP09,   8, 
        GP10,   8, 
        GP11,   8, 
        GP12,   8, 
        GP13,   8, 
        GP14,   8, 
        GP15,   8, 
        GP16,   8, 
        GP17,   8, 
        GP18,   8, 
        GP19,   8, 
        GP20,   8, 
        GP21,   8, 
        GP22,   8, 
        Offset (0x18), 
        GP24,   8, 
        GP25,   8, 
        GP26,   8, 
        GP27,   8, 
        GP28,   8, 
        GP29,   8, 
        GP30,   8, 
        GP31,   8, 
        GP32,   8, 
        GP33,   8, 
        GP34,   8, 
        GP35,   8, 
        GP36,   8, 
        GP37,   8, 
        GP38,   8, 
        GP39,   8, 
        GP40,   8, 
        GP41,   8, 
        GP42,   8, 
        GP43,   8, 
        GP44,   8, 
        GP45,   8, 
        GP46,   8, 
        GP47,   8, 
        GP48,   8, 
        GP49,   8
    }

    Name (OSFX, 0x01)
    Name (OSFL, 0x01)
    Method (STRC, 2, NotSerialized)
    {
        If (LNot (LEqual (SizeOf (Arg0), SizeOf (Arg1))))
        {
            Return (0x00)
        }

        Add (SizeOf (Arg0), 0x01, Local0)
        Name (BUF0, Buffer (Local0) {})
        Name (BUF1, Buffer (Local0) {})
        Store (Arg0, BUF0)
        Store (Arg1, BUF1)
        While (Local0)
        {
            Decrement (Local0)
            If (LNot (LEqual (DerefOf (Index (BUF0, Local0)), DerefOf (Index (BUF1, Local0)))))
            {
                Return (Zero)
            }
        }

        Return (One)
    }

    OperationRegion (RTCM, SystemIO, 0x70, 0x02)
    Field (RTCM, ByteAcc, NoLock, Preserve)
    {
        CMIN,   8, 
        CMDA,   8
    }

    IndexField (CMIN, CMDA, ByteAcc, NoLock, Preserve)
    {
        Offset (0x0F), 
        SHUT,   8
    }

    OperationRegion (INFO, SystemMemory, 0x000FF840, 0x01)
    Field (INFO, ByteAcc, NoLock, Preserve)
    {
        KBDI,   1, 
        RTCW,   1, 
        PS2F,   1, 
        IRFL,   2, 
        DISE,   1, 
        SSHU,   1
    }

    OperationRegion (BEEP, SystemIO, 0x61, 0x01)
    Field (BEEP, ByteAcc, NoLock, Preserve)
    {
        S1B,    8
    }

    OperationRegion (CONT, SystemIO, 0x40, 0x04)
    Field (CONT, ByteAcc, NoLock, Preserve)
    {
        CNT0,   8, 
        CNT1,   8, 
        CNT2,   8, 
        CTRL,   8
    }

    Method (SPKR, 1, NotSerialized)
    {
        Store (S1B, Local0)
        Store (0xB6, CTRL)
        Store (0x55, CNT2)
        Store (0x03, CNT2)
        Store (Arg0, Local2)
        While (LGreater (Local2, 0x00))
        {
            Or (S1B, 0x03, S1B)
            Store (0x5FFF, Local3)
            While (LGreater (Local3, 0x00))
            {
                Decrement (Local3)
            }

            And (S1B, 0xFC, S1B)
            Store (0x0EFF, Local3)
            While (LGreater (Local3, 0x00))
            {
                Decrement (Local3)
            }

            Decrement (Local2)
        }

        Store (Local0, S1B)
    }

    Scope (\)
    {
        Name (PICF, 0x00)
        Method (_PIC, 1, NotSerialized)
        {
            Store (Arg0, PICF)
        }
    }

    Name (SID4, 0x00)
    Name (SLG0, 0x00)
    Name (SLG1, 0x00)
    Name (SLG2, 0x00)
    Name (SLG3, 0x00)
    Name (SLG4, 0x00)
    Name (SLG5, 0x00)
    Name (SLG6, 0x00)
    Name (SLG7, 0x00)
    Name (SLG8, 0x00)
    Name (SLG9, 0x00)
    Name (SLGA, 0x00)
    Name (SID5, 0x00)
    Name (SSM0, 0x00)
    Name (SSM1, 0x00)
    Name (SSM2, 0x00)
    Name (SSM3, 0x00)
    Name (SSM4, 0x00)
    Name (SUA0, 0x00)
    Name (SUB0, 0x00)
    Name (SX, 0x00)
    Name (SFLG, 0x00)
    Name (SID0, 0x00)
    Name (SID1, 0x00)
    Name (SID2, 0x00)
    Name (SID3, 0x00)
    Method (\_PTS, 1, NotSerialized)
    {
        Store (Arg0, Local0)
        Store (Local0, SX)
        Or (Arg0, 0xF0, Local0)
        Store (Local0, DBG1)
        OSTP ()
        Store (\_SB.PCI0.IDE0.ID20, SID0)
        Store (\_SB.PCI0.IDE0.IDTS, SID1)
        Store (\_SB.PCI0.IDE0.IDTP, SID2)
        Store (\_SB.PCI0.IDE0.ID22, SID3)
        Store (\_SB.PCI0.IDE0.UMSS, SID4)
        Store (\_SB.PCI0.IDE0.UMSP, SID5)
        If (LEqual (Arg0, 0x01)) {}
        If (LEqual (Arg0, 0x03)) {}
        If (LEqual (Arg0, 0x04)) {}
        If (LEqual (Arg0, 0x05))
        {
            If (LNot (LEqual (OSFL, 0x00)))
            {
                Sleep (0x01F4)
            }
        }
    }

    Method (\_WAK, 1, NotSerialized)
    {
        Store (0xFF, DBG1)
        Store (0x00, SFLG)
        If (LEqual (RTCW, 0x00))
        {
            Notify (\_SB.PWRB, 0x02)
        }

        Notify (\_SB.PCI0.USB0, 0x00)
        If (LNot (LLess (OSFL, 0x01)))
        {
            Store (0x00, \_SB.PCI0.SMB0.SMPM)
        }
    }

    Scope (\_SI)
    {
        Method (_MSG, 1, NotSerialized)
        {
            Store ("==== MSG Working ====", Debug)
        }

        Method (_SST, 1, NotSerialized)
        {
            Store ("==== SST Working ====", Debug)
        }
    }

    Scope (\_GPE)
    {
        Method (_L11, 0, NotSerialized)
        {
            Store (0x02, GS02)
            If (LNot (LEqual (PEV0, 0xFFFF)))
            {
                If (PES0)
                {
                    While (PES0)
                    {
                        Store (0x01, PES0)
                    }

                    Notify (\_SB.PCI0.XVR0, 0x02)
                }
            }

            If (LNot (LEqual (PEV1, 0xFFFF)))
            {
                If (PES1)
                {
                    While (PES1)
                    {
                        Store (0x01, PES1)
                    }

                    Notify (\_SB.PCI0.XVR1, 0x02)
                }
            }

            If (LNot (LEqual (PEV2, 0xFFFF)))
            {
                If (PES2)
                {
                    While (PES2)
                    {
                        Store (0x01, PES2)
                    }

                    Notify (\_SB.PCI0.XVR2, 0x02)
                }
            }

            If (LNot (LEqual (PEV3, 0xFFFF)))
            {
                If (PES3)
                {
                    While (PES3)
                    {
                        Store (0x01, PES3)
                    }

                    Notify (\_SB.PCI0.XVR3, 0x02)
                }
            }
        }

        Method (_L00, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.HUB0, 0x02)
        }

        Method (_L03, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.UAR1, 0x02)
        }

        Method (_L0B, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MMAC, 0x02)
        }

        Method (_L0D, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB0, 0x02)
        }

        Method (_L05, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.USB2, 0x02)
        }

        Method (_L07, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.MMCI, 0x02)
        }
    }

    Scope (\_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, 0x030AD041)
            Name (_ADR, 0x00)
            Name (_UID, 0x01)
            Name (_BBN, 0x00)
            Name (PCIA, 0x00)
            Method (_REG, 2, NotSerialized)
            {
                If (LEqual (Arg0, 0x02))
                {
                    Store (Arg1, PCIA)
                }
            }

            Device (MBIO)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (_UID, 0x05)
                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x4000,             // Address Range Minimum
                            0x4000,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x80,               // Address Length
                            )
                        IO (Decode16,
                            0x4080,             // Address Range Minimum
                            0x4080,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x80,               // Address Length
                            )
                        IO (Decode16,
                            0x4400,             // Address Range Minimum
                            0x4400,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x80,               // Address Length
                            )
                        IO (Decode16,
                            0x4480,             // Address Range Minimum
                            0x4480,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x80,               // Address Length
                            )
                        IO (Decode16,
                            0x4800,             // Address Range Minimum
                            0x4800,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x80,               // Address Length
                            )
                        IO (Decode16,
                            0x4880,             // Address Range Minimum
                            0x4880,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x80,               // Address Length
                            )
                    })
                    Return (BUF0)
                }
            }

            Name (NATA, Package (0x01)
            {
                0x00060000
            })
            Method (SS3D, 0, NotSerialized)
            {
                If (LEqual (OSFL, 0x02))
                {
                    Return (0x02)
                }
                Else
                {
                    Return (0x03)
                }
            }

            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }

            OperationRegion (LDT3, PCI_Config, 0x6C, 0x04)
            Field (LDT3, DWordAcc, NoLock, Preserve)
            {
                UCFG,   32
            }

            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    WordBusNumber (ResourceProducer, MinNotFixed, MaxNotFixed, PosDecode,
                        0x0000,             // Address Space Granularity
                        0x0000,             // Address Range Minimum
                        0x0000,             // Address Range Maximum
                        0x0000,             // Address Translation Offset
                        0x0000,             // Address Length
                        ,,)
                    IO (Decode16,
                        0x0CF8,             // Address Range Minimum
                        0x0CF8,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x08,               // Address Length
                        )
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Address Space Granularity
                        0x0000,             // Address Range Minimum
                        0x03AF,             // Address Range Maximum
                        0x0000,             // Address Translation Offset
                        0x03B0,             // Address Length
                        ,,, TypeStatic)
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Address Space Granularity
                        0x03E0,             // Address Range Minimum
                        0x0CF7,             // Address Range Maximum
                        0x0000,             // Address Translation Offset
                        0x0918,             // Address Length
                        ,,, TypeStatic)
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Address Space Granularity
                        0x0000,             // Address Range Minimum
                        0x0000,             // Address Range Maximum
                        0x0000,             // Address Translation Offset
                        0x0000,             // Address Length
                        ,,, TypeStatic)
                    WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                        0x0000,             // Address Space Granularity
                        0x0000,             // Address Range Minimum
                        0x0000,             // Address Range Maximum
                        0x0000,             // Address Translation Offset
                        0x0000,             // Address Length
                        ,,, TypeStatic)
                    QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x0000000000000000, // Address Space Granularity
                        0x0000000000000000, // Address Range Minimum
                        0x0000000000000000, // Address Range Maximum
                        0x0000000000000000, // Address Translation Offset
                        0x0000000000000000, // Address Length
                        ,,, AddressRangeMemory, TypeStatic)
                    QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x0000000000000000, // Address Space Granularity
                        0x0000000000000000, // Address Range Minimum
                        0x0000000000000000, // Address Range Maximum
                        0x0000000000000000, // Address Translation Offset
                        0x0000000000000000, // Address Length
                        ,,, AddressRangeMemory, TypeStatic)
                    QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x0000000000000000, // Address Space Granularity
                        0x0000000000000000, // Address Range Minimum
                        0x0000000000000000, // Address Range Maximum
                        0x0000000000000000, // Address Translation Offset
                        0x0000000000000000, // Address Length
                        ,,, AddressRangeMemory, TypeStatic)
                    DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                        0x00000000,         // Address Space Granularity
                        0xFEB00000,         // Address Range Minimum
                        0xFEBFFFFF,         // Address Range Maximum
                        0x00000000,         // Address Translation Offset
                        0x00100000,         // Address Length
                        ,,, AddressRangeMemory, TypeStatic)
                })
                CreateWordField (BUF0, 0x08, B1MN)
                CreateWordField (BUF0, 0x0A, B1MX)
                CreateWordField (BUF0, 0x0E, B1LN)
                And (\_SB.PCI0.K801.L0EN, 0x03, Local0)
                If (LEqual (Local0, 0x03))
                {
                    And (\_SB.PCI0.K801.DL00, 0x03, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        Store (\_SB.PCI0.K801.BNB0, B1MN)
                        Store (\_SB.PCI0.K801.BNL0, B1MX)
                        Subtract (B1MX, B1MN, Local1)
                        Add (0x01, Local1, B1LN)
                    }
                }

                And (\_SB.PCI0.K801.L1EN, 0x03, Local0)
                If (LEqual (Local0, 0x03))
                {
                    And (\_SB.PCI0.K801.DL01, 0x03, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        Store (\_SB.PCI0.K801.BNB1, B1MN)
                        Store (\_SB.PCI0.K801.BNL1, B1MX)
                        Subtract (B1MX, B1MN, Local1)
                        Add (0x01, Local1, B1LN)
                    }
                }

                And (\_SB.PCI0.K801.L2EN, 0x03, Local0)
                If (LEqual (Local0, 0x03))
                {
                    And (\_SB.PCI0.K801.DL02, 0x03, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        Store (\_SB.PCI0.K801.BNB2, B1MN)
                        Store (\_SB.PCI0.K801.BNL2, B1MX)
                        Subtract (B1MX, B1MN, Local1)
                        Add (0x01, Local1, B1LN)
                    }
                }

                And (\_SB.PCI0.K801.L3EN, 0x03, Local0)
                If (LEqual (Local0, 0x03))
                {
                    And (\_SB.PCI0.K801.DL03, 0x03, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        Store (\_SB.PCI0.K801.BNB3, B1MN)
                        Store (\_SB.PCI0.K801.BNL3, B1MX)
                        Subtract (B1MX, B1MN, Local1)
                        Add (0x01, Local1, B1LN)
                    }
                }

                CreateWordField (BUF0, 0x40, IOMN)
                CreateWordField (BUF0, 0x42, IOMX)
                CreateWordField (BUF0, 0x46, IOLN)
                CreateWordField (BUF0, 0x50, VIMN)
                CreateWordField (BUF0, 0x52, VIMX)
                CreateWordField (BUF0, 0x56, VILN)
                And (\_SB.PCI0.K801.IB00, 0x03, Local0)
                And (\_SB.PCI0.K801.IL00, 0x30, Local1)
                ShiftRight (Local1, 0x04, Local1)
                If (LEqual (Local0, 0x03))
                {
                    If (LEqual (Local1, 0x00))
                    {
                        And (\_SB.PCI0.K801.IB00, 0x10, Local1)
                        ShiftLeft (\_SB.PCI0.K801.IBV0, 0x0C, IOMN)
                        ShiftLeft (\_SB.PCI0.K801.ILV0, 0x0C, IOMX)
                        Or (IOMX, 0x0FFF, IOMX)
                        Subtract (IOMX, IOMN, IOLN)
                        Increment (IOLN)
                        If (LEqual (Local1, 0x10))
                        {
                            Store (0x03B0, VIMN)
                            Store (0x03DF, VIMX)
                            Store (0x30, VILN)
                        }
                    }
                }

                And (\_SB.PCI0.K801.IB01, 0x03, Local0)
                And (\_SB.PCI0.K801.IL01, 0x30, Local1)
                ShiftRight (Local1, 0x04, Local1)
                If (LEqual (Local0, 0x03))
                {
                    If (LEqual (Local1, 0x00))
                    {
                        And (\_SB.PCI0.K801.IB01, 0x10, Local1)
                        ShiftLeft (\_SB.PCI0.K801.IBV1, 0x0C, IOMN)
                        ShiftLeft (\_SB.PCI0.K801.ILV1, 0x0C, IOMX)
                        Or (IOMX, 0x0FFF, IOMX)
                        Subtract (IOMX, IOMN, IOLN)
                        Increment (IOLN)
                        If (LEqual (Local1, 0x10))
                        {
                            Store (0x03B0, VIMN)
                            Store (0x03DF, VIMX)
                            Store (0x30, VILN)
                        }
                    }
                }

                And (\_SB.PCI0.K801.IB02, 0x03, Local0)
                And (\_SB.PCI0.K801.IL02, 0x30, Local1)
                ShiftRight (Local1, 0x04, Local1)
                If (LEqual (Local0, 0x03))
                {
                    If (LEqual (Local1, 0x00))
                    {
                        And (\_SB.PCI0.K801.IB02, 0x10, Local1)
                        ShiftLeft (\_SB.PCI0.K801.IBV2, 0x0C, IOMN)
                        ShiftLeft (\_SB.PCI0.K801.ILV2, 0x0C, IOMX)
                        Or (IOMX, 0x0FFF, IOMX)
                        Subtract (IOMX, IOMN, IOLN)
                        Increment (IOLN)
                        If (LEqual (Local1, 0x10))
                        {
                            Store (0x03B0, VIMN)
                            Store (0x03DF, VIMX)
                            Store (0x30, VILN)
                        }
                    }
                }

                And (\_SB.PCI0.K801.IB03, 0x03, Local0)
                And (\_SB.PCI0.K801.IL03, 0x30, Local1)
                ShiftRight (Local1, 0x04, Local1)
                If (LEqual (Local0, 0x03))
                {
                    If (LEqual (Local1, 0x00))
                    {
                        And (\_SB.PCI0.K801.IB03, 0x10, Local1)
                        ShiftLeft (\_SB.PCI0.K801.IBV3, 0x0C, IOMN)
                        ShiftLeft (\_SB.PCI0.K801.ILV3, 0x0C, IOMX)
                        Or (IOMX, 0x0FFF, IOMX)
                        Subtract (IOMX, IOMN, IOLN)
                        Increment (IOLN)
                        If (LEqual (Local1, 0x10))
                        {
                            Store (0x03B0, VIMN)
                            Store (0x03DF, VIMX)
                            Store (0x30, VILN)
                        }
                    }
                }

                CreateDWordField (BUF0, 0x66, M0MN)
                CreateDWordField (BUF0, 0x6E, M0MX)
                CreateDWordField (BUF0, 0x7E, M0LN)
                CreateDWordField (BUF0, 0x94, M1MN)
                CreateDWordField (BUF0, 0x9C, M1MX)
                CreateDWordField (BUF0, 0xAC, M1LN)
                CreateDWordField (BUF0, 0xC2, M2MN)
                CreateDWordField (BUF0, 0xCA, M2MX)
                CreateDWordField (BUF0, 0xDA, M2LN)
                And (\_SB.PCI0.K801.MB00, 0x03, Local0)
                And (\_SB.PCI0.K801.ML00, 0x30, Local1)
                ShiftRight (Local1, 0x04, Local1)
                If (LEqual (Local0, 0x03))
                {
                    And (\_SB.PCI0.K801.ML00, 0x80, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        If (LEqual (Local1, 0x00))
                        {
                            If (LEqual (M0LN, 0x00))
                            {
                                ShiftLeft (\_SB.PCI0.K801.MBV0, 0x10, M0MN)
                                ShiftLeft (\_SB.PCI0.K801.MLV0, 0x10, M0MX)
                                Or (M0MX, 0xFFFF, M0MX)
                                Subtract (M0MX, M0MN, M0LN)
                                Increment (M0LN)
                            }
                            Else
                            {
                                If (LEqual (M1LN, 0x00))
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV0, 0x10, M1MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV0, 0x10, M1MX)
                                    Or (M1MX, 0xFFFF, M1MX)
                                    Subtract (M1MX, M1MN, M1LN)
                                    Increment (M1LN)
                                }
                                Else
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV0, 0x10, M2MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV0, 0x10, M2MX)
                                    Or (M2MX, 0xFFFF, M2MX)
                                    Subtract (M2MX, M2MN, M2LN)
                                    Increment (M2LN)
                                }
                            }
                        }
                    }
                }

                And (\_SB.PCI0.K801.MB01, 0x03, Local0)
                And (\_SB.PCI0.K801.ML01, 0x30, Local1)
                ShiftRight (Local1, 0x04, Local1)
                If (LEqual (Local0, 0x03))
                {
                    And (\_SB.PCI0.K801.ML01, 0x80, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        If (LEqual (Local1, 0x00))
                        {
                            If (LEqual (M0LN, 0x00))
                            {
                                ShiftLeft (\_SB.PCI0.K801.MBV1, 0x10, M0MN)
                                ShiftLeft (\_SB.PCI0.K801.MLV1, 0x10, M0MX)
                                Or (M0MX, 0xFFFF, M0MX)
                                Subtract (M0MX, M0MN, M0LN)
                                Increment (M0LN)
                            }
                            Else
                            {
                                If (LEqual (M1LN, 0x00))
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV1, 0x10, M1MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV1, 0x10, M1MX)
                                    Or (M1MX, 0xFFFF, M1MX)
                                    Subtract (M1MX, M1MN, M1LN)
                                    Increment (M1LN)
                                }
                                Else
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV1, 0x10, M2MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV1, 0x10, M2MX)
                                    Or (M2MX, 0xFFFF, M2MX)
                                    Subtract (M2MX, M2MN, M2LN)
                                    Increment (M2LN)
                                }
                            }
                        }
                    }
                }

                And (\_SB.PCI0.K801.MB02, 0x03, Local0)
                And (\_SB.PCI0.K801.ML02, 0x30, Local1)
                ShiftRight (Local1, 0x04, Local1)
                If (LEqual (Local0, 0x03))
                {
                    And (\_SB.PCI0.K801.ML02, 0x80, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        If (LEqual (Local1, 0x00))
                        {
                            If (LEqual (M0LN, 0x00))
                            {
                                ShiftLeft (\_SB.PCI0.K801.MBV2, 0x10, M0MN)
                                ShiftLeft (\_SB.PCI0.K801.MLV2, 0x10, M0MX)
                                Or (M0MX, 0xFFFF, M0MX)
                                Subtract (M0MX, M0MN, M0LN)
                                Increment (M0LN)
                            }
                            Else
                            {
                                If (LEqual (M1LN, 0x00))
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV2, 0x10, M1MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV2, 0x10, M1MX)
                                    Or (M1MX, 0xFFFF, M1MX)
                                    Subtract (M1MX, M1MN, M1LN)
                                    Increment (M1LN)
                                }
                                Else
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV2, 0x10, M2MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV2, 0x10, M2MX)
                                    Or (M2MX, 0xFFFF, M2MX)
                                    Subtract (M2MX, M2MN, M2LN)
                                    Increment (M2LN)
                                }
                            }
                        }
                    }
                }

                And (\_SB.PCI0.K801.MB03, 0x03, Local0)
                And (\_SB.PCI0.K801.ML03, 0x30, Local1)
                ShiftRight (Local1, 0x04, Local1)
                If (LEqual (Local0, 0x03))
                {
                    And (\_SB.PCI0.K801.ML03, 0x80, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        If (LEqual (Local1, 0x00))
                        {
                            If (LEqual (M0LN, 0x00))
                            {
                                ShiftLeft (\_SB.PCI0.K801.MBV3, 0x10, M0MN)
                                ShiftLeft (\_SB.PCI0.K801.MLV3, 0x10, M0MX)
                                Or (M0MX, 0xFFFF, M0MX)
                                Subtract (M0MX, M0MN, M0LN)
                                Increment (M0LN)
                            }
                            Else
                            {
                                If (LEqual (M1LN, 0x00))
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV3, 0x10, M1MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV3, 0x10, M1MX)
                                    Or (M1MX, 0xFFFF, M1MX)
                                    Subtract (M1MX, M1MN, M1LN)
                                    Increment (M1LN)
                                }
                                Else
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV3, 0x10, M2MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV3, 0x10, M2MX)
                                    Or (M2MX, 0xFFFF, M2MX)
                                    Subtract (M2MX, M2MN, M2LN)
                                    Increment (M2LN)
                                }
                            }
                        }
                    }
                }

                And (\_SB.PCI0.K801.MB04, 0x03, Local0)
                And (\_SB.PCI0.K801.ML04, 0x30, Local1)
                ShiftRight (Local1, 0x04, Local1)
                If (LEqual (Local0, 0x03))
                {
                    And (\_SB.PCI0.K801.ML04, 0x80, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        If (LEqual (Local1, 0x00))
                        {
                            If (LEqual (M0LN, 0x00))
                            {
                                ShiftLeft (\_SB.PCI0.K801.MBV4, 0x10, M0MN)
                                ShiftLeft (\_SB.PCI0.K801.MLV4, 0x10, M0MX)
                                Or (M0MX, 0xFFFF, M0MX)
                                Subtract (M0MX, M0MN, M0LN)
                                Increment (M0LN)
                            }
                            Else
                            {
                                If (LEqual (M1LN, 0x00))
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV4, 0x10, M1MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV4, 0x10, M1MX)
                                    Or (M1MX, 0xFFFF, M1MX)
                                    Subtract (M1MX, M1MN, M1LN)
                                    Increment (M1LN)
                                }
                                Else
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV4, 0x10, M2MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV4, 0x10, M2MX)
                                    Or (M2MX, 0xFFFF, M2MX)
                                    Subtract (M2MX, M2MN, M2LN)
                                    Increment (M2LN)
                                }
                            }
                        }
                    }
                }

                And (\_SB.PCI0.K801.MB05, 0x03, Local0)
                And (\_SB.PCI0.K801.ML05, 0x30, Local1)
                ShiftRight (Local1, 0x04, Local1)
                If (LEqual (Local0, 0x03))
                {
                    And (\_SB.PCI0.K801.ML05, 0x80, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        If (LEqual (Local1, 0x00))
                        {
                            If (LEqual (M0LN, 0x00))
                            {
                                ShiftLeft (\_SB.PCI0.K801.MBV5, 0x10, M0MN)
                                ShiftLeft (\_SB.PCI0.K801.MLV5, 0x10, M0MX)
                                Or (M0MX, 0xFFFF, M0MX)
                                Subtract (M0MX, M0MN, M0LN)
                                Increment (M0LN)
                            }
                            Else
                            {
                                If (LEqual (M1LN, 0x00))
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV5, 0x10, M1MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV5, 0x10, M1MX)
                                    Or (M1MX, 0xFFFF, M1MX)
                                    Subtract (M1MX, M1MN, M1LN)
                                    Increment (M1LN)
                                }
                                Else
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV5, 0x10, M2MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV5, 0x10, M2MX)
                                    Or (M2MX, 0xFFFF, M2MX)
                                    Subtract (M2MX, M2MN, M2LN)
                                    Increment (M2LN)
                                }
                            }
                        }
                    }
                }

                And (\_SB.PCI0.K801.MB06, 0x03, Local0)
                And (\_SB.PCI0.K801.ML06, 0x30, Local1)
                ShiftRight (Local1, 0x04, Local1)
                If (LEqual (Local0, 0x03))
                {
                    And (\_SB.PCI0.K801.ML06, 0x80, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        If (LEqual (Local1, 0x00))
                        {
                            If (LEqual (M0LN, 0x00))
                            {
                                ShiftLeft (\_SB.PCI0.K801.MBV6, 0x10, M0MN)
                                ShiftLeft (\_SB.PCI0.K801.MLV6, 0x10, M0MX)
                                Or (M0MX, 0xFFFF, M0MX)
                                Subtract (M0MX, M0MN, M0LN)
                                Increment (M0LN)
                            }
                            Else
                            {
                                If (LEqual (M1LN, 0x00))
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV6, 0x10, M1MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV6, 0x10, M1MX)
                                    Or (M1MX, 0xFFFF, M1MX)
                                    Subtract (M1MX, M1MN, M1LN)
                                    Increment (M1LN)
                                }
                                Else
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV6, 0x10, M2MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV6, 0x10, M2MX)
                                    Or (M2MX, 0xFFFF, M2MX)
                                    Subtract (M2MX, M2MN, M2LN)
                                    Increment (M2LN)
                                }
                            }
                        }
                    }
                }

                And (\_SB.PCI0.K801.MB07, 0x03, Local0)
                And (\_SB.PCI0.K801.ML07, 0x30, Local1)
                ShiftRight (Local1, 0x04, Local1)
                If (LEqual (Local0, 0x03))
                {
                    And (\_SB.PCI0.K801.ML07, 0x80, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        If (LEqual (Local1, 0x00))
                        {
                            If (LEqual (M0LN, 0x00))
                            {
                                ShiftLeft (\_SB.PCI0.K801.MBV7, 0x10, M0MN)
                                ShiftLeft (\_SB.PCI0.K801.MLV7, 0x10, M0MX)
                                Or (M0MX, 0xFFFF, M0MX)
                                Subtract (M0MX, M0MN, M0LN)
                                Increment (M0LN)
                            }
                            Else
                            {
                                If (LEqual (M1LN, 0x00))
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV7, 0x10, M1MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV7, 0x10, M1MX)
                                    Or (M1MX, 0xFFFF, M1MX)
                                    Subtract (M1MX, M1MN, M1LN)
                                    Increment (M1LN)
                                }
                                Else
                                {
                                    ShiftLeft (\_SB.PCI0.K801.MBV7, 0x10, M2MN)
                                    ShiftLeft (\_SB.PCI0.K801.MLV7, 0x10, M2MX)
                                    Or (M2MX, 0xFFFF, M2MX)
                                    Subtract (M2MX, M2MN, M2LN)
                                    Increment (M2LN)
                                }
                            }
                        }
                    }
                }

                Return (BUF0)
            }

            Name (PICM, Package (0x1B)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    \_SB.PCI0.LSMB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x01, 
                    \_SB.PCI0.LSMB, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x00, 
                    \_SB.PCI0.LUBA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x01, 
                    \_SB.PCI0.LUB2, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x00, 
                    \_SB.PCI0.LMAC, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x00, 
                    \_SB.PCI0.LACI, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x01, 
                    \_SB.PCI0.LMCI, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x00, 
                    \_SB.PCI0.LIDE, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    0x00, 
                    \_SB.PCI0.LSID, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x00, 
                    \_SB.PCI0.LFID, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0017FFFF, 
                    0x00, 
                    \_SB.PCI0.LPCA, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000EFFFF, 
                    0x00, 
                    \_SB.PCI0.LNK3, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000EFFFF, 
                    0x01, 
                    \_SB.PCI0.LNK4, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000EFFFF, 
                    0x02, 
                    \_SB.PCI0.LNK4, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000EFFFF, 
                    0x03, 
                    \_SB.PCI0.LNK2, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000DFFFF, 
                    0x00, 
                    \_SB.PCI0.LNK4, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000DFFFF, 
                    0x01, 
                    \_SB.PCI0.LNK1, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000DFFFF, 
                    0x02, 
                    \_SB.PCI0.LNK1, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000DFFFF, 
                    0x03, 
                    \_SB.PCI0.LNK3, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    0x00, 
                    \_SB.PCI0.LNK1, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    0x01, 
                    \_SB.PCI0.LNK2, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    0x02, 
                    \_SB.PCI0.LNK2, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    0x03, 
                    \_SB.PCI0.LNK4, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x00, 
                    \_SB.PCI0.LNK2, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x01, 
                    \_SB.PCI0.LNK3, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x02, 
                    \_SB.PCI0.LNK3, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x03, 
                    \_SB.PCI0.LNK1, 
                    0x00
                }
            })
            Name (APIC, Package (0x1B)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    0x00, 
                    \_SB.PCI0.APCS, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x01, 
                    \_SB.PCI0.APCS, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x00, 
                    \_SB.PCI0.APCF, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x01, 
                    \_SB.PCI0.APCL, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000AFFFF, 
                    0x00, 
                    \_SB.PCI0.APCH, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x00, 
                    \_SB.PCI0.APCJ, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0004FFFF, 
                    0x01, 
                    \_SB.PCI0.APCK, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0006FFFF, 
                    0x00, 
                    \_SB.PCI0.APCZ, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0007FFFF, 
                    0x00, 
                    \_SB.PCI0.APSI, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x00, 
                    \_SB.PCI0.APSJ, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x0017FFFF, 
                    0x00, 
                    \_SB.PCI0.APCP, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000EFFFF, 
                    0x00, 
                    \_SB.PCI0.APC3, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000EFFFF, 
                    0x01, 
                    \_SB.PCI0.APC4, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000EFFFF, 
                    0x02, 
                    \_SB.PCI0.APC1, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000EFFFF, 
                    0x03, 
                    \_SB.PCI0.APC2, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000DFFFF, 
                    0x00, 
                    \_SB.PCI0.APC4, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000DFFFF, 
                    0x01, 
                    \_SB.PCI0.APC1, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000DFFFF, 
                    0x02, 
                    \_SB.PCI0.APC2, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000DFFFF, 
                    0x03, 
                    \_SB.PCI0.APC3, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    0x00, 
                    \_SB.PCI0.APC1, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    0x01, 
                    \_SB.PCI0.APC2, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    0x02, 
                    \_SB.PCI0.APC3, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000CFFFF, 
                    0x03, 
                    \_SB.PCI0.APC4, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x00, 
                    \_SB.PCI0.APC2, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x01, 
                    \_SB.PCI0.APC3, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x02, 
                    \_SB.PCI0.APC4, 
                    0x00
                }, 

                Package (0x04)
                {
                    0x000BFFFF, 
                    0x03, 
                    \_SB.PCI0.APC1, 
                    0x00
                }
            })
            Method (_PRT, 0, NotSerialized)
            {
                If (LNot (PICF))
                {
                    Return (PICM)
                }
                Else
                {
                    Return (APIC)
                }
            }

            Device (HUB0)
            {
                Name (_ADR, 0x00090000)
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }

                Name (PICM, Package (0x1C)
                {
                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x00, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x01, 
                        \_SB.PCI0.LNK2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x02, 
                        \_SB.PCI0.LNK3, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x03, 
                        \_SB.PCI0.LNK4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x00, 
                        \_SB.PCI0.LNK2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x01, 
                        \_SB.PCI0.LNK3, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x02, 
                        \_SB.PCI0.LNK4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x03, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        0x00, 
                        \_SB.PCI0.LNK3, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        0x01, 
                        \_SB.PCI0.LNK4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        0x02, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        0x03, 
                        \_SB.PCI0.LNK2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x00, 
                        \_SB.PCI0.LNK4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x01, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x02, 
                        \_SB.PCI0.LNK2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x03, 
                        \_SB.PCI0.LNK3, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        0x00, 
                        \_SB.PCI0.LNK4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        0x01, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        0x02, 
                        \_SB.PCI0.LNK2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        0x03, 
                        \_SB.PCI0.LNK3, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000CFFFF, 
                        0x00, 
                        \_SB.PCI0.LNK4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000CFFFF, 
                        0x01, 
                        \_SB.PCI0.LNK4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000CFFFF, 
                        0x02, 
                        \_SB.PCI0.LNK4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000CFFFF, 
                        0x03, 
                        \_SB.PCI0.LNK4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000DFFFF, 
                        0x00, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000DFFFF, 
                        0x01, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000DFFFF, 
                        0x02, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000DFFFF, 
                        0x03, 
                        \_SB.PCI0.LNK1, 
                        0x00
                    }
                })
                Name (APIC, Package (0x1C)
                {
                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x00, 
                        \_SB.PCI0.APC1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x01, 
                        \_SB.PCI0.APC2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x02, 
                        \_SB.PCI0.APC3, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0006FFFF, 
                        0x03, 
                        \_SB.PCI0.APC4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x00, 
                        \_SB.PCI0.APC2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x01, 
                        \_SB.PCI0.APC3, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x02, 
                        \_SB.PCI0.APC4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0007FFFF, 
                        0x03, 
                        \_SB.PCI0.APC1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        0x00, 
                        \_SB.PCI0.APC3, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        0x01, 
                        \_SB.PCI0.APC4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        0x02, 
                        \_SB.PCI0.APC1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0008FFFF, 
                        0x03, 
                        \_SB.PCI0.APC2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x00, 
                        \_SB.PCI0.APC4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x01, 
                        \_SB.PCI0.APC1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x02, 
                        \_SB.PCI0.APC2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x0009FFFF, 
                        0x03, 
                        \_SB.PCI0.APC3, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        0x00, 
                        \_SB.PCI0.APC4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        0x01, 
                        \_SB.PCI0.APC1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        0x02, 
                        \_SB.PCI0.APC2, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000BFFFF, 
                        0x03, 
                        \_SB.PCI0.APC3, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000CFFFF, 
                        0x00, 
                        \_SB.PCI0.APC4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000CFFFF, 
                        0x01, 
                        \_SB.PCI0.APC4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000CFFFF, 
                        0x02, 
                        \_SB.PCI0.APC4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000CFFFF, 
                        0x03, 
                        \_SB.PCI0.APC4, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000DFFFF, 
                        0x00, 
                        \_SB.PCI0.APC1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000DFFFF, 
                        0x01, 
                        \_SB.PCI0.APC1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000DFFFF, 
                        0x02, 
                        \_SB.PCI0.APC1, 
                        0x00
                    }, 

                    Package (0x04)
                    {
                        0x000DFFFF, 
                        0x03, 
                        \_SB.PCI0.APC1, 
                        0x00
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (LNot (PICF))
                    {
                        Return (PICM)
                    }
                    Else
                    {
                        Return (APIC)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x00, 
                    0x05
                })
            }

            Device (SAT1)
            {
                Name (_ADR, 0x00070000)
                Device (PRI0)
                {
                    Name (_ADR, 0x00)
                    Name (SPTM, Buffer (0x14)
                    {
                        0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        0x13, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SPTM)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SEC0)
                {
                    Name (_ADR, 0x01)
                    Name (SSTM, Buffer (0x14)
                    {
                        0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        0x13, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SSTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SSTM)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Method (DRMP, 0, NotSerialized)
                {
                    Return (\_SB.PCI0.NVRB.R_S0)
                }
            }

            Device (SAT2)
            {
                Name (_ADR, 0x00080000)
                Device (PRI0)
                {
                    Name (_ADR, 0x00)
                    Name (SPTM, Buffer (0x14)
                    {
                        0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        0x13, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SPTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SPTM)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Device (SEC0)
                {
                    Name (_ADR, 0x01)
                    Name (SSTM, Buffer (0x14)
                    {
                        0x78, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 
                        0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 
                        0x13, 0x00, 0x00, 0x00
                    })
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (SSTM)
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        Store (Arg0, SSTM)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Store (Buffer (0x07)
                                {
                                    0x03, 0x46, 0x00, 0x00, 0x00, 0xA0, 0xEF
                                }, Local0)
                            Return (Local0)
                        }
                    }
                }

                Method (DRMP, 0, NotSerialized)
                {
                    Return (\_SB.PCI0.NVRB.R_S1)
                }
            }

            Device (IDE0)
            {
                Name (_ADR, 0x00060000)
                OperationRegion (A090, PCI_Config, 0x50, 0x18)
                Field (A090, DWordAcc, NoLock, Preserve)
                {
                    ID20,   16, 
                    Offset (0x08), 
                    IDTS,   16, 
                    IDTP,   16, 
                    ID22,   32, 
                    UMSS,   16, 
                    UMSP,   16
                }

                Name (IDEP, Buffer (0x14) {})
                Name (IDES, Buffer (0x14) {})
                Method (GTM, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (IDTP, Local0)
                        Store (UMSP, Local1)
                        Store (IDEP, Local2)
                    }
                    Else
                    {
                        Store (IDTS, Local0)
                        Store (UMSS, Local1)
                        Store (IDES, Local2)
                    }

                    CreateDWordField (Local2, 0x00, PIO0)
                    CreateDWordField (Local2, 0x04, DMA0)
                    CreateDWordField (Local2, 0x08, PIO1)
                    CreateDWordField (Local2, 0x0C, DMA1)
                    CreateDWordField (Local2, 0x10, FLAG)
                    Store (0x10, FLAG)
                    And (Local0, 0x0F00, Local3)
                    And (Local0, 0xF000, Local4)
                    ShiftRight (Local3, 0x08, Local3)
                    ShiftRight (Local4, 0x0C, Local4)
                    Add (Local3, Local4, Local3)
                    Multiply (Add (Local3, 0x02), 0x1E, PIO0)
                    If (LNot (LGreater (PIO0, 0xB4)))
                    {
                        Or (FLAG, 0x02, FLAG)
                    }

                    If (And (Local1, 0x4000))
                    {
                        Or (FLAG, 0x01, FLAG)
                        And (Local1, 0x0700, Local3)
                        ShiftRight (Local3, 0x08, Local3)
                        Store (U2T (Local3), DMA0)
                    }
                    Else
                    {
                        Store (PIO0, DMA0)
                    }

                    And (Local0, 0x0F, Local3)
                    And (Local0, 0xF0, Local4)
                    ShiftRight (Local4, 0x04, Local4)
                    Add (Local3, Local4, Local3)
                    Multiply (Add (Local3, 0x02), 0x1E, PIO1)
                    If (LNot (LGreater (PIO1, 0xB4)))
                    {
                        Or (FLAG, 0x08, FLAG)
                    }

                    If (And (Local1, 0x40))
                    {
                        Or (FLAG, 0x04, FLAG)
                        And (Local1, 0x07, Local3)
                        Store (U2T (Local3), DMA1)
                    }
                    Else
                    {
                        Store (PIO1, DMA1)
                    }

                    If (LEqual (Arg0, 0x00))
                    {
                        Store (Local2, IDEP)
                        Return (IDEP)
                    }
                    Else
                    {
                        Store (Local2, IDES)
                        Return (IDES)
                    }
                }

                Method (U2T, 1, NotSerialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Return (0x3C)
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        Return (0x5A)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Return (0x78)
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Return (0x96)
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Return (0x2D)
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Return (0x1E)
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Return (0x14)
                    }

                    Return (0x0F)
                }

                Method (T2U, 1, NotSerialized)
                {
                    If (LGreater (Arg0, 0x78))
                    {
                        Return (0x03)
                    }

                    If (LGreater (Arg0, 0x5A))
                    {
                        Return (0x02)
                    }

                    If (LGreater (Arg0, 0x3C))
                    {
                        Return (0x01)
                    }

                    If (LGreater (Arg0, 0x2D))
                    {
                        Return (0x00)
                    }

                    If (LGreater (Arg0, 0x1E))
                    {
                        Return (0x04)
                    }

                    If (LGreater (Arg0, 0x14))
                    {
                        Return (0x05)
                    }

                    If (LGreater (Arg0, 0x0F))
                    {
                        Return (0x06)
                    }

                    Return (0x07)
                }

                Method (T2D, 1, NotSerialized)
                {
                    If (LGreater (Arg0, 0x01E0))
                    {
                        Return (0xA8)
                    }

                    If (LGreater (Arg0, 0x0186))
                    {
                        Return (0x77)
                    }

                    If (LGreater (Arg0, 0xF0))
                    {
                        Return (0x47)
                    }

                    If (LGreater (Arg0, 0xB4))
                    {
                        Return (0x33)
                    }

                    If (LGreater (Arg0, 0x96))
                    {
                        Return (0x22)
                    }

                    If (LGreater (Arg0, 0x78))
                    {
                        Return (0x21)
                    }

                    Return (0x20)
                }

                Method (STM, 4, NotSerialized)
                {
                    If (SX)
                    {
                        Store (SID0, ID20)
                        Store (SID1, IDTS)
                        Store (SID2, IDTP)
                        Store (SID3, ID22)
                        Store (SID4, UMSS)
                        Store (SID5, UMSP)
                    }
                    Else
                    {
                        Store (ID20, SID0)
                        Store (IDTS, SID1)
                        Store (IDTP, SID2)
                        Store (ID22, SID3)
                        Store (UMSS, SID4)
                        Store (UMSP, SID5)
                    }

                    Store (0x00, SX)
                    CreateDWordField (Arg0, 0x00, PIO0)
                    CreateDWordField (Arg0, 0x04, DMA0)
                    CreateDWordField (Arg0, 0x08, PIO1)
                    CreateDWordField (Arg0, 0x0C, DMA1)
                    CreateDWordField (Arg0, 0x10, FLAG)
                    If (LEqual (Arg3, 0x00))
                    {
                        Store (SID2, Local0)
                        Store (SID5, Local1)
                    }
                    Else
                    {
                        Store (SID1, Local0)
                        Store (SID4, Local1)
                    }

                    If (LNot (LEqual (PIO0, 0xFFFFFFFF)))
                    {
                        And (Local0, 0xFF, Local0)
                        ShiftLeft (T2D (PIO0), 0x08, Local2)
                        Or (Local0, Local2, Local0)
                    }

                    If (LNot (LEqual (PIO1, 0xFFFFFFFF)))
                    {
                        And (Local0, 0xFF00, Local0)
                        Or (Local0, T2D (PIO1), Local0)
                    }

                    If (And (FLAG, 0x01))
                    {
                        And (Local1, 0xFF, Local1)
                        ShiftLeft (T2U (DMA0), 0x08, Local2)
                        Or (0xC000, Local2, Local2)
                        Or (Local2, Local1, Local1)
                    }
                    Else
                    {
                        If (LNot (LEqual (DMA0, 0xFFFFFFFF)))
                        {
                            And (Local0, 0xFF, Local0)
                            ShiftLeft (T2D (DMA0), 0x08, Local2)
                            Or (Local0, Local2, Local0)
                        }
                    }

                    If (And (FLAG, 0x04))
                    {
                        And (Local1, 0xFF00, Local1)
                        Or (0xC0, T2U (DMA1), Local2)
                        Or (Local2, Local1, Local1)
                    }
                    Else
                    {
                        If (LNot (LEqual (DMA1, 0xFFFFFFFF)))
                        {
                            And (Local0, 0xFF00, Local0)
                            Or (Local0, T2D (DMA1), Local0)
                        }
                    }

                    If (LEqual (Arg3, 0x00))
                    {
                        Store (Local0, IDTP)
                        Store (Local1, UMSP)
                    }
                    Else
                    {
                        Store (Local0, IDTS)
                        Store (Local1, UMSS)
                    }
                }

                Method (GTF, 2, NotSerialized)
                {
                    Store (Buffer (0x07)
                        {
                            0x03, 0x00, 0x00, 0x00, 0x00, 0xA0, 0xEF
                        }, Local0)
                    CreateByteField (Local0, 0x01, MODE)
                    CreateByteField (Local0, 0x05, DRIV)
                    Store (Arg1, DRIV)
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (IDEP, Local1)
                    }
                    Else
                    {
                        Store (IDES, Local1)
                    }

                    CreateDWordField (Local1, 0x00, PIO0)
                    CreateDWordField (Local1, 0x04, DMA0)
                    CreateDWordField (Local1, 0x08, PIO1)
                    CreateDWordField (Local1, 0x0C, DMA1)
                    CreateDWordField (Local1, 0x10, FLGX)
                    If (LEqual (Arg1, 0xA0))
                    {
                        Store (PIO0, Local2)
                        Store (DMA0, Local3)
                        And (FLGX, 0x01, FLGX)
                    }
                    Else
                    {
                        Store (PIO1, Local2)
                        Store (DMA1, Local3)
                        And (FLGX, 0x04, FLGX)
                    }

                    Store (FLGX, Local1)
                    If (LGreater (Local2, 0x0186))
                    {
                        Store (0x00, Local2)
                    }
                    Else
                    {
                        If (LGreater (Local2, 0xF0))
                        {
                            Store (0x01, Local2)
                        }
                        Else
                        {
                            If (LGreater (Local2, 0xB4))
                            {
                                Store (0x02, Local2)
                            }
                            Else
                            {
                                If (LGreater (Local2, 0x78))
                                {
                                    Store (0x03, Local2)
                                }
                                Else
                                {
                                    Store (0x04, Local2)
                                }
                            }
                        }
                    }

                    Or (0x08, Local2, MODE)
                    Store (Local0, Local2)
                    If (FLGX)
                    {
                        If (LGreater (Local3, 0x5A))
                        {
                            Store (0x00, Local3)
                        }
                        Else
                        {
                            If (LGreater (Local3, 0x3C))
                            {
                                Store (0x01, Local3)
                            }
                            Else
                            {
                                If (LGreater (Local3, 0x2D))
                                {
                                    Store (0x02, Local3)
                                }
                                Else
                                {
                                    If (LGreater (Local3, 0x1E))
                                    {
                                        Store (0x03, Local3)
                                    }
                                    Else
                                    {
                                        If (LGreater (Local3, 0x14))
                                        {
                                            Store (0x04, Local3)
                                        }
                                        Else
                                        {
                                            If (LGreater (Local3, 0x0F))
                                            {
                                                Store (0x05, Local3)
                                            }
                                            Else
                                            {
                                                Store (0x06, Local3)
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Or (0x40, Local3, MODE)
                    }
                    Else
                    {
                        If (LEqual (Local3, 0xFFFFFFFF))
                        {
                            Return (Local0)
                        }
                        Else
                        {
                            If (LGreater (Local3, 0x96))
                            {
                                Store (0x00, Local3)
                            }
                            Else
                            {
                                If (LGreater (Local3, 0x78))
                                {
                                    Store (0x01, Local3)
                                }
                                Else
                                {
                                    Store (0x02, Local3)
                                }
                            }

                            Or (0x20, Local3, MODE)
                        }
                    }

                    Concatenate (Local0, Local2, Local1)
                    Return (Local1)
                }

                Device (PRI0)
                {
                    Name (_ADR, 0x00)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (GTM (0x00))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        STM (Arg0, Arg1, Arg2, 0x00)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (GTF (0x00, 0xA0))
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (GTF (0x00, 0xB0))
                        }
                    }
                }

                Device (SEC0)
                {
                    Name (_ADR, 0x01)
                    Method (_GTM, 0, NotSerialized)
                    {
                        Return (GTM (0x01))
                    }

                    Method (_STM, 3, NotSerialized)
                    {
                        STM (Arg0, Arg1, Arg2, 0x01)
                    }

                    Device (MAST)
                    {
                        Name (_ADR, 0x00)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (GTF (0x01, 0xA0))
                        }
                    }

                    Device (SLAV)
                    {
                        Name (_ADR, 0x01)
                        Method (_GTF, 0, NotSerialized)
                        {
                            Return (GTF (0x01, 0xB0))
                        }
                    }
                }

                Method (DRMP, 0, NotSerialized)
                {
                    Return (\_SB.PCI0.NVRB.R_P0)
                }
            }

            Device (K800)
            {
                Name (_BBN, 0x00)
                Name (_ADR, 0x00180000)
            }

            Device (K801)
            {
                Name (_BBN, 0x00)
                Name (_ADR, 0x00180001)
                OperationRegion (K181, PCI_Config, 0x00, 0xFF)
                Field (K181, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x80), 
                    MB00,   8, 
                    MBV0,   24, 
                    ML00,   8, 
                    MLV0,   24, 
                    MB01,   8, 
                    MBV1,   24, 
                    ML01,   8, 
                    MLV1,   24, 
                    MB02,   8, 
                    MBV2,   24, 
                    ML02,   8, 
                    MLV2,   24, 
                    MB03,   8, 
                    MBV3,   24, 
                    ML03,   8, 
                    MLV3,   24, 
                    MB04,   8, 
                    MBV4,   24, 
                    ML04,   8, 
                    MLV4,   24, 
                    MB05,   8, 
                    MBV5,   24, 
                    ML05,   8, 
                    MLV5,   24, 
                    MB06,   8, 
                    MBV6,   24, 
                    ML06,   8, 
                    MLV6,   24, 
                    MB07,   8, 
                    MBV7,   24, 
                    ML07,   8, 
                    MLV7,   24, 
                    IB00,   6, 
                        ,   6, 
                    IBV0,   13, 
                    Offset (0xC4), 
                    IL00,   6, 
                        ,   6, 
                    ILV0,   13, 
                    Offset (0xC8), 
                    IB01,   6, 
                        ,   6, 
                    IBV1,   13, 
                    Offset (0xCC), 
                    IL01,   6, 
                        ,   6, 
                    ILV1,   13, 
                    Offset (0xD0), 
                    IB02,   6, 
                        ,   6, 
                    IBV2,   13, 
                    Offset (0xD4), 
                    IL02,   6, 
                        ,   6, 
                    ILV2,   13, 
                    Offset (0xD8), 
                    IB03,   6, 
                        ,   6, 
                    IBV3,   13, 
                    Offset (0xDC), 
                    IL03,   6, 
                        ,   6, 
                    ILV3,   13, 
                    Offset (0xE0), 
                    L0EN,   8, 
                    DL00,   8, 
                    BNB0,   8, 
                    BNL0,   8, 
                    L1EN,   8, 
                    DL01,   8, 
                    BNB1,   8, 
                    BNL1,   8, 
                    L2EN,   8, 
                    DL02,   8, 
                    BNB2,   8, 
                    BNL2,   8, 
                    L3EN,   8, 
                    DL03,   8, 
                    BNB3,   8, 
                    BNL3,   8
                }
            }

            Device (K802)
            {
                Name (_BBN, 0x00)
                Name (_ADR, 0x00180002)
            }

            Device (K810)
            {
                Name (_BBN, 0x00)
                Name (_ADR, 0x00190000)
            }

            Device (K811)
            {
                Name (_BBN, 0x00)
                Name (_ADR, 0x00190001)
                OperationRegion (K281, PCI_Config, 0x00, 0xFF)
                Field (K281, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x80), 
                    MB00,   8, 
                    MBV0,   24, 
                    ML00,   8, 
                    MLV0,   24, 
                    MB01,   8, 
                    MBV1,   24, 
                    ML01,   8, 
                    MLV1,   24, 
                    MB02,   8, 
                    MBV2,   24, 
                    ML02,   8, 
                    MLV2,   24, 
                    MB03,   8, 
                    MBV3,   24, 
                    ML03,   8, 
                    MLV3,   24, 
                    MB04,   8, 
                    MBV4,   24, 
                    ML04,   8, 
                    MLV4,   24, 
                    MB05,   8, 
                    MBV5,   24, 
                    ML05,   8, 
                    MLV5,   24, 
                    MB06,   8, 
                    MBV6,   24, 
                    ML06,   8, 
                    MLV6,   24, 
                    MB07,   8, 
                    MBV7,   24, 
                    ML07,   8, 
                    MLV7,   24, 
                    IB00,   6, 
                        ,   6, 
                    IBV0,   13, 
                    Offset (0xC4), 
                    IL00,   6, 
                        ,   6, 
                    ILV0,   13, 
                    Offset (0xC8), 
                    IB01,   6, 
                        ,   6, 
                    IBV1,   13, 
                    Offset (0xCC), 
                    IL01,   6, 
                        ,   6, 
                    ILV1,   13, 
                    Offset (0xD0), 
                    IB02,   6, 
                        ,   6, 
                    IBV2,   13, 
                    Offset (0xD4), 
                    IL02,   6, 
                        ,   6, 
                    ILV2,   13, 
                    Offset (0xD8), 
                    IB03,   6, 
                        ,   6, 
                    IBV3,   13, 
                    Offset (0xDC), 
                    IL03,   6, 
                        ,   6, 
                    ILV3,   13, 
                    Offset (0xE0), 
                    L0EN,   8, 
                    DL00,   8, 
                    BNB0,   8, 
                    BNL0,   8, 
                    L1EN,   8, 
                    DL01,   8, 
                    BNB1,   8, 
                    BNL1,   8, 
                    L2EN,   8, 
                    DL02,   8, 
                    BNB2,   8, 
                    BNL2,   8, 
                    L3EN,   8, 
                    DL03,   8, 
                    BNB3,   8, 
                    BNL3,   8
                }
            }

            Device (K812)
            {
                Name (_BBN, 0x00)
                Name (_ADR, 0x00190002)
            }

            Device (XVR0)
            {
                Name (_ADR, 0x000E0000)
                OperationRegion (PCV0, PCI_Config, 0x00, 0xFF)
                Scope (\)
                {
                    Field (\_SB.PCI0.XVR0.PCV0, ByteAcc, NoLock, Preserve)
                    {
                        PEV0,   16, 
                        Offset (0x9C), 
                            ,   3, 
                        XPE0,   1, 
                        Offset (0xA0), 
                        RQD0,   16, 
                        PES0,   1, 
                        PEP0,   1
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x11, 
                    0x05
                })
            }

            Device (XVR1)
            {
                Name (_ADR, 0x000D0000)
                OperationRegion (PCV1, PCI_Config, 0x00, 0xFF)
                Scope (\)
                {
                    Field (\_SB.PCI0.XVR1.PCV1, ByteAcc, NoLock, Preserve)
                    {
                        PEV1,   16, 
                        Offset (0x9C), 
                            ,   3, 
                        XPE1,   1, 
                        Offset (0xA0), 
                        RQD1,   16, 
                        PES1,   1, 
                        PEP1,   1
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x11, 
                    0x05
                })
            }

            Device (XVR2)
            {
                Name (_ADR, 0x000C0000)
                OperationRegion (PCV2, PCI_Config, 0x00, 0xFF)
                Scope (\)
                {
                    Field (\_SB.PCI0.XVR2.PCV2, ByteAcc, NoLock, Preserve)
                    {
                        PEV2,   16, 
                        Offset (0x9C), 
                            ,   3, 
                        XPE2,   1, 
                        Offset (0xA0), 
                        RQD2,   16, 
                        PES2,   1, 
                        PEP2,   1
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x11, 
                    0x05
                })
            }

            Device (XVR3)
            {
                Name (_ADR, 0x000B0000)
                OperationRegion (PCV3, PCI_Config, 0x00, 0xFF)
                Scope (\)
                {
                    Field (\_SB.PCI0.XVR3.PCV3, ByteAcc, NoLock, Preserve)
                    {
                        PEV3,   16, 
                        Offset (0x9C), 
                            ,   3, 
                        XPE3,   1, 
                        Offset (0xA0), 
                        RQD3,   16, 
                        PES3,   1, 
                        PEP3,   1
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x11, 
                    0x05
                })
            }

            Device (SMB0)
            {
                Name (_ADR, 0x00010001)
                OperationRegion (SMCF, PCI_Config, 0x48, 0x10)
                Field (SMCF, DWordAcc, NoLock, Preserve)
                {
                    SMPM,   4, 
                    SMT1,   28, 
                    SMT2,   32, 
                    SB1,    32, 
                    SB2,    32
                }

                Method (SMBB, 0, NotSerialized)
                {
                    If (PCIA)
                    {
                        And (SB1, 0xFFFE, Local0)
                    }
                    Else
                    {
                        Store (0x4C00, Local0)
                    }

                    Return (Local0)
                }
            }

            Device (VT86)
            {
                Name (_ADR, 0x00010000)
                OperationRegion (PIO0, PCI_Config, 0x04, 0x20)
                Scope (\)
                {
                    Field (\_SB.PCI0.VT86.PIO0, ByteAcc, NoLock, Preserve)
                    {
                        SMEN,   8, 
                        Offset (0x0C), 
                        Offset (0x0D), 
                        SMIO,   8
                    }
                }

                OperationRegion (PIRQ, PCI_Config, 0x7C, 0x0C)
                Scope (\)
                {
                    Field (\_SB.PCI0.VT86.PIRQ, AnyAcc, NoLock, Preserve)
                    {
                        INTA,   4, 
                        INTB,   4, 
                        INTC,   4, 
                        INTD,   4, 
                        INTE,   4, 
                        IS0S,   4, 
                        SSAI,   4, 
                        IPCA,   4, 
                        SCII,   4, 
                        TCOI,   4, 
                        INTF,   4, 
                        INTQ,   4, 
                        INTU,   4, 
                        INTS,   4, 
                        IS0P,   4, 
                        ITID,   4, 
                        INTG,   4, 
                        INTH,   4, 
                        INTJ,   4, 
                        INTK,   4, 
                        INTL,   4, 
                        INTM,   4, 
                        INTN,   4, 
                        INTP,   4
                    }
                }

                OperationRegion (PDEV, PCI_Config, 0xE8, 0x04)
                Scope (\)
                {
                    Field (\_SB.PCI0.VT86.PDEV, AnyAcc, NoLock, Preserve)
                    {
                            ,   12, 
                        ACIE,   1
                    }
                }

                OperationRegion (LPIO, PCI_Config, 0xA0, 0x18)
                Scope (\)
                {
                    Field (\_SB.PCI0.VT86.LPIO, ByteAcc, NoLock, Preserve)
                    {
                        UAIO,   8, 
                        SNDD,   4, 
                        MIDD,   4, 
                        MSSD,   4, 
                        FDCD,   2, 
                        Offset (0x03), 
                        PRIO,   3, 
                            ,   1, 
                        GEN1,   1, 
                        GEN2,   1, 
                        GEN3,   1, 
                        GEN4,   1, 
                        GAM1,   8, 
                        GAM2,   8
                    }

                    OperationRegion (RTC2, SystemIO, 0x72, 0x02)
                    Field (RTC2, ByteAcc, NoLock, Preserve)
                    {
                        CM2I,   8, 
                        CM2D,   8
                    }

                    IndexField (CM2I, CM2D, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0xCC), 
                        UA1D,   8
                    }

                    Name (UARA, 0x00)
                    Name (UARB, 0x00)
                    Method (DISD, 1, NotSerialized)
                    {
                        If (LEqual (Arg0, 0x00))
                        {
                            Store (UARA, Local0)
                            XOr (Local0, 0xFF, Local0)
                            And (UAIO, Local0, UAIO)
                        }

                        If (LEqual (Arg0, 0x01))
                        {
                            Store (UARB, Local0)
                            XOr (Local0, 0xFF, Local0)
                            And (UAIO, Local0, UAIO)
                        }

                        If (LEqual (Arg0, 0x02))
                        {
                            Store (0x00, PRIO)
                        }

                        If (LEqual (Arg0, 0x03))
                        {
                            Store (0x00, FDCD)
                        }

                        If (LEqual (Arg0, 0x04))
                        {
                            Store (0x00, GAM1)
                            Store (0x00, GAM2)
                        }

                        If (LEqual (Arg0, 0x05))
                        {
                            Store (0x00, MIDD)
                        }
                    }

                    Method (CKIO, 2, NotSerialized)
                    {
                        If (LEqual (Arg1, 0x00))
                        {
                            Or (UARA, UARB, Local0)
                            And (UAIO, Local0, UAIO)
                            Store (UARA, Local0)
                            XOr (Local0, 0xFF, Local0)
                            And (UAIO, Local0, UAIO)
                            If (LEqual (Arg0, 0x03F8))
                            {
                                Store (0x01, Local0)
                            }

                            If (LEqual (Arg0, 0x02F8))
                            {
                                Store (0x02, Local0)
                            }

                            If (LEqual (Arg0, 0x02E8))
                            {
                                Store (0x20, Local0)
                            }

                            If (LEqual (Arg0, 0x03E8))
                            {
                                Store (0x80, Local0)
                            }

                            Or (UAIO, Local0, UAIO)
                            Store (Local0, UARA)
                        }

                        If (LEqual (Arg1, 0x01))
                        {
                            Or (UARA, UARB, Local0)
                            And (UAIO, Local0, UAIO)
                            Store (UARB, Local0)
                            XOr (Local0, 0xFF, Local0)
                            And (UAIO, Local0, UAIO)
                            If (LEqual (Arg0, 0x03F8))
                            {
                                Store (0x01, Local0)
                            }

                            If (LEqual (Arg0, 0x02F8))
                            {
                                Store (0x02, Local0)
                            }

                            If (LEqual (Arg0, 0x02E8))
                            {
                                Store (0x20, Local0)
                            }

                            If (LEqual (Arg0, 0x03E8))
                            {
                                Store (0x80, Local0)
                            }

                            Or (UAIO, Local0, UAIO)
                            Store (Local0, UARB)
                        }

                        If (LEqual (Arg1, 0x02))
                        {
                            If (LEqual (Arg0, 0x0378))
                            {
                                Store (0x00, PRIO)
                                Or (PRIO, 0x01, PRIO)
                            }

                            If (LEqual (Arg0, 0x0278))
                            {
                                Store (0x00, PRIO)
                                Or (PRIO, 0x02, PRIO)
                            }

                            If (LEqual (Arg0, 0x03BC))
                            {
                                Store (0x00, PRIO)
                                Or (PRIO, 0x04, PRIO)
                            }
                        }

                        If (LEqual (Arg1, 0x03))
                        {
                            Or (FDCD, 0x01, FDCD)
                        }

                        If (LEqual (Arg1, 0x04))
                        {
                            Store (0x00, GAM1)
                            Store (0x00, GAM2)
                            If (LEqual (Arg0, 0x0201))
                            {
                                Or (GAM1, 0x02, GAM1)
                            }

                            If (LEqual (Arg0, 0x0209))
                            {
                                Or (GAM2, 0x02, GAM2)
                            }
                        }

                        If (LEqual (Arg1, 0x05))
                        {
                            Store (0x00, MIDD)
                            If (LEqual (Arg0, 0x0300))
                            {
                                Or (MIDD, 0x01, MIDD)
                            }

                            If (LEqual (Arg0, 0x0330))
                            {
                                Or (MIDD, 0x08, MIDD)
                            }
                        }
                    }

                    Method (SLDM, 2, NotSerialized)
                    {
                    }

                    Method (CLSU, 1, NotSerialized)
                    {
                        CreateWordField (Arg0, 0x02, UARO)
                        If (LEqual (UARO, 0x03F8))
                        {
                            And (UAIO, 0xFE, UAIO)
                        }

                        If (LEqual (UARO, 0x02F8))
                        {
                            And (UAIO, 0xFD, UAIO)
                        }

                        If (LEqual (UARO, 0x02E8))
                        {
                            And (UAIO, 0xBF, UAIO)
                        }

                        If (LEqual (UARO, 0x03E8))
                        {
                            And (UAIO, 0x7F, UAIO)
                        }
                    }
                }
            }

            Device (USB0)
            {
                Name (_ADR, 0x00020000)
                Method (_S1D, 0, NotSerialized)
                {
                    Return (0x01)
                }

                Method (SS3D, 0, NotSerialized)
                {
                    If (LEqual (OSFL, 0x02))
                    {
                        Return (0x02)
                    }
                    Else
                    {
                        Return (0x03)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x0D, 
                    0x03
                })
            }

            Device (USB2)
            {
                Name (_ADR, 0x00020001)
                OperationRegion (P020, PCI_Config, 0x49, 0x01)
                Field (P020, AnyAcc, NoLock, Preserve)
                {
                    U0WK,   1
                }

                Method (_PSW, 1, NotSerialized)
                {
                    If (Arg0)
                    {
                        Store (0x01, U0WK)
                    }
                    Else
                    {
                        Store (0x00, U0WK)
                    }
                }

                Method (_S1D, 0, NotSerialized)
                {
                    Return (0x01)
                }

                Method (SS3D, 0, NotSerialized)
                {
                    Return (0x01)
                }

                Name (_PRW, Package (0x02)
                {
                    0x05, 
                    0x03
                })
            }

            Device (MMAC)
            {
                Name (_ADR, 0x000A0000)
                Name (_PRW, Package (0x02)
                {
                    0x0B, 
                    0x05
                })
            }

            Device (MACI)
            {
                Method (_ADR, 0, NotSerialized)
                {
                    If (ACIE)
                    {
                        Return (0x00040001)
                    }
                    Else
                    {
                        Return (0x00040000)
                    }
                }
            }

            Device (MMCI)
            {
                Method (_ADR, 0, NotSerialized)
                {
                    If (ACIE)
                    {
                        Return (0x00040000)
                    }
                    Else
                    {
                        Return (0x00040001)
                    }
                }

                Name (_PRW, Package (0x02)
                {
                    0x07, 
                    0x05
                })
            }

            Device (NVRB)
            {
                Name (_HID, "_NVRAIDBUS")
                OperationRegion (NVRD, SystemMemory, 0x000FFF38, 0x02)
                Field (NVRD, ByteAcc, NoLock, Preserve)
                {
                    R_ST,   1, 
                        ,   3, 
                    R_P0,   4, 
                    R_S0,   4, 
                    R_S1,   4
                }

                Name (FNVR, 0xFF)
                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, FNVR)
                }

                Method (_STA, 0, NotSerialized)
                {
                    If (LEqual (R_ST, 0x01))
                    {
                        If (LEqual (FNVR, 0xFF))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (0x0D)
                        }
                    }
                    Else
                    {
                        Return (0x00)
                    }
                }

                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x04D2,             // Address Range Minimum
                        0x04D2,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x01,               // Address Length
                        )
                })
            }

            Name (BUFA, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared)
                    {3,4,5,7,9,10,11,12,14,15}
            })
            Name (BUFB, ResourceTemplate ()
            {
                IRQ (Level, ActiveLow, Shared)
                    {}
            })
            CreateWordField (BUFB, 0x01, IRQV)
            Method (CRS, 1, NotSerialized)
            {
                If (Arg0)
                {
                    ShiftLeft (0x01, Arg0, IRQV)
                }
                Else
                {
                    Store (Zero, IRQV)
                }

                Return (BUFB)
            }

            Method (SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, 0x01, IRQ0)
                FindSetRightBit (IRQ0, Local0)
                Decrement (Local0)
                Return (Local0)
            }

            Method (CRSB, 1, NotSerialized)
            {
                If (LEqual (Arg0, 0x01))
                {
                    Return (0x11)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (0x12)
                }

                If (LEqual (Arg0, 0x08))
                {
                    Return (0x10)
                }

                If (LEqual (Arg0, 0x0D))
                {
                    Return (0x13)
                }

                Return (Arg0)
            }

            Method (CRSA, 1, Serialized)
            {
                Store (0x00, Local0)
                If (LEqual (Arg0, 0x08))
                {
                    Store (0x14, Local0)
                }

                If (LEqual (Arg0, 0x0D))
                {
                    Store (0x15, Local0)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Store (0x16, Local0)
                }

                If (LEqual (Arg0, 0x01))
                {
                    Store (0x17, Local0)
                }

                Name (IRZ5, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,,)
                    {
                        0x00000007,
                    }
                })
                CreateWordField (IRZ5, 0x05, INZ5)
                Store (Local0, INZ5)
                Return (IRZ5)
            }

            Method (SRSA, 1, Serialized)
            {
                CreateWordField (Arg0, 0x05, INZ6)
                Store (0x08, Local0)
                If (LEqual (INZ6, 0x14))
                {
                    Store (0x08, Local0)
                }

                If (LEqual (INZ6, 0x15))
                {
                    Store (0x0D, Local0)
                }

                If (LEqual (INZ6, 0x16))
                {
                    Store (0x02, Local0)
                }

                If (LEqual (INZ6, 0x17))
                {
                    Store (0x01, Local0)
                }

                Return (Local0)
            }

            Device (LNK1)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x01)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTA)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTA)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTA))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTA)
                }
            }

            Device (LNK2)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x02)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTB)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTB)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTB))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTB)
                }
            }

            Device (LNK3)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x03)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTC)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTC)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTC))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTC)
                }
            }

            Device (LNK4)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x04)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTD)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTD)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTD))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTD)
                }
            }

            Device (LNK5)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x05)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTE)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTE)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTE))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTE)
                }
            }

            Device (LUBA)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x06)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTG)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTG)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTG))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTG)
                }
            }

            Device (LUBB)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x07)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTH)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTH)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTH))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTH)
                }
            }

            Device (LMAC)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x08)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTJ)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTJ)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTJ))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTJ)
                }
            }

            Device (LACI)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0A)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTL)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTL)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTL))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTL)
                }
            }

            Device (LMCI)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0B)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTM)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTM)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTM))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTM)
                }
            }

            Device (LSMB)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0C)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTF)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTF)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTF))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTF)
                }
            }

            Device (LUB2)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x0D)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTQ)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTQ)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTQ))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTQ)
                }
            }

            Device (LIDE)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x10)
                Method (_STA, 0, NotSerialized)
                {
                    If (INTN)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTN)
                    Store (0x00, INTP)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (INTN))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), INTN)
                    Store (SRS (Arg0), INTP)
                }
            }

            Device (LSID)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x11)
                Method (_STA, 0, NotSerialized)
                {
                    If (ITID)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, ITID)
                    Store (0x00, SSAI)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (ITID))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), ITID)
                    Store (SRS (Arg0), SSAI)
                }
            }

            Device (LFID)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x12)
                Method (_STA, 0, NotSerialized)
                {
                    If (IS0P)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IS0P)
                    Store (0x00, IS0S)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (IS0P))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), IS0P)
                    Store (SRS (Arg0), IS0S)
                }
            }

            Device (LPCA)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x13)
                Method (_STA, 0, NotSerialized)
                {
                    If (IPCA)
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFA)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IPCA)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRS (IPCA))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRS (Arg0), IPCA)
                }
            }

            Name (BUF1, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,,)
                {
                    0x00000010,
                }
            })
            Name (BUF2, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,,)
                {
                    0x00000011,
                }
            })
            Name (BUF3, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,,)
                {
                    0x00000012,
                }
            })
            Name (BUF4, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,,)
                {
                    0x00000013,
                }
            })
            Name (BUFF, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,,)
                {
                    0x00000014,
                    0x00000015,
                    0x00000016,
                    0x00000017,
                }
            })
            Name (BUFH, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,,)
                {
                    0x0000000B,
                }
            })
            Name (BUFI, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,,)
                {
                    0x00000017,
                }
            })
            Name (IRZ1, ResourceTemplate ()
            {
                Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,,)
                {
                    0x00000007,
                }
            })
            Device (APC1)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x14)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (INTA, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUF1)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTA)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    CreateWordField (IRZ1, 0x05, IRQ1)
                    Store (CRSB (INTA), IRQ1)
                    Return (IRZ1)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (0x08, INTA)
                }
            }

            Device (APC2)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x15)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (INTB, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUF2)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTB)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    CreateWordField (IRZ1, 0x05, IRQ1)
                    Store (CRSB (INTB), IRQ1)
                    Return (IRZ1)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (0x01, INTB)
                }
            }

            Device (APC3)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x16)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (INTC, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUF3)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTC)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    CreateWordField (IRZ1, 0x05, IRQ1)
                    Store (CRSB (INTC), IRQ1)
                    Return (IRZ1)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (0x02, INTC)
                }
            }

            Device (APC4)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x17)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (INTD, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUF4)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTD)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    CreateWordField (IRZ1, 0x05, IRQ1)
                    Store (CRSB (INTD), IRQ1)
                    Return (IRZ1)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (0x0D, INTD)
                }
            }

            Device (APC5)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x18)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (INTE, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUF1)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTE)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (BUF1)
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (0x08, INTE)
                }
            }

            Device (APCF)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x19)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (INTG, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFF)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTG)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRSA (INTG))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRSA (Arg0), INTG)
                }
            }

            Device (APCG)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x1A)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (INTH, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFF)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTH)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRSA (INTH))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRSA (Arg0), INTH)
                }
            }

            Device (APCH)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x1B)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (INTJ, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFF)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTJ)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRSA (INTJ))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRSA (Arg0), INTJ)
                }
            }

            Device (APCJ)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x1D)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (INTL, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFF)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTL)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRSA (INTL))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRSA (Arg0), INTL)
                }
            }

            Device (APCK)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x1E)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (INTM, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFF)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTM)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRSA (INTM))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRSA (Arg0), INTM)
                }
            }

            Device (APCS)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x1F)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (INTF, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFF)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTF)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRSA (INTF))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRSA (Arg0), INTF)
                }
            }

            Device (APCL)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x20)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (INTQ, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFF)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTQ)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRSA (INTQ))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRSA (Arg0), INTQ)
                }
            }

            Device (APCZ)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x23)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (INTN, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFF)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, INTN)
                    Store (0x00, INTP)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRSA (INTN))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRSA (Arg0), INTN)
                    Store (SRSA (Arg0), INTP)
                }
            }

            Device (APSI)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x24)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (ITID, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, ITID)
                    Store (0x00, SSAI)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFF)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRSA (ITID))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRSA (Arg0), ITID)
                    Store (SRSA (Arg0), SSAI)
                }
            }

            Device (APSJ)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x25)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (IS0P, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IS0P)
                    Store (0x00, IS0S)
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFF)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRSA (IS0P))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRSA (Arg0), IS0P)
                    Store (SRSA (Arg0), IS0S)
                }
            }

            Device (APCP)
            {
                Name (_HID, EisaId ("PNP0C0F"))
                Name (_UID, 0x26)
                Method (_STA, 0, NotSerialized)
                {
                    If (LAnd (IPCA, PICF))
                    {
                        Return (0x0B)
                    }
                    Else
                    {
                        Return (0x09)
                    }
                }

                Method (_PRS, 0, NotSerialized)
                {
                    Return (BUFF)
                }

                Method (_DIS, 0, NotSerialized)
                {
                    Store (0x00, IPCA)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Return (CRSA (IPCA))
                }

                Method (_SRS, 1, NotSerialized)
                {
                    Store (SRSA (Arg0), IPCA)
                }
            }

            Scope (\)
            {
                OperationRegion (\SCPP, SystemIO, 0x442E, 0x01)
                Field (\SCPP, ByteAcc, NoLock, Preserve)
                {
                    SMIP,   8
                }
            }

            Method (\_SB.PCI0._INI, 0, NotSerialized)
            {
                If (STRC (\_OS, "Microsoft Windows"))
                {
                    Store (0x56, SMIP)
                }
                Else
                {
                    If (STRC (\_OS, "Microsoft Windows NT"))
                    {
                        If (CondRefOf (\_OSI, Local0))
                        {
                            If (\_OSI ("Windows 2001"))
                            {
                                Store (0x59, SMIP)
                                Store (0x00, OSFL)
                                Store (0x03, OSFX)
                            }
                        }
                        Else
                        {
                            Store (0x58, SMIP)
                            Store (0x00, OSFX)
                            Store (0x00, OSFL)
                        }
                    }
                    Else
                    {
                        Store (0x57, SMIP)
                        Store (0x02, OSFX)
                        Store (0x02, OSFL)
                    }
                }

                Name (TEMP, 0x00)
                Store (UA1D, TEMP)
                And (TEMP, 0x0F, TEMP)
                ShiftLeft (0x01, TEMP, UARA)
                Store (UA1D, TEMP)
                And (TEMP, 0xF0, TEMP)
                ShiftRight (TEMP, 0x04, TEMP)
                ShiftLeft (0x01, TEMP, UARB)
            }

            Scope (\)
            {
                Method (OSTP, 0, NotSerialized)
                {
                    If (LEqual (OSFX, 0x01))
                    {
                        Store (0x56, SMIP)
                    }

                    If (LEqual (OSFX, 0x02))
                    {
                        Store (0x57, SMIP)
                    }

                    If (LEqual (OSFX, 0x00))
                    {
                        Store (0x58, SMIP)
                    }

                    If (LEqual (OSFX, 0x03))
                    {
                        Store (0x59, SMIP)
                    }
                }
            }

            Device (SYSR)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (_UID, 0x01)
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0010,             // Address Range Minimum
                        0x0010,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x10,               // Address Length
                        )
                    IO (Decode16,
                        0x0022,             // Address Range Minimum
                        0x0022,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x1E,               // Address Length
                        )
                    IO (Decode16,
                        0x0044,             // Address Range Minimum
                        0x0044,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x1C,               // Address Length
                        )
                    IO (Decode16,
                        0x0062,             // Address Range Minimum
                        0x0062,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x02,               // Address Length
                        )
                    IO (Decode16,
                        0x0065,             // Address Range Minimum
                        0x0065,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x0B,               // Address Length
                        )
                    IO (Decode16,
                        0x0074,             // Address Range Minimum
                        0x0074,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x0C,               // Address Length
                        )
                    IO (Decode16,
                        0x0091,             // Address Range Minimum
                        0x0091,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x03,               // Address Length
                        )
                    IO (Decode16,
                        0x00A2,             // Address Range Minimum
                        0x00A2,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x1E,               // Address Length
                        )
                    IO (Decode16,
                        0x00E0,             // Address Range Minimum
                        0x00E0,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x10,               // Address Length
                        )
                    IO (Decode16,
                        0x0B78,             // Address Range Minimum
                        0x0B78,             // Address Range Maximum
                        0x04,               // Address Alignment
                        0x04,               // Address Length
                        )
                    IO (Decode16,
                        0x0F78,             // Address Range Minimum
                        0x0F78,             // Address Range Maximum
                        0x04,               // Address Alignment
                        0x04,               // Address Length
                        )
                    IO (Decode16,
                        0x0A78,             // Address Range Minimum
                        0x0A78,             // Address Range Maximum
                        0x04,               // Address Alignment
                        0x04,               // Address Length
                        )
                    IO (Decode16,
                        0x0E78,             // Address Range Minimum
                        0x0E78,             // Address Range Maximum
                        0x04,               // Address Alignment
                        0x04,               // Address Length
                        )
                    IO (Decode16,
                        0x0BBC,             // Address Range Minimum
                        0x0BBC,             // Address Range Maximum
                        0x04,               // Address Alignment
                        0x04,               // Address Length
                        )
                    IO (Decode16,
                        0x0FBC,             // Address Range Minimum
                        0x0FBC,             // Address Range Maximum
                        0x04,               // Address Alignment
                        0x04,               // Address Length
                        )
                    IO (Decode16,
                        0x04D0,             // Address Range Minimum
                        0x04D0,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x02,               // Address Length
                        )
                    IO (Decode16,
                        0x0290,             // Address Range Minimum
                        0x0290,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x80,               // Address Length
                        )
                })
            }

            Device (PIC)
            {
                Name (_HID, EisaId ("PNP0000"))
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0020,             // Address Range Minimum
                        0x0020,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x02,               // Address Length
                        )
                    IO (Decode16,
                        0x00A0,             // Address Range Minimum
                        0x00A0,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x02,               // Address Length
                        )
                    IRQNoFlags ()
                        {2}
                })
            }

            Device (DMA1)
            {
                Name (_HID, EisaId ("PNP0200"))
                Name (_CRS, ResourceTemplate ()
                {
                    DMA (Compatibility, BusMaster, Transfer8)
                        {4}
                    IO (Decode16,
                        0x0000,             // Address Range Minimum
                        0x0000,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x10,               // Address Length
                        )
                    IO (Decode16,
                        0x0080,             // Address Range Minimum
                        0x0080,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x11,               // Address Length
                        )
                    IO (Decode16,
                        0x0094,             // Address Range Minimum
                        0x0094,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x0C,               // Address Length
                        )
                    IO (Decode16,
                        0x00C0,             // Address Range Minimum
                        0x00C0,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x20,               // Address Length
                        )
                })
            }

            Device (TMR)
            {
                Name (_HID, EisaId ("PNP0100"))
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0040,             // Address Range Minimum
                        0x0040,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x04,               // Address Length
                        )
                    IRQNoFlags ()
                        {0}
                })
            }

            Device (RTC)
            {
                Name (_HID, EisaId ("PNP0B00"))
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0070,             // Address Range Minimum
                        0x0070,             // Address Range Maximum
                        0x04,               // Address Alignment
                        0x04,               // Address Length
                        )
                    IRQNoFlags ()
                        {8}
                })
            }

            Device (SPKR)
            {
                Name (_HID, EisaId ("PNP0800"))
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0061,             // Address Range Minimum
                        0x0061,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x01,               // Address Length
                        )
                })
            }

            Device (COPR)
            {
                Name (_HID, EisaId ("PNP0C04"))
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x00F0,             // Address Range Minimum
                        0x00F0,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x10,               // Address Length
                        )
                    IRQNoFlags ()
                        {13}
                })
            }

            Scope (\)
            {
                OperationRegion (WIN1, SystemIO, 0x2E, 0x02)
                Field (WIN1, ByteAcc, NoLock, Preserve)
                {
                    INDP,   8, 
                    DATA,   8
                }

                IndexField (INDP, DATA, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    CFG,    8, 
                    Offset (0x07), 
                    LDN,    8, 
                    Offset (0x20), 
                    IDHI,   8, 
                    IDLO,   8, 
                    POWC,   8, 
                    Offset (0x30), 
                    ACTR,   8, 
                    Offset (0x60), 
                    IOAH,   8, 
                    IOAL,   8, 
                    IO2H,   8, 
                    IO2L,   8, 
                    Offset (0x70), 
                    INTR,   8, 
                    Offset (0x72), 
                    INT1,   8, 
                    Offset (0x74), 
                    DMCH,   8, 
                    Offset (0xE0), 
                    CRE0,   8, 
                    CRE1,   8, 
                    CRE2,   8, 
                    CRE3,   8, 
                    CRE4,   8, 
                    Offset (0xF0), 
                    OPT1,   8, 
                    OPT2,   8, 
                    OPT3,   8, 
                    OPT4,   8, 
                    OPT5,   8, 
                    OPT6,   8, 
                    OPT7,   8, 
                    OPT8,   8, 
                    OPT9,   8, 
                    OPTA,   8
                }

                Method (ENFG, 0, NotSerialized)
                {
                    Store (0x87, INDP)
                    Store (0x87, INDP)
                }

                Method (EXFG, 0, NotSerialized)
                {
                    Store (0xAA, INDP)
                }
            }

            OperationRegion (COM1, SystemIO, 0x03F8, 0x08)
            Field (COM1, ByteAcc, NoLock, Preserve)
            {
                P3F8,   8, 
                P3F9,   8, 
                P3FA,   8, 
                P3FB,   8, 
                P3FC,   8, 
                P3FD,   8, 
                P3FE,   8, 
                P3FF,   8
            }

            OperationRegion (COM2, SystemIO, 0x02F8, 0x08)
            Field (COM2, ByteAcc, NoLock, Preserve)
            {
                P2F8,   8, 
                P2F9,   8, 
                P2FA,   8, 
                P2FB,   8, 
                P2FC,   8, 
                P2FD,   8, 
                P2FE,   8, 
                P2FF,   8
            }

            OperationRegion (COM3, SystemIO, 0x03E8, 0x08)
            Field (COM3, ByteAcc, NoLock, Preserve)
            {
                P3E8,   8, 
                P3E9,   8, 
                P3EA,   8, 
                P3EB,   8, 
                P3EC,   8, 
                P3ED,   8, 
                P3EE,   8, 
                P3EF,   8
            }

            OperationRegion (COM4, SystemIO, 0x02E8, 0x08)
            Field (COM4, ByteAcc, NoLock, Preserve)
            {
                P2E8,   8, 
                P2E9,   8, 
                P2EA,   8, 
                P2EB,   8, 
                P2EC,   8, 
                P2ED,   8, 
                P2EE,   8, 
                P2EF,   8
            }

            Method (ICOM, 1, NotSerialized)
            {
                Store (Arg0, Local0)
                If (LEqual (Local0, 0x03F8))
                {
                    Store (P3FD, Local0)
                    Store (P3FD, Local0)
                    Store (0xC3, P3FA)
                    While (LNot (LEqual (P3FA, 0xC1)))
                    {
                        Store (P3FE, Local0)
                    }
                }
                Else
                {
                    If (LEqual (Local0, 0x02F8))
                    {
                        Store (P2FD, Local0)
                        Store (P2FD, Local0)
                        Store (0xC3, P2FA)
                        While (LNot (LEqual (P2FA, 0xC1)))
                        {
                            Store (P2FE, Local0)
                        }
                    }
                    Else
                    {
                        If (LEqual (Local0, 0x03E8))
                        {
                            Store (P3ED, Local0)
                            Store (P3ED, Local0)
                            Store (0xC3, P3EA)
                            While (LNot (LEqual (P3EA, 0xC1)))
                            {
                                Store (P3EE, Local0)
                            }
                        }
                        Else
                        {
                            If (LEqual (Local0, 0x02E8))
                            {
                                Store (P2ED, Local0)
                                Store (P2ED, Local0)
                                Store (0xC3, P2EA)
                                While (LNot (LEqual (P2EA, 0xC1)))
                                {
                                    Store (P2EE, Local0)
                                }
                            }
                        }
                    }
                }
            }

            Device (FDC0)
            {
                Name (_HID, EisaId ("PNP0700"))
                Method (_STA, 0, NotSerialized)
                {
                    ENFG ()
                    Store (Zero, LDN)
                    If (ACTR)
                    {
                        EXFG ()
                        Return (0x0F)
                    }
                    Else
                    {
                        If (LOr (IOAH, IOAL))
                        {
                            EXFG ()
                            Return (0x0D)
                        }
                        Else
                        {
                            EXFG ()
                            Return (0x00)
                        }
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    ENFG ()
                    Store (0x00, LDN)
                    Store (Zero, ACTR)
                    SLDM (DMCH, 0x04)
                    EXFG ()
                    DISD (0x03)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x03F0,             // Address Range Minimum
                            0x03F0,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x06,               // Address Length
                            )
                        IO (Decode16,
                            0x03F7,             // Address Range Minimum
                            0x03F7,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IRQNoFlags ()
                            {6}
                        DMA (Compatibility, NotBusMaster, Transfer8)
                            {2}
                    })
                    CreateByteField (BUF0, 0x02, IOLO)
                    CreateByteField (BUF0, 0x03, IOHI)
                    CreateByteField (BUF0, 0x04, IORL)
                    CreateByteField (BUF0, 0x05, IORH)
                    ENFG ()
                    EXFG ()
                    Return (BUF0)
                }

                Name (_PRS, ResourceTemplate ()
                {
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x03F0,             // Address Range Minimum
                            0x03F0,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x06,               // Address Length
                            )
                        IO (Decode16,
                            0x03F7,             // Address Range Minimum
                            0x03F7,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IRQNoFlags ()
                            {6}
                        DMA (Compatibility, NotBusMaster, Transfer8)
                            {2}
                    }
                    EndDependentFn ()
                })
                Method (_SRS, 1, NotSerialized)
                {
                    CreateByteField (Arg0, 0x02, IOLO)
                    CreateByteField (Arg0, 0x03, IOHI)
                    CreateWordField (Arg0, 0x02, IOAD)
                    CreateWordField (Arg0, 0x19, IRQL)
                    CreateByteField (Arg0, 0x1C, DMAV)
                    ENFG ()
                    Store (Zero, LDN)
                    Store (One, ACTR)
                    SLDM (DMCH, DMCH)
                    EXFG ()
                    CKIO (IOAD, 0x03)
                }
            }

            Device (UAR1)
            {
                Name (_HID, EisaId ("PNP0501"))
                Name (_UID, 0x01)
                Method (_STA, 0, NotSerialized)
                {
                    ENFG ()
                    Store (0x02, LDN)
                    If (ACTR)
                    {
                        EXFG ()
                        Return (0x0F)
                    }
                    Else
                    {
                        If (LOr (IOAH, IOAL))
                        {
                            EXFG ()
                            Return (0x0D)
                        }
                        Else
                        {
                            EXFG ()
                            Return (0x00)
                        }
                    }

                    EXFG ()
                }

                Method (_DIS, 0, NotSerialized)
                {
                    ENFG ()
                    Store (0x02, LDN)
                    Store (Zero, ACTR)
                    EXFG ()
                    DISD (0x00)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Address Range Minimum
                            0x0000,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {}
                    })
                    CreateByteField (BUF1, 0x02, IOLO)
                    CreateByteField (BUF1, 0x03, IOHI)
                    CreateByteField (BUF1, 0x04, IORL)
                    CreateByteField (BUF1, 0x05, IORH)
                    CreateWordField (BUF1, 0x09, IRQW)
                    ENFG ()
                    Store (0x02, LDN)
                    Store (IOAL, IOLO)
                    Store (IOAL, IORL)
                    Store (IOAH, IOHI)
                    Store (IOAH, IORH)
                    Store (One, Local0)
                    ShiftLeft (Local0, INTR, IRQW)
                    EXFG ()
                    Return (BUF1)
                }

                Name (_PRS, ResourceTemplate ()
                {
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x03F8,             // Address Range Minimum
                            0x03F8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x02F8,             // Address Range Minimum
                            0x02F8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x03E8,             // Address Range Minimum
                            0x03E8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x02E8,             // Address Range Minimum
                            0x02E8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    EndDependentFn ()
                })
                Method (_SRS, 1, NotSerialized)
                {
                    CreateByteField (Arg0, 0x02, IOLO)
                    CreateByteField (Arg0, 0x03, IOHI)
                    CreateWordField (Arg0, 0x02, IOAD)
                    CreateWordField (Arg0, 0x09, IRQW)
                    ENFG ()
                    Store (0x02, LDN)
                    Store (One, ACTR)
                    Store (IOLO, IOAL)
                    Store (IOHI, IOAH)
                    FindSetRightBit (IRQW, Local0)
                    Subtract (Local0, 0x01, INTR)
                    EXFG ()
                    CKIO (IOAD, 0x00)
                }
            }

            Device (UAR2)
            {
                Name (_HID, EisaId ("PNP0501"))
                Name (_UID, 0x02)
                Method (_STA, 0, NotSerialized)
                {
                    ENFG ()
                    Store (0x03, LDN)
                    And (OPT2, 0x30, Local0)
                    If (LNot (LEqual (Local0, 0x10)))
                    {
                        If (ACTR)
                        {
                            EXFG ()
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LOr (IOAH, IOAL))
                            {
                                EXFG ()
                                Return (0x0D)
                            }
                            Else
                            {
                                EXFG ()
                                Return (0x00)
                            }
                        }
                    }
                    Else
                    {
                        EXFG ()
                        Return (0x00)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    ENFG ()
                    Store (0x03, LDN)
                    And (OPT2, 0x38, Local0)
                    If (LEqual (Local0, 0x00))
                    {
                        Store (Zero, ACTR)
                    }

                    EXFG ()
                    DISD (0x01)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUF2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Address Range Minimum
                            0x0000,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {4}
                    })
                    CreateByteField (BUF2, 0x02, IOLO)
                    CreateByteField (BUF2, 0x03, IOHI)
                    CreateByteField (BUF2, 0x04, IORL)
                    CreateByteField (BUF2, 0x05, IORH)
                    CreateWordField (BUF2, 0x09, IRQW)
                    ENFG ()
                    Store (0x03, LDN)
                    Store (IOAL, IOLO)
                    Store (IOAL, IORL)
                    Store (IOAH, IOHI)
                    Store (IOAH, IORH)
                    Store (One, Local0)
                    ShiftLeft (Local0, INTR, IRQW)
                    EXFG ()
                    Return (BUF2)
                }

                Name (_PRS, ResourceTemplate ()
                {
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x03F8,             // Address Range Minimum
                            0x03F8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x02F8,             // Address Range Minimum
                            0x02F8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x03E8,             // Address Range Minimum
                            0x03E8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x02E8,             // Address Range Minimum
                            0x02E8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    EndDependentFn ()
                })
                Method (_SRS, 1, NotSerialized)
                {
                    CreateByteField (Arg0, 0x02, IOLO)
                    CreateByteField (Arg0, 0x03, IOHI)
                    CreateWordField (Arg0, 0x02, IOAD)
                    CreateWordField (Arg0, 0x09, IRQW)
                    ENFG ()
                    Store (0x03, LDN)
                    Store (One, ACTR)
                    Store (IOLO, IOAL)
                    Store (IOHI, IOAH)
                    FindSetRightBit (IRQW, Local0)
                    Subtract (Local0, 0x01, INTR)
                    EXFG ()
                    CKIO (IOAD, 0x01)
                }
            }

            Device (IRDA)
            {
                Name (_HID, EisaId ("PNP0510"))
                Method (_STA, 0, NotSerialized)
                {
                    ENFG ()
                    Store (0x03, LDN)
                    And (OPT2, 0x30, Local0)
                    If (LEqual (Local0, 0x10))
                    {
                        If (ACTR)
                        {
                            EXFG ()
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LOr (IOAH, IOAL))
                            {
                                EXFG ()
                                Return (0x0D)
                            }
                            Else
                            {
                                EXFG ()
                                Return (0x00)
                            }
                        }
                    }
                    Else
                    {
                        EXFG ()
                        Return (0x00)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    If (LEqual (DISE, 0x01))
                    {
                        ENFG ()
                        Store (0x03, LDN)
                        And (OPT2, 0x38, Local0)
                        If (LNot (LEqual (Local0, 0x00)))
                        {
                            Store (Zero, ACTR)
                        }

                        EXFG ()
                        DISD (0x01)
                    }

                    Store (Local0, Local0)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUF4, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Address Range Minimum
                            0x0000,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {}
                    })
                    CreateByteField (BUF4, 0x02, IOLO)
                    CreateByteField (BUF4, 0x03, IOHI)
                    CreateByteField (BUF4, 0x04, IORL)
                    CreateByteField (BUF4, 0x05, IORH)
                    CreateWordField (BUF4, 0x09, IRQW)
                    ENFG ()
                    Store (0x03, LDN)
                    Store (IOAL, IOLO)
                    Store (IOAL, IORL)
                    Store (IOAH, IOHI)
                    Store (IOAH, IORH)
                    ShiftLeft (0x01, INTR, IRQW)
                    EXFG ()
                    Return (BUF4)
                }

                Name (_PRS, ResourceTemplate ()
                {
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x03F8,             // Address Range Minimum
                            0x03F8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x02F8,             // Address Range Minimum
                            0x02F8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x03E8,             // Address Range Minimum
                            0x03E8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x02E8,             // Address Range Minimum
                            0x02E8,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    EndDependentFn ()
                })
                Method (_SRS, 1, NotSerialized)
                {
                    CreateByteField (Arg0, 0x02, IOLO)
                    CreateByteField (Arg0, 0x03, IOHI)
                    CreateWordField (Arg0, 0x02, IOAD)
                    CreateWordField (Arg0, 0x09, IRQW)
                    ENFG ()
                    Store (0x03, LDN)
                    Store (One, ACTR)
                    Store (IOLO, IOAL)
                    Store (IOHI, IOAH)
                    FindSetRightBit (IRQW, Local0)
                    Subtract (Local0, 0x01, INTR)
                    EXFG ()
                    CKIO (IOAD, 0x01)
                }
            }

            Device (LPT1)
            {
                Name (_HID, EisaId ("PNP0400"))
                Method (_STA, 0, NotSerialized)
                {
                    ENFG ()
                    Store (0x01, LDN)
                    And (OPT1, 0x02, Local0)
                    If (LNot (LEqual (Local0, 0x02)))
                    {
                        If (ACTR)
                        {
                            EXFG ()
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LOr (IOAH, IOAL))
                            {
                                EXFG ()
                                Return (0x0D)
                            }
                            Else
                            {
                                EXFG ()
                                Return (0x00)
                            }
                        }
                    }
                    Else
                    {
                        EXFG ()
                        Return (0x00)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    ENFG ()
                    Store (0x01, LDN)
                    Store (Zero, ACTR)
                    EXFG ()
                    DISD (0x02)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUF5, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Address Range Minimum
                            0x0000,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IO (Decode16,
                            0x0000,             // Address Range Minimum
                            0x0000,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IRQNoFlags ()
                            {}
                    })
                    CreateByteField (BUF5, 0x02, IOLO)
                    CreateByteField (BUF5, 0x03, IOHI)
                    CreateByteField (BUF5, 0x04, IORL)
                    CreateByteField (BUF5, 0x05, IORH)
                    CreateByteField (BUF5, 0x07, IOLE)
                    CreateByteField (BUF5, 0x0A, IO21)
                    CreateByteField (BUF5, 0x0B, IO22)
                    CreateByteField (BUF5, 0x0C, IO23)
                    CreateByteField (BUF5, 0x0D, IO24)
                    CreateWordField (BUF5, 0x11, IRQW)
                    ENFG ()
                    Store (0x01, LDN)
                    Store (IOAL, IOLO)
                    Store (IOLO, IORL)
                    Store (IOAH, IOHI)
                    Store (IOHI, IORH)
                    Store (IOAL, IO21)
                    Store (IOAL, IO23)
                    Add (IOAH, 0x04, IO22)
                    Add (IOAH, 0x04, IO24)
                    If (LEqual (IOLO, 0xBC))
                    {
                        Store (0x04, IOLE)
                    }
                    Else
                    {
                        Store (0x08, IOLE)
                    }

                    Store (One, Local0)
                    Store (INTR, Local5)
                    ShiftLeft (Local0, Local5, IRQW)
                    Store (One, ACTR)
                    EXFG ()
                    Return (BUF5)
                }

                Name (_PRS, ResourceTemplate ()
                {
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x0378,             // Address Range Minimum
                            0x0378,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IO (Decode16,
                            0x0778,             // Address Range Minimum
                            0x0778,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x0278,             // Address Range Minimum
                            0x0278,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IO (Decode16,
                            0x0678,             // Address Range Minimum
                            0x0678,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x03BC,             // Address Range Minimum
                            0x03BC,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IO (Decode16,
                            0x07BC,             // Address Range Minimum
                            0x07BC,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                    }
                    EndDependentFn ()
                })
                Method (_SRS, 1, NotSerialized)
                {
                    CreateByteField (Arg0, 0x02, IOLO)
                    CreateByteField (Arg0, 0x03, IOHI)
                    CreateWordField (Arg0, 0x02, IOAD)
                    CreateByteField (Arg0, 0x04, IORL)
                    CreateByteField (Arg0, 0x05, IORH)
                    CreateWordField (Arg0, 0x11, IRQW)
                    ENFG ()
                    Store (0x01, LDN)
                    Store (One, ACTR)
                    Store (IOLO, IOAL)
                    Store (IOHI, IOAH)
                    FindSetLeftBit (IRQW, Local0)
                    Subtract (Local0, 0x01, Local0)
                    Store (Local0, INTR)
                    EXFG ()
                    CKIO (IOAD, 0x02)
                }
            }

            Device (ECP1)
            {
                Name (_HID, EisaId ("PNP0401"))
                Method (_STA, 0, NotSerialized)
                {
                    ENFG ()
                    Store (0x01, LDN)
                    And (OPT1, 0x02, Local0)
                    If (LEqual (Local0, 0x02))
                    {
                        If (ACTR)
                        {
                            EXFG ()
                            Return (0x0F)
                        }
                        Else
                        {
                            If (LOr (IOAH, IOAL))
                            {
                                EXFG ()
                                Return (0x0D)
                            }
                            Else
                            {
                                EXFG ()
                                Return (0x00)
                            }
                        }
                    }
                    Else
                    {
                        EXFG ()
                        Return (0x00)
                    }
                }

                Method (_DIS, 0, NotSerialized)
                {
                    ENFG ()
                    Store (0x01, LDN)
                    Store (Zero, ACTR)
                    SLDM (DMCH, 0x04)
                    EXFG ()
                    DISD (0x02)
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUF6, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Address Range Minimum
                            0x0000,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IO (Decode16,
                            0x0000,             // Address Range Minimum
                            0x0000,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IRQNoFlags ()
                            {}
                        DMA (Compatibility, NotBusMaster, Transfer8)
                            {}
                    })
                    CreateByteField (BUF6, 0x02, IOLO)
                    CreateByteField (BUF6, 0x03, IOHI)
                    CreateByteField (BUF6, 0x04, IORL)
                    CreateByteField (BUF6, 0x05, IORH)
                    CreateByteField (BUF6, 0x0A, IOEL)
                    CreateByteField (BUF6, 0x0B, IOEH)
                    CreateByteField (BUF6, 0x0C, IOML)
                    CreateByteField (BUF6, 0x0D, IOMH)
                    CreateByteField (BUF6, 0x07, IOLE)
                    CreateWordField (BUF6, 0x11, IRQW)
                    CreateByteField (BUF6, 0x14, DMAC)
                    ENFG ()
                    Store (0x01, LDN)
                    Store (One, ACTR)
                    Store (IOAL, Local2)
                    Store (Local2, IOLO)
                    Store (IOAH, Local3)
                    Store (Local3, IOHI)
                    Or (Local3, 0x04, Local3)
                    Store (Local3, IOEH)
                    Store (Local3, IOMH)
                    Store (IOLO, IORL)
                    Store (IOLO, IOEL)
                    Store (IOLO, IOML)
                    Store (IOHI, IORH)
                    If (LEqual (IOLO, 0xBC))
                    {
                        Store (0x04, IOLE)
                    }
                    Else
                    {
                        Store (0x08, IOLE)
                    }

                    Store (One, Local0)
                    Store (INTR, Local5)
                    ShiftLeft (Local0, Local5, IRQW)
                    Store (One, Local0)
                    Store (DMCH, Local5)
                    ShiftLeft (Local0, Local5, DMAC)
                    EXFG ()
                    Return (BUF6)
                }

                Name (_PRS, ResourceTemplate ()
                {
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x0378,             // Address Range Minimum
                            0x0378,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IO (Decode16,
                            0x0778,             // Address Range Minimum
                            0x0778,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                        DMA (Compatibility, NotBusMaster, Transfer8)
                            {0,1,3}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x0278,             // Address Range Minimum
                            0x0278,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x08,               // Address Length
                            )
                        IO (Decode16,
                            0x0678,             // Address Range Minimum
                            0x0678,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                        DMA (Compatibility, NotBusMaster, Transfer8)
                            {0,1,3}
                    }
                    StartDependentFnNoPri ()
                    {
                        IO (Decode16,
                            0x03BC,             // Address Range Minimum
                            0x03BC,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IO (Decode16,
                            0x07BC,             // Address Range Minimum
                            0x07BC,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x04,               // Address Length
                            )
                        IRQNoFlags ()
                            {3,4,5,7,9,10,11,12}
                        DMA (Compatibility, NotBusMaster, Transfer8)
                            {0,1,3}
                    }
                    EndDependentFn ()
                })
                Method (_SRS, 1, NotSerialized)
                {
                    CreateByteField (Arg0, 0x02, IOLO)
                    CreateByteField (Arg0, 0x03, IOHI)
                    CreateWordField (Arg0, 0x02, IOAD)
                    CreateWordField (Arg0, 0x11, IRQW)
                    CreateByteField (Arg0, 0x14, DMAC)
                    ENFG ()
                    Store (0x01, LDN)
                    Store (One, ACTR)
                    Store (IOLO, IOAL)
                    Store (IOHI, IOAH)
                    FindSetLeftBit (IRQW, Local0)
                    Subtract (Local0, 0x01, Local0)
                    Store (Local0, INTR)
                    FindSetLeftBit (DMAC, Local1)
                    Store (DMCH, Local0)
                    Subtract (Local1, 0x01, DMCH)
                    SLDM (Local0, DMCH)
                    EXFG ()
                    CKIO (IOAD, 0x02)
                }
            }

            OperationRegion (KBCT, SystemIO, 0x60, 0x05)
            Field (KBCT, ByteAcc, NoLock, Preserve)
            {
                P060,   8, 
                Offset (0x04), 
                P064,   8
            }

            Device (PS2M)
            {
                Name (_HID, EisaId ("PNP0F13"))
                Method (_STA, 0, NotSerialized)
                {
                    If (LEqual (PS2F, 0x00))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (0x00)
                    }
                }

                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUF1, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {12}
                    })
                    Name (BUF2, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Address Range Minimum
                            0x0060,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IO (Decode16,
                            0x0064,             // Address Range Minimum
                            0x0064,             // Address Range Maximum
                            0x01,               // Address Alignment
                            0x01,               // Address Length
                            )
                        IRQNoFlags ()
                            {12}
                    })
                    If (LEqual (KBDI, 0x01))
                    {
                        If (LEqual (OSFL, 0x02))
                        {
                            Return (BUF1)
                        }

                        If (LEqual (OSFL, 0x01))
                        {
                            Return (BUF1)
                        }
                        Else
                        {
                            Return (BUF2)
                        }
                    }
                    Else
                    {
                        Return (BUF1)
                    }
                }
            }

            Device (PS2K)
            {
                Name (_HID, EisaId ("PNP0303"))
                Name (_CID, 0x0B03D041)
                Method (_STA, 0, NotSerialized)
                {
                    If (LEqual (KBDI, 0x01))
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }

                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0060,             // Address Range Minimum
                        0x0060,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x01,               // Address Length
                        )
                    IO (Decode16,
                        0x0064,             // Address Range Minimum
                        0x0064,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x01,               // Address Length
                        )
                    IRQNoFlags ()
                        {1}
                })
            }

            Device (PSMR)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (_UID, 0x03)
                Method (_STA, 0, NotSerialized)
                {
                    If (LEqual (KBDI, 0x00))
                    {
                        Return (0x00)
                    }

                    If (LEqual (PS2F, 0x00))
                    {
                        If (LEqual (OSFL, 0x02))
                        {
                            Return (0x0F)
                        }

                        If (LEqual (OSFL, 0x01))
                        {
                            Return (0x0F)
                        }

                        Return (0x00)
                    }

                    Return (0x00)
                }

                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0060,             // Address Range Minimum
                        0x0060,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x01,               // Address Length
                        )
                    IO (Decode16,
                        0x0064,             // Address Range Minimum
                        0x0064,             // Address Range Maximum
                        0x01,               // Address Alignment
                        0x01,               // Address Length
                        )
                })
            }

            Method (\_SB.PCI0.UAR1._PRW, 0, NotSerialized)
            {
                Return (Package (0x02)
                {
                    0x03, 
                    0x05
                })
            }
        }

        Device (MEM)
        {
            Name (_HID, EisaId ("PNP0C01"))
            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x000F0000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x000F4000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x000F8000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x000FC000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00010000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFFFF0000,         // Address Base
                        0x00010000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x000A0000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x00100000,         // Address Base
                        0x00000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEC00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEE00000,         // Address Base
                        0x00100000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEFFF000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFFF80000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFFF90000,         // Address Base
                        0x00030000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFFFED000,         // Address Base
                        0x00003000,         // Address Length
                        )
                })
                CreateDWordField (BUF0, 0x34, ACMM)
                CreateDWordField (BUF0, 0x04, RMA1)
                CreateDWordField (BUF0, 0x08, RSS1)
                CreateDWordField (BUF0, 0x10, RMA2)
                CreateDWordField (BUF0, 0x14, RSS2)
                CreateDWordField (BUF0, 0x1C, RMA3)
                CreateDWordField (BUF0, 0x20, RSS3)
                CreateDWordField (BUF0, 0x28, RMA4)
                CreateDWordField (BUF0, 0x2C, RSS4)
                CreateDWordField (BUF0, 0x5C, EXTM)
                Subtract (AMEM, 0x00100000, EXTM)
                If (LNot (LEqual (ROM1, Zero)))
                {
                    Store (RMA1, RMA2)
                    ShiftLeft (ROM1, 0x08, Local0)
                    Store (Local0, RMA1)
                    ShiftLeft (RMS1, 0x08, Local0)
                    Store (Local0, RSS1)
                    Store (0x8000, RSS2)
                }

                If (LNot (LEqual (ROM2, Zero)))
                {
                    Store (RMA2, RMA3)
                    ShiftLeft (ROM2, 0x08, Local0)
                    Store (Local0, RMA2)
                    ShiftLeft (RMS2, 0x08, Local0)
                    Store (Local0, RSS2)
                    Store (0xC000, RSS3)
                }

                If (LNot (LEqual (ROM3, Zero)))
                {
                    Store (RMA3, RMA4)
                    ShiftLeft (ROM3, 0x08, Local0)
                    Store (Local0, RMA3)
                    ShiftLeft (RMS3, 0x08, Local0)
                    Store (Local0, RSS3)
                    Store (0x00010000, RSS4)
                }

                Store (AMEM, ACMM)
                Return (BUF0)
            }
        }

        Device (\_SB.PCI0.EXPL)
        {
            Name (_HID, EisaId ("PNP0C02"))
            Name (_UID, 0x04)
            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0xE0000000,         // Address Base
                        0x10000000,         // Address Length
                        )
                })
                Return (BUF0)
            }
        }
    }

    OperationRegion (TEMM, SystemMemory, 0x000FF810, 0x0C)
    Field (TEMM, WordAcc, NoLock, Preserve)
    {
        TP1H,   16, 
        TP1L,   16, 
        TP2H,   16, 
        TP2L,   16, 
        TRPC,   16, 
        SENF,   16
    }

    Name (TVAR, Buffer (0x05)
    {
        0x00, 0x00, 0x00, 0x00, 0x00
    })
    CreateByteField (TVAR, 0x00, PLCY)
    CreateWordField (TVAR, 0x01, CTOS)
    CreateWordField (TVAR, 0x03, CTHY)
    Name (TBUF, Buffer (0x04)
    {
        0x00, 0x00, 0x00, 0x00
    })
    CreateByteField (TBUF, 0x00, DB00)
    CreateByteField (TBUF, 0x01, DB01)
    CreateWordField (TBUF, 0x00, DW00)
    CreateWordField (TBUF, 0x02, DW01)
    CreateDWordField (TBUF, 0x00, DATD)
    OperationRegion (SEN1, SystemIO, 0x0295, 0x02)
    Field (SEN1, ByteAcc, NoLock, Preserve)
    {
        SEI0,   8, 
        SED0,   8
    }

    Method (STOS, 3, NotSerialized)
    {
        If (LLess (Arg2, 0x0AAC))
        {
            Subtract (Arg2, 0x0AAC, Local0)
            Divide (Local0, 0x0A, Local0)
        }
        Else
        {
            Subtract (0x0AAC, Arg2, Local0)
            Divide (Local0, 0x0A, Local0)
            Add (Local0, 0x80, Local0)
        }

        WSEN (0x4E, 0x01)
        WSEN (0x53, Local0)
    }

    Method (STHY, 3, NotSerialized)
    {
        If (LLess (Arg2, 0x0AAC))
        {
            Subtract (Arg2, 0x0AAC, Local0)
            Divide (Local0, 0x0A, Local0)
        }
        Else
        {
            Subtract (0x0AAC, Arg2, Local0)
            Divide (Local0, 0x0A, Local0)
            Add (Local0, 0x80, Local0)
        }

        WSEN (0x4E, 0x01)
        WSEN (0x54, Local0)
    }

    Method (RTMP, 0, NotSerialized)
    {
        WSEN (0x4E, 0x01)
        Store (RSEN (0x50), Local0)
        If (LLess (Local0, 0x80))
        {
            Multiply (Local0, 0x0A, Local0)
            Add (Local0, 0x0AAC, Local0)
        }
        Else
        {
            Subtract (Local0, 0x80, Local0)
            Multiply (Local0, 0x0A, Local0)
            Subtract (0x0AAC, Local0, Local0)
        }

        If (LEqual (SSHU, 0x01))
        {
            Return (0x0C3C)
        }
        Else
        {
            Return (Local0)
        }
    }

    Method (WSEN, 2, NotSerialized)
    {
        Store (Arg0, SEI0)
        Store (Arg1, SED0)
    }

    Method (RSEN, 1, NotSerialized)
    {
        Store (Arg0, SEI0)
        Store (SED0, Local0)
        Return (Local0)
    }

    Scope (\_TZ)
    {
        Device (FAN)
        {
            Name (_HID, EisaId ("PNP0C0B"))
            Method (_INI, 0, NotSerialized)
            {
                Store (TP1H, CTOS)
                Store (TP1L, CTHY)
            }
        }

        ThermalZone (THRM)
        {
            Name (_AL0, Package (0x01)
            {
                FAN
            })
            Method (_AC0, 0, NotSerialized)
            {
                If (Or (PLCY, PLCY, Local7))
                {
                    Return (TP2H)
                }
                Else
                {
                    Return (TP1H)
                }
            }

            Name (_PSL, Package (0x01)
            {
                \_PR.CPU0
            })
            Name (_TSP, 0x3C)
            Name (_TC1, 0x04)
            Name (_TC2, 0x03)
            Method (_PSV, 0, NotSerialized)
            {
                If (Or (PLCY, PLCY, Local7))
                {
                    Return (TP1H)
                }
                Else
                {
                    Return (TP2H)
                }
            }

            Method (_CRT, 0, NotSerialized)
            {
                Return (0x0E74)
            }

            Method (_TMP, 0, NotSerialized)
            {
                Return (0x0B86)
            }

            Method (_SCP, 1, NotSerialized)
            {
                If (Arg0)
                {
                    Store (One, PLCY)
                }
                Else
                {
                    Store (Zero, PLCY)
                }

                Notify (\_TZ.THRM, 0x81)
            }

            Method (STMP, 2, NotSerialized)
            {
                Store (Arg1, DW00)
                If (Arg0)
                {
                    STHY (DB00, DB01, DW00)
                }
                Else
                {
                    STOS (DB00, DB01, DW00)
                }
            }
        }
    }
}

