/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (32-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of DSDT_live.aml
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x00007379 (29561)
 *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
 *     Checksum         0xFF
 *     OEM ID           "ACRSYS"
 *     OEM Table ID     "ACRPRDCT"
 *     OEM Revision     0x00000002 (2)
 *     Compiler ID      "1025"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "DSDT", 1, "ACRSYS", "ACRPRDCT", 0x00000002)
{
    /*
     * iASL Warning: There were 9 external control methods found during
     * disassembly, but only 0 were resolved (9 unresolved). Additional
     * ACPI tables may be required to properly disassemble the code. This
     * resulting disassembler output file may not compile because the
     * disassembler did not know how many arguments to assign to the
     * unresolved methods. Note: SSDTs can be dynamically loaded at
     * runtime and may or may not be available via the host OS.
     *
     * To specify the tables needed to resolve external control method
     * references, the -e option can be used to specify the filenames.
     * Example iASL invocations:
     *     iasl -e ssdt1.aml ssdt2.aml ssdt3.aml -d dsdt.aml
     *     iasl -e dsdt.aml ssdt2.aml -d ssdt1.aml
     *     iasl -e ssdt*.aml -d dsdt.aml
     *
     * In addition, the -fe option can be used to specify a file containing
     * control method external declarations with the associated method
     * argument counts. Each line of the file must be of the form:
     *     External (<method pathname>, MethodObj, <argument count>)
     * Invocation:
     *     iasl -fe refs.txt -d dsdt.aml
     *
     * The following methods were unresolved and many not compile properly
     * because the disassembler had to guess at the number of arguments
     * required for each:
     */
    External (_SB_.ALIB, MethodObj)    // Warning: Unknown method, guessing 2 arguments
    External (_SB_.APTS, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (_SB_.AWAK, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (_SB_.PCI0.GPP0.PEGP, UnknownObj)
    External (_SB_.PCI0.WMID, UnknownObj)
    External (_SB_.PCI0.WMID.FEBC, UnknownObj)
    External (_SB_.PLTF.C000._PPC, IntObj)
    External (_SB_.PLTF.C001._PPC, UnknownObj)
    External (_SB_.PLTF.C002._PPC, UnknownObj)
    External (_SB_.PLTF.C003._PPC, UnknownObj)
    External (_SB_.PLTF.C004._PPC, UnknownObj)
    External (_SB_.PLTF.C005._PPC, UnknownObj)
    External (_SB_.PLTF.C006._PPC, UnknownObj)
    External (_SB_.PLTF.C007._PPC, UnknownObj)
    External (_SB_.PLTF.C008._PPC, UnknownObj)
    External (_SB_.PLTF.C009._PPC, UnknownObj)
    External (_SB_.PLTF.C00A._PPC, UnknownObj)
    External (_SB_.PLTF.C00B._PPC, UnknownObj)
    External (_SB_.PLTF.C00C._PPC, UnknownObj)
    External (_SB_.PLTF.C00D._PPC, UnknownObj)
    External (_SB_.PLTF.C00E._PPC, UnknownObj)
    External (_SB_.PLTF.C00F._PPC, UnknownObj)
    External (_SB_.TPM2.PTS_, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (AFN4, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (AFN7, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (ALIB, MethodObj)    // Warning: Unknown method, guessing 2 arguments
    External (MPTS, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (MWAK, MethodObj)    // Warning: Unknown method, guessing 1 arguments
    External (WMID, UnknownObj)

    OperationRegion (DBG0, SystemIO, 0x80, One)
    Field (DBG0, ByteAcc, NoLock, Preserve)
    {
        IO80,   8
    }

    OperationRegion (DBG1, SystemIO, 0x80, 0x02)
    Field (DBG1, WordAcc, NoLock, Preserve)
    {
        P80H,   16
    }

    OperationRegion (ACMS, SystemIO, 0x72, 0x02)
    Field (ACMS, ByteAcc, NoLock, Preserve)
    {
        ACMX,   8, 
        ACMA,   8
    }

    IndexField (ACMX, ACMA, ByteAcc, NoLock, Preserve)
    {
        Offset (0xB9), 
        IMEN,   8
    }

    OperationRegion (PSMI, SystemIO, 0xB0, 0x02)
    Field (PSMI, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }

    OperationRegion (PMRG, SystemIO, 0x0CD6, 0x02)
    Field (PMRG, ByteAcc, NoLock, Preserve)
    {
        PMRI,   8, 
        PMRD,   8
    }

    IndexField (PMRI, PMRD, ByteAcc, NoLock, Preserve)
    {
            ,   6, 
        HPEN,   1, 
        Offset (0x60), 
        P1EB,   16, 
        Offset (0xF0), 
            ,   3, 
        RSTU,   1
    }

    OperationRegion (GSMG, SystemMemory, 0xFED81500, 0x03FF)
    Field (GSMG, AnyAcc, NoLock, Preserve)
    {
        Offset (0x30), 
        Offset (0x32), 
        GP0C,   1, 
            ,   4, 
        PD0C,   1, 
        OV0C,   1, 
        OE0C,   1, 
        Offset (0x44), 
        Offset (0x46), 
        BTNW,   1, 
            ,   5, 
        BTNO,   1, 
        Offset (0x5C), 
        Offset (0x5E), 
        GS23,   1, 
            ,   5, 
        GV23,   1, 
        GE23,   1, 
        Offset (0xA0), 
        Offset (0xA2), 
        GS40,   1, 
            ,   5, 
        GV40,   1, 
        GE40,   1, 
        Offset (0x118), 
        Offset (0x11A), 
        BTPW,   1, 
            ,   5, 
        BTPO,   1
    }

    OperationRegion (GSMM, SystemMemory, 0xFED80000, 0x1000)
    Field (GSMM, AnyAcc, NoLock, Preserve)
    {
        Offset (0x288), 
            ,   1, 
        CLPS,   1, 
        Offset (0x2B0), 
            ,   2, 
        SLPS,   2
    }

    OperationRegion (PMI2, SystemIO, 0x0CD6, 0x02)
    Field (PMI2, AnyAcc, NoLock, Preserve)
    {
        PM2I,   8, 
        PM2D,   8
    }

    IndexField (PM2I, PM2D, ByteAcc, NoLock, Preserve)
    {
        Offset (0xBB), 
            ,   6, 
        PWDE,   1, 
        Offset (0xBC)
    }

    OperationRegion (P1E0, SystemIO, P1EB, 0x04)
    Field (P1E0, ByteAcc, NoLock, Preserve)
    {
            ,   14, 
        PEWS,   1, 
        WSTA,   1, 
            ,   14, 
        PEWD,   1
    }

    OperationRegion (IOCC, SystemIO, 0x0400, 0x80)
    Field (IOCC, ByteAcc, NoLock, Preserve)
    {
        Offset (0x01), 
            ,   2, 
        RTCS,   1
    }

    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        PRWP [Zero] = Arg0
        PRWP [One] = Arg1
        If ((DAS3 == Zero))
        {
            If ((Arg1 <= 0x03))
            {
                PRWP [One] = Zero
            }
        }

        Return (PRWP) /* \PRWP */
    }

    Method (SPTS, 1, NotSerialized)
    {
        If ((Arg0 == 0x03))
        {
            RSTU = Zero
        }

        CLPS = One
        SLPS = One
        PEWS = PEWS /* \PEWS */
    }

    Method (SWAK, 1, NotSerialized)
    {
        If ((Arg0 == 0x03))
        {
            RSTU = One
        }

        PEWS = PEWS /* \PEWS */
        PEWD = Zero
    }

    Method (TPST, 1, Serialized)
    {
        Local0 = (Arg0 + 0xB0000000)
        OperationRegion (VARM, SystemIO, 0x80, 0x04)
        Field (VARM, DWordAcc, NoLock, Preserve)
        {
            VARR,   32
        }

        VARR = Local0
    }

    OperationRegion (AOAR, SystemMemory, 0xFED81E00, 0x0100)
    Field (AOAR, AnyAcc, Lock, Preserve)
    {
        Offset (0x76), 
            ,   3, 
        PWRD,   1
    }

    OperationRegion (XCMS, SystemIO, 0x72, 0x02)
    Field (XCMS, ByteAcc, NoLock, Preserve)
    {
        CMSI,   8, 
        CMSD,   8
    }

    Method (CMSW, 2, NotSerialized)
    {
        CMSI = Arg0
        CMSD = Arg1
    }

    Method (CMSR, 1, NotSerialized)
    {
        CMSI = Arg0
        Return (CMSD) /* \CMSD */
    }

    OperationRegion (GNVS, SystemMemory, 0xCDF79998, 0x0000018B)
    Field (GNVS, AnyAcc, NoLock, Preserve)
    {
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        BRTL,   8, 
        TLST,   8, 
        IGDS,   8, 
        LCDA,   16, 
        CSTE,   16, 
        NSTE,   16, 
        CADL,   16, 
        PADL,   16, 
        LIDS,   8, 
        PWRS,   8, 
        BVAL,   32, 
        ADDL,   16, 
        BCMD,   8, 
        SBFN,   8, 
        DID,    32, 
        INFO,   2048, 
        TOML,   8, 
        TOMH,   8, 
        CEBP,   8, 
        C0LS,   8, 
        C1LS,   8, 
        C0HS,   8, 
        C1HS,   8, 
        ROMS,   32, 
        MUXF,   8, 
        PDDN,   8, 
        CNSB,   8, 
        RDHW,   8, 
        DAS3,   8, 
        TNBH,   8, 
        TCP0,   8, 
        TCP1,   8, 
        ATNB,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PWMN,   8, 
        LPTY,   8, 
        M92D,   8, 
        WKPM,   8, 
        ALST,   8, 
        AFUC,   8, 
        EXUS,   8, 
        GV0E,   8, 
        WLSH,   8, 
        TSSS,   8, 
        AOZP,   8, 
        TZFG,   8, 
        BPS0,   8, 
        NAPC,   8, 
        PCBA,   32, 
        PCBL,   32, 
        WLAN,   8, 
        BLTH,   8, 
        GPSS,   8, 
        NFCS,   8, 
        SBTY,   8, 
        BDID,   16, 
        MWTT,   8, 
        ACPM,   8, 
        KBCS,   8, 
        ACEC,   8, 
        DPTC,   8, 
        ECTL,   8, 
        MM64,   8, 
        HMB1,   64, 
        HMB2,   64, 
        HMM1,   64, 
        HMM2,   64, 
        HML1,   64, 
        HML2,   64, 
        WOVS,   8, 
        TCNT,   8, 
        NPWD,   8
    }

    OperationRegion (OGNS, SystemMemory, 0xCDF64E98, 0x0000000E)
    Field (OGNS, AnyAcc, Lock, Preserve)
    {
        CCHP,   8, 
        CCNP,   8, 
        M2WL,   8, 
        THPN,   8, 
        PBAR,   8, 
        THPD,   8, 
        DTEN,   8, 
        SDMO,   8, 
        TBEN,   8, 
        TBNH,   8, 
        RV2I,   8, 
        ISDS,   8, 
        WLWS,   8, 
        BOID,   8
    }

    Method (SCMP, 2, NotSerialized)
    {
        Name (STG1, Buffer (0x50){})
        Name (STG2, Buffer (0x50){})
        STG1 = Arg0
        STG2 = Arg1
        If ((SizeOf (Arg0) != SizeOf (Arg1)))
        {
            Return (Zero)
        }

        Local0 = Zero
        While ((Local0 < SizeOf (Arg0)))
        {
            If ((DerefOf (STG1 [Local0]) != DerefOf (STG2 [Local0]
                )))
            {
                Return (Zero)
            }

            Local0++
        }

        Return (One)
    }

    Name (WNOS, Zero)
    Name (MYOS, Zero)
    Name (HTTS, Zero)
    Name (OSTB, Ones)
    Name (TPOS, Zero)
    Name (LINX, Zero)
    Name (OSSP, Zero)
    Method (SEQL, 2, Serialized)
    {
        Local0 = SizeOf (Arg0)
        Local1 = SizeOf (Arg1)
        If ((Local0 != Local1))
        {
            Return (Zero)
        }

        Name (BUF0, Buffer (Local0){})
        BUF0 = Arg0
        Name (BUF1, Buffer (Local0){})
        BUF1 = Arg1
        Local2 = Zero
        While ((Local2 < Local0))
        {
            Local3 = DerefOf (BUF0 [Local2])
            Local4 = DerefOf (BUF1 [Local2])
            If ((Local3 != Local4))
            {
                Return (Zero)
            }

            Local2++
        }

        Return (One)
    }

    Method (OSTP, 0, NotSerialized)
    {
        If ((OSTB == Ones))
        {
            OSYS = 0x07D9
            If (CondRefOf (\_OSI, Local0))
            {
                OSTB = Zero
                TPOS = Zero
                If (_OSI ("Windows 2001"))
                {
                    OSTB = 0x08
                    TPOS = 0x08
                }

                If (_OSI ("Windows 2001.1"))
                {
                    OSTB = 0x20
                    TPOS = 0x20
                }

                If (_OSI ("Windows 2001 SP1"))
                {
                    OSTB = 0x10
                    TPOS = 0x10
                }

                If (_OSI ("Windows 2001 SP2"))
                {
                    OSTB = 0x11
                    TPOS = 0x11
                }

                If (_OSI ("Windows 2001 SP3"))
                {
                    OSTB = 0x12
                    TPOS = 0x12
                }

                If (_OSI ("Windows 2006"))
                {
                    OSTB = 0x40
                    TPOS = 0x40
                }

                If (_OSI ("Windows 2006 SP1"))
                {
                    OSTB = 0x41
                    TPOS = 0x41
                    OSSP = One
                }

                If (_OSI ("Windows 2009"))
                {
                    OSSP = One
                    OSTB = 0x50
                    TPOS = 0x50
                    OSYS = 0x07D9
                }

                If (_OSI ("Windows 2012"))
                {
                    OSSP = One
                    OSTB = 0x60
                    TPOS = 0x60
                    OSYS = 0x07DC
                }

                If (_OSI ("Windows 2013"))
                {
                    OSSP = One
                    OSTB = 0x61
                    TPOS = 0x61
                    OSYS = 0x07DD
                }

                If (_OSI ("Windows 2015"))
                {
                    OSSP = One
                    OSTB = 0x70
                    TPOS = 0x70
                    OSYS = 0x07DF
                }

                If (_OSI ("Windows 2016"))
                {
                    OSSP = One
                    OSTB = 0x71
                    TPOS = 0x71
                    OSYS = 0x07E0
                }

                If (_OSI ("Windows 2017"))
                {
                    OSSP = One
                    OSTB = 0x72
                    TPOS = 0x72
                    OSYS = 0x07E1
                }

                If (_OSI ("Windows 2017.2"))
                {
                    OSSP = One
                    OSTB = 0x73
                    TPOS = 0x73
                    OSYS = 0x07E1
                }

                If (_OSI ("Linux"))
                {
                    LINX = One
                    OSTB = 0x80
                    TPOS = 0x80
                }
            }
            ElseIf (CondRefOf (\_OS, Local0))
            {
                If (SEQL (_OS, "Microsoft Windows"))
                {
                    OSTB = One
                    TPOS = One
                }
                ElseIf (SEQL (_OS, "Microsoft WindowsME: Millennium Edition"))
                {
                    OSTB = 0x02
                    TPOS = 0x02
                }
                ElseIf (SEQL (_OS, "Microsoft Windows NT"))
                {
                    OSTB = 0x04
                    TPOS = 0x04
                }
                Else
                {
                    OSTB = Zero
                    TPOS = Zero
                }
            }
            Else
            {
                OSTB = Zero
                TPOS = Zero
            }
        }

        Return (OSTB) /* \OSTB */
    }

    Name (BUFN, Zero)
    Name (MBUF, Buffer (0x1000){})
    OperationRegion (MDBG, SystemMemory, 0xCDEB3018, 0x00001004)
    Field (MDBG, AnyAcc, Lock, Preserve)
    {
        MDG0,   32768
    }

    Method (DB2H, 1, Serialized)
    {
        SHOW (Arg0)
        MDGC (0x20)
        MDG0 = MBUF /* \MBUF */
    }

    Method (DW2H, 1, Serialized)
    {
        Local0 = Arg0
        Local1 = (Arg0 >> 0x08)
        Local0 &= 0xFF
        Local1 &= 0xFF
        DB2H (Local1)
        BUFN--
        DB2H (Local0)
    }

    Method (DD2H, 1, Serialized)
    {
        Local0 = Arg0
        Local1 = (Arg0 >> 0x10)
        Local0 &= 0xFFFF
        Local1 &= 0xFFFF
        DW2H (Local1)
        BUFN--
        DW2H (Local0)
    }

    Method (MBGS, 1, Serialized)
    {
        Local0 = SizeOf (Arg0)
        Name (BUFS, Buffer (Local0){})
        BUFS = Arg0
        MDGC (0x20)
        While (Local0)
        {
            MDGC (DerefOf (BUFS [(SizeOf (Arg0) - Local0)]))
            Local0--
        }

        MDG0 = MBUF /* \MBUF */
    }

    Method (SHOW, 1, Serialized)
    {
        MDGC (NTOC ((Arg0 >> 0x04)))
        MDGC (NTOC (Arg0))
    }

    Method (LINE, 0, Serialized)
    {
        Local0 = BUFN /* \BUFN */
        Local0 &= 0x0F
        While (Local0)
        {
            MDGC (Zero)
            Local0++
            Local0 &= 0x0F
        }
    }

    Method (MDGC, 1, Serialized)
    {
        MBUF [BUFN] = Arg0
        BUFN += One
        If ((BUFN > 0x0FFF))
        {
            BUFN &= 0x0FFF
            UP_L (One)
        }
    }

    Method (UP_L, 1, Serialized)
    {
        Local2 = Arg0
        Local2 <<= 0x04
        MOVE (Local2)
        Local3 = (0x1000 - Local2)
        While (Local2)
        {
            MBUF [Local3] = Zero
            Local3++
            Local2--
        }
    }

    Method (MOVE, 1, Serialized)
    {
        Local4 = Arg0
        BUFN = Zero
        Local5 = (0x1000 - Local4)
        While (Local5)
        {
            Local5--
            MBUF [BUFN] = DerefOf (MBUF [Local4])
            BUFN++
            Local4++
        }
    }

    Method (NTOC, 1, Serialized)
    {
        Local0 = (Arg0 & 0x0F)
        If ((Local0 < 0x0A))
        {
            Local0 += 0x30
        }
        Else
        {
            Local0 += 0x37
        }

        Return (Local0)
    }

    Scope (_SB)
    {
        Device (PLTF)
        {
            Name (_HID, "ACPI0010" /* Processor Container Device */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A05") /* Generic Container Device */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Device (C000)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, Zero)  // _UID: Unique ID
            }

            Device (C001)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, One)  // _UID: Unique ID
            }

            Device (C002)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x02)  // _UID: Unique ID
            }

            Device (C003)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x03)  // _UID: Unique ID
            }

            Device (C004)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x04)  // _UID: Unique ID
            }

            Device (C005)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x05)  // _UID: Unique ID
            }

            Device (C006)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x06)  // _UID: Unique ID
            }

            Device (C007)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x07)  // _UID: Unique ID
            }

            Device (C008)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x08)  // _UID: Unique ID
            }

            Device (C009)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x09)  // _UID: Unique ID
            }

            Device (C00A)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0A)  // _UID: Unique ID
            }

            Device (C00B)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0B)  // _UID: Unique ID
            }

            Device (C00C)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0C)  // _UID: Unique ID
            }

            Device (C00D)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0D)  // _UID: Unique ID
            }

            Device (C00E)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0E)  // _UID: Unique ID
            }

            Device (C00F)
            {
                Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                Name (_UID, 0x0F)  // _UID: Unique ID
            }
        }
    }

    Name (_S0, Package (0x04)  // _S0_: S0 System State
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If ((DAS3 == One))
    {
        Name (_S3, Package (0x04)  // _S3_: S3 System State
        {
            0x03, 
            0x03, 
            Zero, 
            Zero
        })
    }

    Name (_S4, Package (0x04)  // _S4_: S4 System State
    {
        0x04, 
        0x04, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)  // _S5_: S5 System State
    {
        0x05, 
        0x05, 
        Zero, 
        Zero
    })
    Scope (_GPE)
    {
        Method (_L08, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            TPST (0x3908)
            If ((TBEN == Zero))
            {
                Notify (\_SB.PCI0.GPP0, 0x02) // Device Wake
                Notify (\_SB.PCI0.GPP1, 0x02) // Device Wake
            }

            Notify (\_SB.PCI0.GPP5, 0x02) // Device Wake
            Notify (\_SB.PCI0.GP17, 0x02) // Device Wake
            Notify (\_SB.PCI0.GP18, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Method (_L19, 0, NotSerialized)  // _Lxx: Level-Triggered GPE, xx=0x00-0xFF
        {
            TPST (0x3919)
            Notify (\_SB.PCI0.GP17.XHC0, 0x02) // Device Wake
            Notify (\_SB.PCI0.GP17.XHC1, 0x02) // Device Wake
            Notify (\_SB.PWRB, 0x02) // Device Wake
        }

        Method (_E05, 0, NotSerialized)  // _Exx: Edge-Triggered GPE, xx=0x00-0xFF
        {
            TPST (0x3905)
            Notify (\_SB.PCI0.GPP0.PEGP, 0x81) // Information Change
        }

        Method (XE09, 0, NotSerialized)
        {
            TPST (0x3909)
            Notify (\_SB.PCI0.GPP0.PEGP, 0x81) // Information Change
        }
    }

    Name (PICM, Zero)
    Name (GPIC, Zero)
    Method (_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        PICM = Arg0
        GPIC = Arg0
        If (PICM)
        {
            \_SB.DSPI ()
            If (NAPC)
            {
                \_SB.PCI0.NAPE ()
            }
        }
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        SPTS (Arg0)
        If ((Arg0 == One))
        {
            \_SB.S80H (0x51)
        }

        If ((Arg0 == 0x03))
        {
            \_SB.S80H (0x53)
            SLPS = One
        }

        If ((Arg0 == 0x04))
        {
            \_SB.S80H (0x54)
            SLPS = One
            RSTU = One
        }

        If ((Arg0 == 0x05))
        {
            \_SB.S80H (0x55)
            If ((WKPM == One))
            {
                PWDE = One
            }

            BCMD = 0x90
            \_SB.BSMI (Zero)
            \_SB.GSMI (0x03)
        }

        If (CondRefOf (\_SB.TPM2.PTS))
        {
            \_SB.TPM2.PTS (Arg0)
        }

        \_SB.APTS (Arg0)
        If (Arg0)
        {
            \_SB.PCI0.LPC0.ECFG (Zero)
        }

        If ((Arg0 == 0x03))
        {
            \_SB.PCI0.LPC0.EC0.S3ST = One
            If ((TPDD == 0x02))
            {
                \_SB.PCI0.LPC0.EC0.PTPS = One
            }
            Else
            {
                \_SB.PCI0.LPC0.EC0.PTPS = Zero
            }
        }

        If ((Arg0 == 0x04))
        {
            \_SB.PCI0.LPC0.EC0.S4ST = One
        }

        If ((Arg0 == 0x05))
        {
            \_SB.PCI0.LPC0.EC0.S5ST = One
        }

        Local0 = CMSR (0x7E)
        Local0 |= 0x80
        CMSW (0x7E, Local0)
        MPTS (Arg0)
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        SWAK (Arg0)
        \_SB.AWAK (Arg0)
        If (((Arg0 == 0x03) || (Arg0 == 0x04)))
        {
            If ((GPIC != Zero))
            {
                \_SB.DSPI ()
                If (NAPC)
                {
                    \_SB.PCI0.NAPE ()
                }
            }
        }

        If ((Arg0 == 0x03))
        {
            \_SB.S80H (0xE3)
        }

        If ((Arg0 == 0x04))
        {
            \_SB.S80H (0xE4)
        }

        If (((Arg0 == 0x03) || (Arg0 == 0x04)))
        {
            \_SB.PCI0.LPC0.ECFG (One)
        }

        If ((Arg0 == 0x03))
        {
            \_SB.PCI0.LPC0.EC0.S3RM = One
        }

        If ((Arg0 == 0x04))
        {
            \_SB.PCI0.LPC0.OSTP ()
            \_SB.PCI0.LPC0.EC0.S4RM = One
        }

        If ((Arg0 == 0x05))
        {
            \_SB.PCI0.LPC0.EC0.S5RM = One
        }

        MWAK (Arg0)
        Return (Zero)
    }

    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C") /* Power Button Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E") /* Sleep Button Device */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }

        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (_ADR, Zero)  // _ADR: Address
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If ((GPIC != Zero))
                {
                    DSPI ()
                    If (NAPC)
                    {
                        NAPE ()
                    }
                }

                OSTP ()
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    If ((TBEN == One))
                    {
                        If ((TBNH != Zero))
                        {
                            CTRL &= 0xFFFFFFF5
                        }
                        Else
                        {
                            CTRL &= 0xFFFFFFF4
                        }
                    }

                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    CTRL &= 0x1D
                    If (~(CDW1 & One))
                    {
                        If ((CTRL & One)){}
                        If ((CTRL & 0x04)){}
                        If ((CTRL & 0x10)){}
                    }

                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Method (TOM, 0, NotSerialized)
            {
                Local0 = (TOML * 0x00010000)
                Local1 = (TOMH * 0x01000000)
                Local0 += Local1
                Return (Local0)
            }

            Name (CRES, Buffer (0x0299)
            {
                /* 0000 */  0x88, 0x0E, 0x00, 0x02, 0x0E, 0x00, 0x00, 0x00,  // ........
                /* 0008 */  0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01,  // ........
                /* 0010 */  0x00, 0x88, 0x0E, 0x00, 0x01, 0x0C, 0x03, 0x00,  // ........
                /* 0018 */  0x00, 0x00, 0x00, 0xF7, 0x0C, 0x00, 0x00, 0xF8,  // ........
                /* 0020 */  0x0C, 0x00, 0x88, 0x0D, 0x00, 0x01, 0x0C, 0x03,  // ........
                /* 0028 */  0x00, 0x00, 0x00, 0x0D, 0xFF, 0xFF, 0x00, 0x00,  // ........
                /* 0030 */  0x00, 0xF3, 0x87, 0x18, 0x00, 0x00, 0x0E, 0x01,  // ........
                /* 0038 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00,  // ........
                /* 0040 */  0xFF, 0xFF, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0048 */  0x00, 0x00, 0x02, 0x00, 0x00, 0x87, 0x18, 0x00,  // ........
                /* 0050 */  0x00, 0x0E, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0058 */  0x00, 0x0C, 0x00, 0xFF, 0x3F, 0x0C, 0x00, 0x00,  // ....?...
                /* 0060 */  0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00,  // ....@...
                /* 0068 */  0x87, 0x18, 0x00, 0x00, 0x0E, 0x02, 0x00, 0x00,  // ........
                /* 0070 */  0x00, 0x00, 0x00, 0x40, 0x0C, 0x00, 0xFF, 0x7F,  // ...@....
                /* 0078 */  0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40,  // .......@
                /* 0080 */  0x00, 0x00, 0x00, 0x87, 0x18, 0x00, 0x00, 0x0E,  // ........
                /* 0088 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C,  // ........
                /* 0090 */  0x00, 0xFF, 0xBF, 0x0C, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0098 */  0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x87, 0x18,  // ..@.....
                /* 00A0 */  0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 00A8 */  0x00, 0xC0, 0x0C, 0x00, 0xFF, 0xFF, 0x0C, 0x00,  // ........
                /* 00B0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00,  // .....@..
                /* 00B8 */  0x00, 0x87, 0x18, 0x00, 0x00, 0x0E, 0x01, 0x00,  // ........
                /* 00C0 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0xFF,  // ........
                /* 00C8 */  0x3F, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ?.......
                /* 00D0 */  0x40, 0x00, 0x00, 0x00, 0x87, 0x18, 0x00, 0x00,  // @.......
                /* 00D8 */  0x0E, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40,  // .......@
                /* 00E0 */  0x0D, 0x00, 0xFF, 0x7F, 0x0D, 0x00, 0x00, 0x00,  // ........
                /* 00E8 */  0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x87,  // ...@....
                /* 00F0 */  0x18, 0x00, 0x00, 0x0E, 0x01, 0x00, 0x00, 0x00,  // ........
                /* 00F8 */  0x00, 0x00, 0x80, 0x0D, 0x00, 0xFF, 0xBF, 0x0D,  // ........
                /* 0100 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00,  // ......@.
                /* 0108 */  0x00, 0x00, 0x87, 0x18, 0x00, 0x00, 0x0E, 0x01,  // ........
                /* 0110 */  0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x0D, 0x00,  // ........
                /* 0118 */  0xFF, 0xFF, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0120 */  0x00, 0x40, 0x00, 0x00, 0x00, 0x87, 0x18, 0x00,  // .@......
                /* 0128 */  0x00, 0x0E, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0130 */  0x00, 0x0E, 0x00, 0xFF, 0x3F, 0x0E, 0x00, 0x00,  // ....?...
                /* 0138 */  0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00,  // ....@...
                /* 0140 */  0x87, 0x18, 0x00, 0x00, 0x0E, 0x03, 0x00, 0x00,  // ........
                /* 0148 */  0x00, 0x00, 0x00, 0x40, 0x0E, 0x00, 0xFF, 0x7F,  // ...@....
                /* 0150 */  0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40,  // .......@
                /* 0158 */  0x00, 0x00, 0x00, 0x87, 0x18, 0x00, 0x00, 0x0E,  // ........
                /* 0160 */  0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x0E,  // ........
                /* 0168 */  0x00, 0xFF, 0xBF, 0x0E, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0170 */  0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x87, 0x18,  // ..@.....
                /* 0178 */  0x00, 0x00, 0x0E, 0x03, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0180 */  0x00, 0xC0, 0x0E, 0x00, 0xFF, 0xFF, 0x0E, 0x00,  // ........
                /* 0188 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00,  // .....@..
                /* 0190 */  0x00, 0x87, 0x18, 0x00, 0x00, 0x0E, 0x01, 0x00,  // ........
                /* 0198 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xFF,  // ........
                /* 01A0 */  0xFF, 0xFF, 0xF7, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 01A8 */  0x00, 0x00, 0x78, 0x00, 0x87, 0x18, 0x00, 0x00,  // ..x.....
                /* 01B0 */  0x0E, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 01B8 */  0x00, 0xFC, 0xFF, 0xFF, 0xAF, 0xFE, 0x00, 0x00,  // ........
                /* 01C0 */  0x00, 0x00, 0x00, 0x00, 0xB0, 0x02, 0x00, 0x87,  // ........
                /* 01C8 */  0x18, 0x00, 0x00, 0x0E, 0x01, 0x00, 0x00, 0x00,  // ........
                /* 01D0 */  0x00, 0x00, 0x50, 0xD4, 0xFE, 0xFF, 0x11, 0xD8,  // ..P.....
                /* 01D8 */  0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC2, 0x03,  // ........
                /* 01E0 */  0x00, 0x00, 0x87, 0x18, 0x00, 0x00, 0x0E, 0x01,  // ........
                /* 01E8 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x19, 0xD8, 0xFE,  // ........
                /* 01F0 */  0xFF, 0x1F, 0xD8, 0xFE, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 01F8 */  0x00, 0x07, 0x00, 0x00, 0x00, 0x87, 0x18, 0x00,  // ........
                /* 0200 */  0x00, 0x0E, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0208 */  0x00, 0xDC, 0xFE, 0xFF, 0x0F, 0xDC, 0xFE, 0x00,  // ........
                /* 0210 */  0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00,  // ........
                /* 0218 */  0x87, 0x18, 0x00, 0x00, 0x0E, 0x01, 0x00, 0x00,  // ........
                /* 0220 */  0x00, 0x00, 0x00, 0x60, 0xDC, 0xFE, 0xFF, 0x6F,  // ...`...o
                /* 0228 */  0xDC, 0xFE, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10,  // ........
                /* 0230 */  0x00, 0x00, 0x00, 0x47, 0x01, 0xF8, 0x0C, 0xF8,  // ...G....
                /* 0238 */  0x0C, 0x01, 0x08, 0x8A, 0x2B, 0x00, 0x00, 0x0C,  // ....+...
                /* 0240 */  0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0248 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0250 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0258 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0260 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0268 */  0x00, 0x8A, 0x2B, 0x00, 0x00, 0x0C, 0x01, 0x00,  // ..+.....
                /* 0270 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0278 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0280 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0288 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                /* 0290 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                /* 0298 */  0x00                                             // .
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateDWordField (CRES, 0x019B, BTMN)
                CreateDWordField (CRES, 0x019F, BTMX)
                CreateDWordField (CRES, 0x01A7, BTLN)
                CreateDWordField (CRES, 0x01B6, BTN1)
                CreateDWordField (CRES, 0x01BA, BTX1)
                CreateDWordField (CRES, 0x01C2, BTL1)
                BTMN = TOM ()
                BTMX = (PCBA - One)
                BTLN = (PCBA - BTMN) /* \_SB_.PCI0._CRS.BTMN */
                BTN1 = (PCBL + One)
                BTL1 = (BTX1 - BTN1) /* \_SB_.PCI0._CRS.BTN1 */
                BTL1 += One
                If ((MM64 == One))
                {
                    CreateQWordField (CRES, 0x0249, M1MN)
                    CreateQWordField (CRES, 0x0251, M1MX)
                    CreateQWordField (CRES, 0x0261, M1LN)
                    M1MN = HMB1 /* \HMB1 */
                    M1MX = HMM1 /* \HMM1 */
                    M1LN = HML1 /* \HML1 */
                    CreateQWordField (CRES, 0x0277, M2MN)
                    CreateQWordField (CRES, 0x027F, M2MX)
                    CreateQWordField (CRES, 0x028F, M2LN)
                    M2MN = HMB2 /* \HMB2 */
                    M2MX = HMM2 /* \HMM2 */
                    M2LN = HML2 /* \HML2 */
                }

                Return (CRES) /* \_SB_.PCI0.CRES */
            }

            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                Name (BAR3, 0xFDE00000)
                Name (MEM1, Buffer (0x26)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x86, 0x09, 0x00, 0x01,  // ........
                    /* 0010 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0018 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0020 */  0x00, 0x00, 0x00, 0x00, 0x79, 0x00               // ....y.
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (MEM1, 0x04, MB01)
                    CreateDWordField (MEM1, 0x08, ML01)
                    CreateDWordField (MEM1, 0x10, MB02)
                    CreateDWordField (MEM1, 0x14, ML02)
                    CreateDWordField (MEM1, 0x1C, MB03)
                    CreateDWordField (MEM1, 0x20, ML03)
                    If (GPIC)
                    {
                        MB01 = 0xFEC00000
                        MB02 = 0xFEE00000
                        ML01 = 0x1000
                        If (NAPC)
                        {
                            ML01 += 0x1000
                        }

                        ML02 = 0x1000
                    }

                    If ((BAR3 != 0xFFF00000))
                    {
                        MB03 = BAR3 /* \_SB_.PCI0.MEMR.BAR3 */
                        ML03 = 0x00100000
                    }

                    Return (MEM1) /* \_SB_.PCI0.MEMR.MEM1 */
                }
            }

            Mutex (NAPM, 0x00)
            Method (NAPE, 0, NotSerialized)
            {
                Acquire (NAPM, 0xFFFF)
                Local0 = (PCBA + 0xB8)
                OperationRegion (VARM, SystemMemory, Local0, 0x08)
                Field (VARM, DWordAcc, NoLock, Preserve)
                {
                    NAPX,   32, 
                    NAPD,   32
                }

                Local1 = NAPX /* \_SB_.PCI0.NAPE.NAPX */
                NAPX = 0x14300000
                Local0 = NAPD /* \_SB_.PCI0.NAPE.NAPD */
                Local0 &= 0xFFFFFFEF
                NAPD = Local0
                NAPX = Local1
                Release (NAPM)
            }

            Name (PR00, Package (0x0E)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    LNKA, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    LNKB, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    LNKC, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    LNKE, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    LNKF, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    LNKG, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    LNKH, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    LNKA, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    LNKB, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x02, 
                    LNKC, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    LNKA, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    LNKB, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    LNKC, , 
                    Zero
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    LNKD, , 
                    Zero
                }
            })
            Name (AR00, Package (0x0E)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x14
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    Zero, 
                    0x15
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    Zero, 
                    0x16
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    Zero, 
                    0x17
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }
            })
            Name (NR00, Package (0x0E)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x28
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x29
                }, 

                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x2A
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    Zero, 
                    Zero, 
                    0x24
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    One, 
                    Zero, 
                    0x25
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x02, 
                    Zero, 
                    0x26
                }, 

                Package (0x04)
                {
                    0x0002FFFF, 
                    0x03, 
                    Zero, 
                    0x27
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x20
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x21
                }, 

                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x22
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 

                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }
            })
            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (PICM)
                {
                    If (NAPC)
                    {
                        Return (NR00) /* \_SB_.PCI0.NR00 */
                    }
                    Else
                    {
                        Return (AR00) /* \_SB_.PCI0.AR00 */
                    }
                }
                Else
                {
                    Return (PR00) /* \_SB_.PCI0.PR00 */
                }
            }

            Device (GPP0)
            {
                Name (_ADR, 0x00010001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, , 
                        Zero
                    }
                })
                Name (AR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x18
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x19
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1A
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1B
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR01) /* \_SB_.PCI0.GPP0.NR01 */
                        }
                        Else
                        {
                            Return (AR01) /* \_SB_.PCI0.GPP0.AR01 */
                        }
                    }
                    Else
                    {
                        Return (PR01) /* \_SB_.PCI0.GPP0.PR01 */
                    }
                }
            }

            Device (GPP1)
            {
                Name (_ADR, 0x00010002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, , 
                        Zero
                    }
                })
                Name (AR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x1C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x1D
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1F
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR02) /* \_SB_.PCI0.GPP1.NR02 */
                        }
                        Else
                        {
                            Return (AR02) /* \_SB_.PCI0.GPP1.AR02 */
                        }
                    }
                    Else
                    {
                        Return (PR02) /* \_SB_.PCI0.GPP1.PR02 */
                    }
                }

                Device (DEV0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }
                }

                Device (DEV1)
                {
                    Name (_ADR, One)  // _ADR: Address
                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (Zero)
                    }
                }
            }

            Device (GPP2)
            {
                Name (_ADR, 0x00010003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x0D, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x0D, Zero))
                    }
                }

                Name (PR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, , 
                        Zero
                    }
                })
                Name (AR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x20
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x21
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x22
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x23
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR03) /* \_SB_.PCI0.GPP2.NR03 */
                        }
                        Else
                        {
                            Return (AR03) /* \_SB_.PCI0.GPP2.AR03 */
                        }
                    }
                    Else
                    {
                        Return (PR03) /* \_SB_.PCI0.GPP2.PR03 */
                    }
                }

                Device (WWAN)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (GPP3)
            {
                Name (_ADR, 0x00020001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x0F, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x0F, Zero))
                    }
                }

                Name (PR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, , 
                        Zero
                    }
                })
                Name (AR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x24
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x25
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x26
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x27
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR04) /* \_SB_.PCI0.GPP3.NR04 */
                        }
                        Else
                        {
                            Return (AR04) /* \_SB_.PCI0.GPP3.AR04 */
                        }
                    }
                    Else
                    {
                        Return (PR04) /* \_SB_.PCI0.GPP3.PR04 */
                    }
                }

                Device (RTL8)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (GPP4)
            {
                Name (_ADR, 0x00020002)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        If ((WLWS == Zero))
                        {
                            Return (GPRW (0x0E, Zero))
                        }
                        Else
                        {
                            Return (GPRW (0x0E, 0x04))
                        }
                    }
                    Else
                    {
                        Return (GPRW (0x0E, Zero))
                    }
                }

                Name (PR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, , 
                        Zero
                    }
                })
                Name (AR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x28
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x29
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2A
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2B
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR05) /* \_SB_.PCI0.GPP4.NR05 */
                        }
                        Else
                        {
                            Return (AR05) /* \_SB_.PCI0.GPP4.AR05 */
                        }
                    }
                    Else
                    {
                        Return (PR05) /* \_SB_.PCI0.GPP4.PR05 */
                    }
                }
            }

            Device (GPP5)
            {
                Name (_ADR, 0x00020003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, , 
                        Zero
                    }
                })
                Name (AR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2D
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2F
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR06) /* \_SB_.PCI0.GPP5.NR06 */
                        }
                        Else
                        {
                            Return (AR06) /* \_SB_.PCI0.GPP5.AR06 */
                        }
                    }
                    Else
                    {
                        Return (PR06) /* \_SB_.PCI0.GPP5.PR06 */
                    }
                }

                Device (DEV0)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }
            }

            Device (GPP6)
            {
                Name (_ADR, 0x00020004)  // _ADR: Address
                Name (PR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, , 
                        Zero
                    }
                })
                Name (AR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x30
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x31
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x32
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x33
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR07) /* \_SB_.PCI0.GPP6.NR07 */
                        }
                        Else
                        {
                            Return (AR07) /* \_SB_.PCI0.GPP6.AR07 */
                        }
                    }
                    Else
                    {
                        Return (PR07) /* \_SB_.PCI0.GPP6.PR07 */
                    }
                }
            }

            Device (GP17)
            {
                Name (_ADR, 0x00080001)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x19, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x19, Zero))
                    }
                }

                Name (PR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, , 
                        Zero
                    }
                })
                Name (AR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x15
                    }
                })
                Name (NR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x26
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x27
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x24
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x25
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR17) /* \_SB_.PCI0.GP17.NR17 */
                        }
                        Else
                        {
                            Return (AR17) /* \_SB_.PCI0.GP17.AR17 */
                        }
                    }
                    Else
                    {
                        Return (PR17) /* \_SB_.PCI0.GP17.PR17 */
                    }
                }

                Device (VGA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (DOSA, Zero)
                    Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                    {
                        DOSA = Arg0
                    }

                    Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                    {
                        Return (Package (0x07)
                        {
                            0x00010110, 
                            0x00010210, 
                            0x00010220, 
                            0x00010230, 
                            0x00010240, 
                            0x00031000, 
                            0x00032000
                        })
                    }

                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)  // _ADR: Address
                        Name (BCLB, Package (0x34)
                        {
                            0x5A, 
                            0x3C, 
                            0x02, 
                            0x04, 
                            0x06, 
                            0x08, 
                            0x0A, 
                            0x0C, 
                            0x0E, 
                            0x10, 
                            0x12, 
                            0x14, 
                            0x16, 
                            0x18, 
                            0x1A, 
                            0x1C, 
                            0x1E, 
                            0x20, 
                            0x22, 
                            0x24, 
                            0x26, 
                            0x28, 
                            0x2A, 
                            0x2C, 
                            0x2E, 
                            0x30, 
                            0x32, 
                            0x34, 
                            0x36, 
                            0x38, 
                            0x3A, 
                            0x3C, 
                            0x3E, 
                            0x40, 
                            0x42, 
                            0x44, 
                            0x46, 
                            0x48, 
                            0x4A, 
                            0x4C, 
                            0x4E, 
                            0x50, 
                            0x52, 
                            0x54, 
                            0x56, 
                            0x58, 
                            0x5A, 
                            0x5C, 
                            0x5E, 
                            0x60, 
                            0x62, 
                            0x64
                        })
                        Method (_BCL, 0, NotSerialized)  // _BCL: Brightness Control Levels
                        {
                            Return (BCLB) /* \_SB_.PCI0.GP17.VGA_.LCD_.BCLB */
                        }

                        Method (_BCM, 1, NotSerialized)  // _BCM: Brightness Control Method
                        {
                            Divide ((Arg0 * 0xFF), 0x64, Local1, Local0)
                            AFN7 (Local0)
                            BRTL = Arg0
                        }
                    }
                }

                Device (PSP)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                }

                Device (ACP)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                    Method (_WOV, 0, NotSerialized)
                    {
                        Return (Zero)
                    }
                }

                Device (AZAL)
                {
                    Name (_ADR, 0x06)  // _ADR: Address
                }

                Device (HDAU)
                {
                    Name (_ADR, One)  // _ADR: Address
                }

                Scope (\_SB.PCI0.GP17)
                {
                    Name (UPCN, Package (0x04)
                    {
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                    Name (UPC3, Package (0x04)
                    {
                        0xFF, 
                        0x03, 
                        Zero, 
                        Zero
                    })
                    Name (UPC2, Package (0x04)
                    {
                        0xFF, 
                        Zero, 
                        Zero, 
                        Zero
                    })
                    Name (UPCP, Package (0x04)
                    {
                        0xFF, 
                        0xFF, 
                        Zero, 
                        Zero
                    })
                    Name (UPC4, Package (0x04)
                    {
                        0xFF, 
                        0x0A, 
                        Zero, 
                        Zero
                    })
                    Name (UPCC, Package (0x04)
                    {
                        Zero, 
                        0xFF, 
                        Zero, 
                        Zero
                    })
                    Name (PLDN, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                        }
                    })
                    Name (PLDR, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                        }
                    })
                    Name (PLD1, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                            /* 0008 */  0x69, 0x0C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00   // i.......
                        }
                    })
                    Name (PLD2, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                            /* 0008 */  0x69, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00   // i.......
                        }
                    })
                    Name (PLD3, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                            /* 0008 */  0x71, 0x0C, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00   // q.......
                        }
                    })
                    Name (PLD4, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,  // ..r.....
                            /* 0008 */  0x71, 0x0C, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00   // q.......
                        }
                    })
                    Name (PLD5, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x68, 0x0C, 0x80, 0x02, 0x00, 0x00, 0x00, 0x00   // h.......
                        }
                    })
                    Name (PLD6, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x68, 0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00   // h.......
                        }
                    })
                    Name (PLD7, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x68, 0x0C, 0x80, 0x03, 0x00, 0x00, 0x00, 0x00   // h.......
                        }
                    })
                    Name (PLD8, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x68, 0x0C, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00   // h.......
                        }
                    })
                    Name (PLD9, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x68, 0x0C, 0x80, 0x04, 0x00, 0x00, 0x00, 0x00   // h.......
                        }
                    })
                    Name (PLDA, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x68, 0x0C, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00   // h.......
                        }
                    })
                    Name (PLDB, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // 1.......
                        }
                    })
                    Name (PLDC, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x20, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   //  .......
                        }
                    })
                    Name (PLDD, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // 1.......
                        }
                    })
                    Name (PLDE, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x31, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // 1.......
                        }
                    })
                    Name (PLDF, Package (0x01)
                    {
                        Buffer (0x10)
                        {
                            /* 0000 */  0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x30, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // 0.......
                        }
                    })
                    Name (PLDG, Package (0x01)
                    {
                        Buffer (0x14)
                        {
                            /* 0000 */  0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                            /* 0008 */  0x24, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // $.......
                            /* 0010 */  0xC8, 0x00, 0xA0, 0x00                           // ....
                        }
                    })
                }

                Device (XHC0)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x0D, 
                        0x04
                    })
                    OperationRegion (USBR, PCI_Config, 0x74, 0x02)
                    Field (USBR, ByteAcc, NoLock, Preserve)
                    {
                        PMST,   2, 
                        Offset (0x01), 
                        PMEE,   1, 
                            ,   6, 
                        PMES,   1
                    }

                    Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
                    {
                        PMEE = Arg0
                    }

                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC4) /* \_SB_.PCI0.GP17.UPC4 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD2) /* \_SB_.PCI0.GP17.PLD2 */
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC2) /* \_SB_.PCI0.GP17.UPC2 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.PLD1 */
                            }
                        }

                        Device (PRT3)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPCP) /* \_SB_.PCI0.GP17.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD5) /* \_SB_.PCI0.GP17.PLD5 */
                            }
                        }

                        Device (PRT4)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPCP) /* \_SB_.PCI0.GP17.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLDA) /* \_SB_.PCI0.GP17.PLDA */
                            }
                        }

                        Device (PRT5)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC4) /* \_SB_.PCI0.GP17.UPC4 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD2) /* \_SB_.PCI0.GP17.PLD2 */
                            }
                        }

                        Device (PRT6)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC3) /* \_SB_.PCI0.GP17.UPC3 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD1) /* \_SB_.PCI0.GP17.PLD1 */
                            }
                        }
                    }
                }

                Device (XHC1)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                    Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                    {
                        Return (GPRW (0x19, 0x04))
                    }

                    Device (RHUB)
                    {
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (PRT1)
                        {
                            Name (_ADR, One)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC3) /* \_SB_.PCI0.GP17.UPC3 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD3) /* \_SB_.PCI0.GP17.PLD3 */
                            }
                        }

                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC3) /* \_SB_.PCI0.GP17.UPC3 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD4) /* \_SB_.PCI0.GP17.PLD4 */
                            }
                        }

                        Device (PRT3)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPCC) /* \_SB_.PCI0.GP17.UPCC */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLDC) /* \_SB_.PCI0.GP17.PLDC */
                            }

                            Device (UCAM)
                            {
                                Name (_ADR, 0x03)  // _ADR: Address
                                Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                                {
                                    Return (UPCC) /* \_SB_.PCI0.GP17.UPCC */
                                }

                                Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                                {
                                    Return (PLDC) /* \_SB_.PCI0.GP17.PLDC */
                                }
                            }
                        }

                        Device (PRT4)
                        {
                            Name (_ADR, 0x04)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPCP) /* \_SB_.PCI0.GP17.UPCP */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD9) /* \_SB_.PCI0.GP17.PLD9 */
                            }
                        }

                        Device (PRT5)
                        {
                            Name (_ADR, 0x05)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC3) /* \_SB_.PCI0.GP17.UPC3 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD3) /* \_SB_.PCI0.GP17.PLD3 */
                            }
                        }

                        Device (PRT6)
                        {
                            Name (_ADR, 0x06)  // _ADR: Address
                            Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                            {
                                Return (UPC3) /* \_SB_.PCI0.GP17.UPC3 */
                            }

                            Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                            {
                                Return (PLD4) /* \_SB_.PCI0.GP17.PLD4 */
                            }
                        }
                    }
                }

                Device (MP2C)
                {
                    Name (_ADR, 0x07)  // _ADR: Address
                }
            }

            Device (GP18)
            {
                Name (_ADR, 0x00080002)  // _ADR: Address
                Name (PR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKC, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKD, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKA, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKB, , 
                        Zero
                    }
                })
                Name (AR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x12
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x13
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x10
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x11
                    }
                })
                Name (NR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x22
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x23
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x20
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x21
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR18) /* \_SB_.PCI0.GP18.NR18 */
                        }
                        Else
                        {
                            Return (AR18) /* \_SB_.PCI0.GP18.AR18 */
                        }
                    }
                    Else
                    {
                        Return (PR18) /* \_SB_.PCI0.GP18.PR18 */
                    }
                }

                Device (SATA)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                }

                Device (SAT1)
                {
                    Name (_ADR, One)  // _ADR: Address
                }
            }

            Device (GP19)
            {
                Name (_ADR, 0x00080003)  // _ADR: Address
                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    If ((WKPM == One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }

                Name (PR19, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, , 
                        Zero
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, , 
                        Zero
                    }
                })
                Name (AR19, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x17
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x14
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x15
                    }
                })
                Name (NR19, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x1E
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x1F
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1C
                    }, 

                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1D
                    }
                })
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (PICM)
                    {
                        If (NAPC)
                        {
                            Return (NR19) /* \_SB_.PCI0.GP19.NR19 */
                        }
                        Else
                        {
                            Return (AR19) /* \_SB_.PCI0.GP19.AR19 */
                        }
                    }
                    Else
                    {
                        Return (PR19) /* \_SB_.PCI0.GP19.PR19 */
                    }
                }
            }

            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103") /* HPET System Timer */)  // _HID: Hardware ID
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((HPEN == One))
                    {
                        If ((OSTB >= 0x40))
                        {
                            Return (0x0F)
                        }

                        HPEN = Zero
                        Return (One)
                    }

                    Return (One)
                }

                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (BUF0, Buffer (0x14)
                    {
                        /* 0000 */  0x22, 0x01, 0x00, 0x22, 0x00, 0x01, 0x86, 0x09,  // ".."....
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0xD0, 0xFE, 0x00, 0x04,  // ........
                        /* 0010 */  0x00, 0x00, 0x79, 0x00                           // ..y.
                    })
                    CreateDWordField (BUF0, 0x0A, HPEB)
                    Local0 = 0xFED00000
                    HPEB = (Local0 & 0xFFFFFC00)
                    Return (BUF0) /* \_SB_.PCI0.HPET._CRS.BUF0 */
                }
            }

            Device (SMBS)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
            }

            Device (LPC0)
            {
                Name (_ADR, 0x00140003)  // _ADR: Address
                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                    Name (_CRS, Buffer (0x1D)  // _CRS: Current Resource Settings
                    {
                        /* 0000 */  0x47, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10,  // G.......
                        /* 0008 */  0x47, 0x01, 0x81, 0x00, 0x81, 0x00, 0x01, 0x0F,  // G.......
                        /* 0010 */  0x47, 0x01, 0xC0, 0x00, 0xC0, 0x00, 0x01, 0x20,  // G...... 
                        /* 0018 */  0x2A, 0x10, 0x01, 0x79, 0x00                     // *..y.
                    })
                }

                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
                    Name (_CRS, Buffer (0x0D)  // _CRS: Current Resource Settings
                    {
                        /* 0000 */  0x47, 0x01, 0xF0, 0x00, 0xF0, 0x00, 0x01, 0x0F,  // G.......
                        /* 0008 */  0x22, 0x00, 0x20, 0x79, 0x00                     // ". y.
                    })
                }

                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000") /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
                    Name (_CRS, Buffer (0x15)  // _CRS: Current Resource Settings
                    {
                        /* 0000 */  0x47, 0x01, 0x20, 0x00, 0x20, 0x00, 0x01, 0x02,  // G. . ...
                        /* 0008 */  0x47, 0x01, 0xA0, 0x00, 0xA0, 0x00, 0x01, 0x02,  // G.......
                        /* 0010 */  0x22, 0x04, 0x00, 0x79, 0x00                     // "..y.
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00") /* AT Real-Time Clock */)  // _HID: Hardware ID
                    Name (BUF0, Buffer (0x0A)
                    {
                        /* 0000 */  0x47, 0x01, 0x70, 0x00, 0x70, 0x00, 0x01, 0x02,  // G.p.p...
                        /* 0008 */  0x79, 0x00                                       // y.
                    })
                    Name (BUF1, Buffer (0x0D)
                    {
                        /* 0000 */  0x47, 0x01, 0x70, 0x00, 0x70, 0x00, 0x01, 0x02,  // G.p.p...
                        /* 0008 */  0x22, 0x00, 0x01, 0x79, 0x00                     // "..y.
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If ((HPEN == One))
                        {
                            Return (BUF0) /* \_SB_.PCI0.LPC0.RTC_.BUF0 */
                        }

                        Return (BUF1) /* \_SB_.PCI0.LPC0.RTC_.BUF1 */
                    }
                }

                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800") /* Microsoft Sound System Compatible Device */)  // _HID: Hardware ID
                    Name (_CRS, Buffer (0x0A)  // _CRS: Current Resource Settings
                    {
                        /* 0000 */  0x47, 0x01, 0x61, 0x00, 0x61, 0x00, 0x01, 0x01,  // G.a.a...
                        /* 0008 */  0x79, 0x00                                       // y.
                    })
                }

                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100") /* PC-class System Timer */)  // _HID: Hardware ID
                    Name (BUF0, Buffer (0x0A)
                    {
                        /* 0000 */  0x47, 0x01, 0x40, 0x00, 0x40, 0x00, 0x01, 0x04,  // G.@.@...
                        /* 0008 */  0x79, 0x00                                       // y.
                    })
                    Name (BUF1, Buffer (0x0D)
                    {
                        /* 0000 */  0x47, 0x01, 0x40, 0x00, 0x40, 0x00, 0x01, 0x04,  // G.@.@...
                        /* 0008 */  0x22, 0x01, 0x00, 0x79, 0x00                     // "..y.
                    })
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If ((HPEN == One))
                        {
                            Return (BUF0) /* \_SB_.PCI0.LPC0.TMR_.BUF0 */
                        }

                        Return (BUF1) /* \_SB_.PCI0.LPC0.TMR_.BUF1 */
                    }
                }

                Device (KBC0)
                {
                    Name (_HID, EisaId ("FUJ7401"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0303") /* IBM Enhanced Keyboard (101/102-key, PS/2 Mouse) */)  // _CID: Compatible ID
                    Name (_CRS, Buffer (0x15)  // _CRS: Current Resource Settings
                    {
                        /* 0000 */  0x47, 0x01, 0x60, 0x00, 0x60, 0x00, 0x01, 0x01,  // G.`.`...
                        /* 0008 */  0x47, 0x01, 0x64, 0x00, 0x64, 0x00, 0x01, 0x01,  // G.d.d...
                        /* 0010 */  0x22, 0x02, 0x00, 0x79, 0x00                     // "..y.
                    })
                }

                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Name (_CRS, Buffer (0x7A)  // _CRS: Current Resource Settings
                    {
                        /* 0000 */  0x47, 0x01, 0x10, 0x00, 0x10, 0x00, 0x01, 0x10,  // G.......
                        /* 0008 */  0x47, 0x01, 0x72, 0x00, 0x72, 0x00, 0x01, 0x02,  // G.r.r...
                        /* 0010 */  0x47, 0x01, 0x80, 0x00, 0x80, 0x00, 0x01, 0x01,  // G.......
                        /* 0018 */  0x47, 0x01, 0xB0, 0x00, 0xB0, 0x00, 0x01, 0x02,  // G.......
                        /* 0020 */  0x47, 0x01, 0x92, 0x00, 0x92, 0x00, 0x01, 0x01,  // G.......
                        /* 0028 */  0x47, 0x01, 0x5C, 0x02, 0x5C, 0x02, 0x01, 0x01,  // G.\.\...
                        /* 0030 */  0x47, 0x01, 0x00, 0x04, 0x00, 0x04, 0x01, 0xD0,  // G.......
                        /* 0038 */  0x47, 0x01, 0xD0, 0x04, 0xD0, 0x04, 0x01, 0x02,  // G.......
                        /* 0040 */  0x47, 0x01, 0xD6, 0x04, 0xD6, 0x04, 0x01, 0x01,  // G.......
                        /* 0048 */  0x47, 0x01, 0x00, 0x0C, 0x00, 0x0C, 0x01, 0x02,  // G.......
                        /* 0050 */  0x47, 0x01, 0x14, 0x0C, 0x14, 0x0C, 0x01, 0x01,  // G.......
                        /* 0058 */  0x47, 0x01, 0x50, 0x0C, 0x50, 0x0C, 0x01, 0x03,  // G.P.P...
                        /* 0060 */  0x47, 0x01, 0x6C, 0x0C, 0x6C, 0x0C, 0x01, 0x01,  // G.l.l...
                        /* 0068 */  0x47, 0x01, 0x6F, 0x0C, 0x6F, 0x0C, 0x01, 0x01,  // G.o.o...
                        /* 0070 */  0x47, 0x01, 0xD0, 0x0C, 0xD0, 0x0C, 0x01, 0x0C,  // G.......
                        /* 0078 */  0x79, 0x00                                       // y.
                    })
                }

                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01") /* System Board */)  // _HID: Hardware ID
                    Name (MSRC, Buffer (0x0E)
                    {
                        /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x00, 0xF0, 0xFF,  // ........
                        /* 0008 */  0x00, 0x00, 0x10, 0x00, 0x79, 0x00               // ....y.
                    })
                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        CreateDWordField (MSRC, 0x08, PSIZ)
                        CreateDWordField (MSRC, 0x04, PBAS)
                        PSIZ = ROMS /* \ROMS */
                        Local0 = (ROMS - One)
                        PBAS = (Ones - Local0)
                        Return (MSRC) /* \_SB_.PCI0.LPC0.MEM_.MSRC */
                    }
                }

                Mutex (PSMX, 0x00)
            }
        }

        OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
        Field (PIRQ, ByteAcc, NoLock, Preserve)
        {
            PIDX,   8, 
            PDAT,   8
        }

        IndexField (PIDX, PDAT, ByteAcc, NoLock, Preserve)
        {
            PIRA,   8, 
            PIRB,   8, 
            PIRC,   8, 
            PIRD,   8, 
            PIRE,   8, 
            PIRF,   8, 
            PIRG,   8, 
            PIRH,   8, 
            Offset (0x0C), 
            SIRA,   8, 
            SIRB,   8, 
            SIRC,   8, 
            SIRD,   8, 
            PIRS,   8, 
            Offset (0x13), 
            HDAD,   8, 
            Offset (0x17), 
            SDCL,   8, 
            Offset (0x1A), 
            SDIO,   8, 
            Offset (0x30), 
            USB1,   8, 
            Offset (0x34), 
            USB3,   8, 
            Offset (0x41), 
            SATA,   8, 
            Offset (0x62), 
            GIOC,   8, 
            Offset (0x70), 
            I2C0,   8, 
            I2C1,   8, 
            I2C2,   8, 
            I2C3,   8, 
            URT0,   8, 
            URT1,   8
        }

        Method (DSPI, 0, NotSerialized)
        {
            INTA (0x1F)
            INTB (0x1F)
            INTC (0x1F)
            INTD (0x1F)
            PIRE = 0x1F
            PIRF = 0x1F
            PIRG = 0x1F
            PIRH = 0x1F
        }

        Method (INTA, 1, NotSerialized)
        {
            PIRA = Arg0
            If (PICM)
            {
                HDAD = Arg0
                SDCL = Arg0
            }
        }

        Method (INTB, 1, NotSerialized)
        {
            PIRB = Arg0
        }

        Method (INTC, 1, NotSerialized)
        {
            PIRC = Arg0
            If (PICM)
            {
                USB1 = Arg0
                USB3 = Arg0
            }
        }

        Method (INTD, 1, NotSerialized)
        {
            PIRD = Arg0
            If (PICM)
            {
                SATA = Arg0
            }
        }

        Name (PRS1, Buffer (0x06)
        {
             0x23, 0x68, 0x0C, 0x18, 0x79, 0x00               // #h..y.
        })
        Name (BUFA, Buffer (0x06)
        {
             0x23, 0x00, 0x80, 0x18, 0x79, 0x00               // #...y.
        })
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRA && (PIRA != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTA (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRA) /* \_SB_.PIRA */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRA = Local0
            }
        }

        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRB && (PIRB != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTB (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRB) /* \_SB_.PIRB */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRB = Local0
            }
        }

        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRC && (PIRC != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTC (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRC) /* \_SB_.PIRC */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRC = Local0
            }
        }

        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRD && (PIRD != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                INTD (0x1F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRD) /* \_SB_.PIRD */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRD = Local0
            }
        }

        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRE && (PIRE != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRE = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRE) /* \_SB_.PIRE */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRE = Local0
            }
        }

        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRF && (PIRF != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRF = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRF) /* \_SB_.PIRF */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRF = Local0
            }
        }

        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x07)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRG && (PIRG != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRG = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRG) /* \_SB_.PIRG */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRG = Local0
            }
        }

        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F") /* PCI Interrupt Link Device */)  // _HID: Hardware ID
            Name (_UID, 0x08)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PIRH && (PIRH != 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }

            Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
            {
                Return (PRS1) /* \_SB_.PRS1 */
            }

            Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
            {
                PIRH = 0x1F
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUFA, One, IRQX)
                IRQX = (One << PIRH) /* \_SB_.PIRH */
                Return (BUFA) /* \_SB_.BUFA */
            }

            Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Local0--
                PIRH = Local0
            }
        }

        Method (GSMI, 1, NotSerialized)
        {
            APMD = Arg0
            APMC = 0xE4
            Sleep (0x02)
        }

        Method (S80H, 1, NotSerialized)
        {
            P80H = Arg0
        }

        Method (BSMI, 1, NotSerialized)
        {
            APMD = Arg0
            APMC = 0xBE
            Sleep (One)
        }
    }

    Name (TSOS, 0x75)
    If (CondRefOf (\_OSI))
    {
        If (_OSI ("Windows 2009"))
        {
            TSOS = 0x50
        }

        If (_OSI ("Windows 2015"))
        {
            TSOS = 0x70
        }
    }

    Scope (_SB)
    {
        OperationRegion (SMIC, SystemMemory, 0xFED80000, 0x00800000)
        Field (SMIC, ByteAcc, NoLock, Preserve)
        {
            Offset (0x36A), 
            SMIB,   8
        }

        OperationRegion (SSMI, SystemIO, SMIB, 0x02)
        Field (SSMI, AnyAcc, NoLock, Preserve)
        {
            SMIW,   16
        }

        OperationRegion (ECMC, SystemIO, 0x72, 0x02)
        Field (ECMC, AnyAcc, NoLock, Preserve)
        {
            ECMI,   8, 
            ECMD,   8
        }

        IndexField (ECMI, ECMD, ByteAcc, NoLock, Preserve)
        {
            Offset (0x08), 
            FRTB,   32
        }

        OperationRegion (FRTP, SystemMemory, FRTB, 0x0100)
        Field (FRTP, AnyAcc, NoLock, Preserve)
        {
            PEBA,   32, 
                ,   5, 
            IC0E,   1, 
            IC1E,   1, 
            IC2E,   1, 
            IC3E,   1, 
            IC4E,   1, 
            IC5E,   1, 
            UT0E,   1, 
            UT1E,   1, 
                ,   1, 
                ,   1, 
            ST_E,   1, 
            UT2E,   1, 
                ,   1, 
            EMMD,   2, 
                ,   3, 
            XHCE,   1, 
                ,   1, 
                ,   1, 
            UT3E,   1, 
            ESPI,   1, 
            EMME,   1, 
            HFPE,   1, 
            Offset (0x08), 
            PCEF,   1, 
                ,   4, 
            IC0D,   1, 
            IC1D,   1, 
            IC2D,   1, 
            IC3D,   1, 
            IC4D,   1, 
            IC5D,   1, 
            UT0D,   1, 
            UT1D,   1, 
                ,   1, 
                ,   1, 
            ST_D,   1, 
            UT2D,   1, 
                ,   1, 
            EHCD,   1, 
                ,   4, 
            XHCD,   1, 
            SD_D,   1, 
                ,   1, 
            UT3D,   1, 
                ,   1, 
            EMD3,   1, 
                ,   2, 
            S03D,   1, 
            FW00,   16, 
            FW01,   32, 
            FW02,   16, 
            FW03,   32, 
            SDS0,   8, 
            SDS1,   8, 
            CZFG,   1, 
            Offset (0x20), 
            SD10,   32, 
            EH10,   32, 
            XH10,   32, 
            STBA,   32
        }

        OperationRegion (FCFG, SystemMemory, PEBA, 0x01000000)
        Field (FCFG, DWordAcc, NoLock, Preserve)
        {
            Offset (0xA3044), 
            IPDE,   32, 
            IMPE,   32, 
            Offset (0xA3078), 
                ,   2, 
            LDQ0,   1, 
            Offset (0xA30CB), 
                ,   7, 
            AUSS,   1
        }

        OperationRegion (IOMX, SystemMemory, 0xFED80D00, 0x0100)
        Field (IOMX, AnyAcc, NoLock, Preserve)
        {
            Offset (0x15), 
            IM15,   8, 
            IM16,   8, 
            Offset (0x1F), 
            IM1F,   8, 
            IM20,   8, 
            Offset (0x44), 
            IM44,   8, 
            Offset (0x46), 
            IM46,   8, 
            Offset (0x4A), 
            IM4A,   8, 
            IM4B,   8, 
            Offset (0x57), 
            IM57,   8, 
            IM58,   8, 
            Offset (0x68), 
            IM68,   8, 
            IM69,   8, 
            IM6A,   8, 
            IM6B,   8, 
            Offset (0x6D), 
            IM6D,   8
        }

        OperationRegion (FACR, SystemMemory, 0xFED81E00, 0x0100)
        Field (FACR, AnyAcc, NoLock, Preserve)
        {
            Offset (0x80), 
                ,   28, 
            RD28,   1, 
                ,   1, 
            RQTY,   1, 
            Offset (0x84), 
                ,   28, 
            SD28,   1, 
                ,   1, 
            Offset (0xA0), 
            PG1A,   1
        }

        OperationRegion (EMMX, SystemMemory, 0xFEDD5800, 0x0130)
        Field (EMMX, AnyAcc, NoLock, Preserve)
        {
            Offset (0xD0), 
                ,   17, 
            FC18,   1, 
            FC33,   1, 
                ,   7, 
            CD_T,   1, 
            WP_T,   1
        }

        OperationRegion (EMMB, SystemMemory, 0xFEDD5800, 0x0130)
        Field (EMMB, AnyAcc, NoLock, Preserve)
        {
            Offset (0xA4), 
            E0A4,   32, 
            E0A8,   32, 
            Offset (0xB0), 
            E0B0,   32, 
            Offset (0xD0), 
            E0D0,   32, 
            Offset (0x116), 
            E116,   32
        }

        Name (SVBF, Buffer (0x0100)
        {
             0x00                                             // .
        })
        CreateDWordField (SVBF, Zero, S0A4)
        CreateDWordField (SVBF, 0x04, S0A8)
        CreateDWordField (SVBF, 0x08, S0B0)
        CreateDWordField (SVBF, 0x0C, S0D0)
        CreateDWordField (SVBF, 0x10, S116)
        Method (SECR, 0, Serialized)
        {
            S116 = E116 /* \_SB_.E116 */
            RQTY = Zero
            RD28 = One
            Local0 = SD28 /* \_SB_.SD28 */
            While (Local0)
            {
                Local0 = SD28 /* \_SB_.SD28 */
            }
        }

        Method (RECR, 0, Serialized)
        {
            E116 = S116 /* \_SB_.S116 */
        }

        OperationRegion (LUIE, SystemMemory, 0xFEDC0020, 0x04)
        Field (LUIE, AnyAcc, NoLock, Preserve)
        {
            IER0,   1, 
            IER1,   1, 
            IER2,   1, 
            IER3,   1, 
            UOL0,   1, 
            UOL1,   1, 
            UOL2,   1, 
            UOL3,   1, 
            WUR0,   2, 
            WUR1,   2, 
            WUR2,   2, 
            WUR3,   2
        }

        Method (FRUI, 2, Serialized)
        {
            If ((Arg0 == Zero))
            {
                Arg1 = IUA0 /* \_SB_.IUA0 */
            }

            If ((Arg0 == One))
            {
                Arg1 = IUA1 /* \_SB_.IUA1 */
            }

            If ((Arg0 == 0x02))
            {
                Arg1 = IUA2 /* \_SB_.IUA2 */
            }

            If ((Arg0 == 0x03))
            {
                Arg1 = IUA3 /* \_SB_.IUA3 */
            }
        }

        Method (FUIO, 1, Serialized)
        {
            If ((IER0 == One))
            {
                If ((WUR0 == Arg0))
                {
                    Return (Zero)
                }
            }

            If ((IER1 == One))
            {
                If ((WUR1 == Arg0))
                {
                    Return (One)
                }
            }

            If ((IER2 == One))
            {
                If ((WUR2 == Arg0))
                {
                    Return (0x02)
                }
            }

            If ((IER3 == One))
            {
                If ((WUR3 == Arg0))
                {
                    Return (0x03)
                }
            }

            Return (0x0F)
        }

        Method (SRAD, 2, Serialized)
        {
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            ADIS = One
            ADSR = Zero
            Stall (Arg1)
            ADSR = One
            ADIS = Zero
            Stall (Arg1)
        }

        Method (DSAD, 2, Serialized)
        {
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            If ((Arg0 != ADTD))
            {
                If ((Arg1 == Zero))
                {
                    ADTD = Zero
                    ADPD = One
                    Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    While ((Local0 != 0x07))
                    {
                        Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    }
                }

                If ((Arg1 == 0x03))
                {
                    ADPD = Zero
                    Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    While ((Local0 != Zero))
                    {
                        Local0 = ADDS /* \_SB_.DSAD.ADDS */
                    }

                    ADTD = 0x03
                }
            }
        }

        Method (HSAD, 2, Serialized)
        {
            Local3 = (One << Arg0)
            Local0 = (Arg0 << One)
            Local0 += 0xFED81E40
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }

            If ((Arg1 != ADTD))
            {
                If ((Arg1 == Zero))
                {
                    PG1A = One
                    ADTD = Zero
                    ADPD = One
                    Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    While ((Local0 != 0x07))
                    {
                        Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    }

                    RQTY = One
                    RD28 = One
                    Local0 = SD28 /* \_SB_.SD28 */
                    While (!Local0)
                    {
                        Local0 = SD28 /* \_SB_.SD28 */
                    }
                }

                If ((Arg1 == 0x03))
                {
                    RQTY = Zero
                    RD28 = One
                    Local0 = SD28 /* \_SB_.SD28 */
                    While (Local0)
                    {
                        Local0 = SD28 /* \_SB_.SD28 */
                    }

                    ADPD = Zero
                    Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    While ((Local0 != Zero))
                    {
                        Local0 = ADDS /* \_SB_.HSAD.ADDS */
                    }

                    ADTD = 0x03
                    PG1A = Zero
                }
            }
        }

        OperationRegion (FPIC, SystemIO, 0x0C00, 0x02)
        Field (FPIC, AnyAcc, NoLock, Preserve)
        {
            FPII,   8, 
            FPID,   8
        }

        IndexField (FPII, FPID, ByteAcc, NoLock, Preserve)
        {
            Offset (0xF4), 
            IUA0,   8, 
            IUA1,   8, 
            Offset (0xF8), 
            IUA2,   8, 
            IUA3,   8
        }

        Device (HFP1)
        {
            Name (_HID, "AMDI0060")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (HFPE)
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x0E)
                {
                    /* 0000 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x10, 0xC1, 0xFE,  // ........
                    /* 0008 */  0x00, 0x01, 0x00, 0x00, 0x79, 0x00               // ....y.
                })
                Return (RBUF) /* \_SB_.HFP1._CRS.RBUF */
            }
        }

        Device (GPIO)
        {
            Name (_HID, "AMDI0030")  // _HID: Hardware ID
            Name (_CID, "AMDI0030")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x23)
                {
                    /* 0000 */  0x89, 0x06, 0x00, 0x0D, 0x01, 0x07, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0x15, 0xD8,  // ........
                    /* 0010 */  0xFE, 0x00, 0x04, 0x00, 0x00, 0x86, 0x09, 0x00,  // ........
                    /* 0018 */  0x01, 0x00, 0x12, 0xD8, 0xFE, 0x00, 0x01, 0x00,  // ........
                    /* 0020 */  0x00, 0x79, 0x00                                 // .y.
                })
                Return (RBUF) /* \_SB_.GPIO._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (FUR0)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CRS, Buffer (0x1E)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x23, 0x08, 0x00, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                /* 0008 */  0x00, 0x90, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // ........
                /* 0010 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x70, 0xDC, 0xFE,  // .....p..
                /* 0018 */  0x00, 0x10, 0x00, 0x00, 0x79, 0x00               // ....y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT0E == One))
                    {
                        If ((FUIO (Zero) != 0x0F))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (FUR1)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_CRS, Buffer (0x1E)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x23, 0x10, 0x00, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                /* 0008 */  0x00, 0xA0, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // ........
                /* 0010 */  0x86, 0x09, 0x00, 0x01, 0x00, 0x80, 0xDC, 0xFE,  // ........
                /* 0018 */  0x00, 0x10, 0x00, 0x00, 0x79, 0x00               // ....y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT1E == One))
                    {
                        If ((FUIO (One) != 0x0F))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (FUR2)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_CRS, Buffer (0x1E)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x23, 0x08, 0x00, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                /* 0008 */  0x00, 0xE0, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // ........
                /* 0010 */  0x86, 0x09, 0x00, 0x01, 0x00, 0xC0, 0xDC, 0xFE,  // ........
                /* 0018 */  0x00, 0x10, 0x00, 0x00, 0x79, 0x00               // ....y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT2E == One))
                    {
                        If ((FUIO (0x02) != 0x0F))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (FUR3)
        {
            Name (_HID, "AMDI0020")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_CRS, Buffer (0x1E)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x23, 0x10, 0x00, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                /* 0008 */  0x00, 0xF0, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // ........
                /* 0010 */  0x86, 0x09, 0x00, 0x01, 0x00, 0xD0, 0xDC, 0xFE,  // ........
                /* 0018 */  0x00, 0x10, 0x00, 0x00, 0x79, 0x00               // ....y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((UT3E == One))
                    {
                        If ((FUIO (0x03) != 0x0F))
                        {
                            Return (Zero)
                        }

                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (I2CA)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CRS, Buffer (0x12)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x23, 0x00, 0x04, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                /* 0008 */  0x00, 0x20, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // . ......
                /* 0010 */  0x79, 0x00                                       // y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC0E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x05, 0xC8)
            }
        }

        Device (I2CB)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_CRS, Buffer (0x12)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x23, 0x00, 0x08, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                /* 0008 */  0x00, 0x30, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // .0......
                /* 0010 */  0x79, 0x00                                       // y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC1E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x06, 0xC8)
            }
        }

        Device (I2CC)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_CRS, Buffer (0x12)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x23, 0x10, 0x00, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                /* 0008 */  0x00, 0x40, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // .@......
                /* 0010 */  0x79, 0x00                                       // y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC2E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x07, 0xC8)
            }
        }

        Device (I2CD)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_CRS, Buffer (0x12)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x23, 0x40, 0x00, 0x01, 0x86, 0x09, 0x00, 0x01,  // #@......
                /* 0008 */  0x00, 0x50, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // .P......
                /* 0010 */  0x79, 0x00                                       // y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC3E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x08, 0xC8)
            }
        }

        Device (I2CE)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_CRS, Buffer (0x12)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x23, 0x00, 0x40, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.@.....
                /* 0008 */  0x00, 0x60, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // .`......
                /* 0010 */  0x79, 0x00                                       // y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC4E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x09, 0xC8)
            }
        }

        Device (I2CF)
        {
            Name (_HID, "AMDI0010")  // _HID: Hardware ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Name (_CRS, Buffer (0x12)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x23, 0x00, 0x80, 0x01, 0x86, 0x09, 0x00, 0x01,  // #.......
                /* 0008 */  0x00, 0xB0, 0xDC, 0xFE, 0x00, 0x10, 0x00, 0x00,  // ........
                /* 0010 */  0x79, 0x00                                       // y.
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If ((IC5E == One))
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x0A, 0xC8)
            }
        }

        Method (EPIN, 0, NotSerialized)
        {
            IPDE = Zero
            IMPE = Zero
            IM15 = One
            IM16 = One
            IM20 = One
            IM44 = One
            IM46 = One
            IM68 = One
            IM69 = One
            IM6A = One
            IM6B = One
            IM4A = One
            IM58 = One
            IM4B = One
            IM57 = One
            IM6D = One
            IM1F = One
            SECR ()
        }

        Name (NCRS, Buffer (0x17)
        {
            /* 0000 */  0x89, 0x06, 0x00, 0x0D, 0x01, 0x05, 0x00, 0x00,  // ........
            /* 0008 */  0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0x50, 0xDD,  // ......P.
            /* 0010 */  0xFE, 0x00, 0x10, 0x00, 0x00, 0x79, 0x00         // .....y.
        })
        Name (DCRS, Buffer (0x5D)
        {
            /* 0000 */  0x89, 0x06, 0x00, 0x0D, 0x01, 0x05, 0x00, 0x00,  // ........
            /* 0008 */  0x00, 0x86, 0x09, 0x00, 0x01, 0x00, 0x50, 0xDD,  // ......P.
            /* 0010 */  0xFE, 0x00, 0x10, 0x00, 0x00, 0x8C, 0x20, 0x00,  // ...... .
            /* 0018 */  0x01, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x01, 0x00,  // ........
            /* 0020 */  0x00, 0xB8, 0x0B, 0x17, 0x00, 0x00, 0x19, 0x00,  // ........
            /* 0028 */  0x23, 0x00, 0x00, 0x00, 0x44, 0x00, 0x5C, 0x5F,  // #...D.\_
            /* 0030 */  0x53, 0x42, 0x2E, 0x47, 0x50, 0x49, 0x4F, 0x00,  // SB.GPIO.
            /* 0038 */  0x8C, 0x20, 0x00, 0x01, 0x01, 0x01, 0x00, 0x08,  // . ......
            /* 0040 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
            /* 0048 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x44,  // ...#...D
            /* 0050 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47, 0x50,  // .\_SB.GP
            /* 0058 */  0x49, 0x4F, 0x00, 0x79, 0x00                     // IO.y.
        })
        Name (AHID, "AMDI0040")
        Name (ACID, "AMDI0040")
        Name (SHID, 0x400DD041)
        Name (SCID, "PCICC_080501")
        Device (EMM0)
        {
            Method (_HID, 0, Serialized)  // _HID: Hardware ID
            {
                If (EMMD)
                {
                    Return (SHID) /* \_SB_.SHID */
                }
                Else
                {
                    Return (AHID) /* \_SB_.AHID */
                }
            }

            Method (_CID, 0, Serialized)  // _CID: Compatible ID
            {
                If (EMMD)
                {
                    Return (SCID) /* \_SB_.SCID */
                }
                Else
                {
                    Return (ACID) /* \_SB_.ACID */
                }
            }

            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                If (EMD3)
                {
                    Return (DCRS) /* \_SB_.DCRS */
                }
                Else
                {
                    Return (NCRS) /* \_SB_.NCRS */
                }
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TSOS >= 0x70))
                {
                    If (EMME)
                    {
                        Return (0x0F)
                    }

                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                If (EMME)
                {
                    EPIN ()
                }
            }

            Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
            {
                If ((EMD3 && EMME))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((EMD3 && EMME))
                {
                    HSAD (0x1C, Zero)
                    RECR ()
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If ((EMD3 && EMME))
                {
                    HSAD (0x1C, 0x03)
                }
            }
        }
    }

    Scope (_SB.PCI0)
    {
        Device (UAR1)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DDN, "COM1")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((FUIO (Zero) != 0x0F))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x0D)
                {
                    /* 0000 */  0x47, 0x01, 0xE8, 0x02, 0xE8, 0x02, 0x01, 0x08,  // G.......
                    /* 0008 */  0x22, 0x08, 0x00, 0x79, 0x00                     // "..y.
                })
                CreateByteField (BUF0, 0x02, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, 0x04, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, 0x09, IRQL)
                Local0 = FUIO (Zero)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                Local1 = IUA0 /* \_SB_.IUA0 */
                IRQL = (One << (Local1 & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR1._CRS.BUF0 */
            }
        }

        Device (UAR2)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_DDN, "COM2")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((FUIO (One) != 0x0F))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x0D)
                {
                    /* 0000 */  0x47, 0x01, 0xF8, 0x02, 0xF8, 0x02, 0x01, 0x08,  // G.......
                    /* 0008 */  0x22, 0x10, 0x00, 0x79, 0x00                     // "..y.
                })
                CreateByteField (BUF0, 0x02, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, 0x04, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, 0x09, IRQL)
                Local0 = FUIO (One)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                Local1 = IUA1 /* \_SB_.IUA1 */
                IRQL = (One << (Local1 & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR2._CRS.BUF0 */
            }
        }

        Device (UAR3)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_DDN, "COM3")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((FUIO (0x02) != 0x0F))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x0D)
                {
                    /* 0000 */  0x47, 0x01, 0xE8, 0x03, 0xE8, 0x03, 0x01, 0x08,  // G.......
                    /* 0008 */  0x22, 0x08, 0x00, 0x79, 0x00                     // "..y.
                })
                CreateByteField (BUF0, 0x02, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, 0x04, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, 0x09, IRQL)
                Local0 = FUIO (0x02)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                Local1 = IUA2 /* \_SB_.IUA2 */
                IRQL = (One << (Local1 & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR3._CRS.BUF0 */
            }
        }

        Device (UAR4)
        {
            Name (_HID, EisaId ("PNP0500") /* Standard PC COM Serial Port */)  // _HID: Hardware ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_DDN, "COM4")  // _DDN: DOS Device Name
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((FUIO (0x03) != 0x0F))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (BUF0, Buffer (0x0D)
                {
                    /* 0000 */  0x47, 0x01, 0xF8, 0x03, 0xF8, 0x03, 0x01, 0x08,  // G.......
                    /* 0008 */  0x22, 0x10, 0x00, 0x79, 0x00                     // "..y.
                })
                CreateByteField (BUF0, 0x02, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, 0x04, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, 0x09, IRQL)
                Local0 = FUIO (0x03)
                Switch (ToInteger (Local0))
                {
                    Case (Zero)
                    {
                        IOLO = 0xE8
                        IOHI = 0x02
                        IORL = 0xE8
                        IORH = 0x02
                    }
                    Case (One)
                    {
                        IOLO = 0xF8
                        IOHI = 0x02
                        IORL = 0xF8
                        IORH = 0x02
                    }
                    Case (0x02)
                    {
                        IOLO = 0xE8
                        IOHI = 0x03
                        IORL = 0xE8
                        IORH = 0x03
                    }
                    Case (0x03)
                    {
                        IOLO = 0xF8
                        IOHI = 0x03
                        IORL = 0xF8
                        IORH = 0x03
                    }

                }

                Local1 = IUA3 /* \_SB_.IUA3 */
                IRQL = (One << (Local1 & 0x0F))
                Return (BUF0) /* \_SB_.PCI0.UAR4._CRS.BUF0 */
            }
        }
    }

    Scope (_TZ)
    {
        ThermalZone (TZ01)
        {
            Name (CRTT, 0x78)
            Name (DTMP, 0x1B)
            Name (CHOT, 0x6E)
            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                If (\_SB.PCI0.LPC0.ECOK ())
                {
                    If ((\_SB.PCI0.LPC0.EC0.Q27F == One))
                    {
                        Return ((0x0AAC + (CHOT * 0x0A)))
                    }
                    Else
                    {
                        Local0 = \_SB.PCI0.LPC0.EC0.CTMP
                        Return ((0x0AAC + (Local0 * 0x0A)))
                    }
                }

                Return ((0x0AAC + (DTMP * 0x0A)))
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return ((0x0AAC + (CRTT * 0x0A)))
            }

            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                Return ((0x0AAC + (CHOT * 0x0A)))
            }
        }
    }

    Scope (\)
    {
        OperationRegion (COMP, SystemMemory, 0xCDF79D18, 0x0200)
        Field (COMP, AnyAcc, Lock, Preserve)
        {
            RSR0,   32, 
            BDDD,   8, 
            CPFB,   8, 
            PBTI,   8, 
            BRLV,   8, 
            CAVR,   8, 
            TJMA,   16, 
            CORE,   8, 
            TPDF,   8, 
            TPLF,   8, 
            TPDD,   8, 
            TMUD,   8, 
            CTUR,   8, 
            OSYS,   16, 
            CG19,   8, 
            CG20,   8, 
            CG21,   8, 
            CG22,   8, 
            CG23,   8, 
            CG24,   8, 
            CG25,   8, 
            CG26,   8, 
            CG27,   8, 
            CG28,   8, 
            CG29,   8, 
            CG30,   8, 
            USBW,   8, 
            SFNO,   16, 
            STDT,   16, 
            BFDT,   1024, 
            ESMS,   8, 
            ESMB,   256, 
            RSR1,   472, 
            IDFD,   1024, 
            RSR2,   1024
        }

        Mutex (CFMX, 0x00)
        Scope (_SB)
        {
            OperationRegion (SMIO, SystemIO, 0xB0, 0x02)
            Field (SMIO, ByteAcc, NoLock, Preserve)
            {
                SMIM,   8, 
                SMID,   8
            }

            Method (CSMI, 2, NotSerialized)
            {
                Acquire (CFMX, 0xFFFF)
                SMID = Arg1
                SMIM = Arg0
                Release (CFMX)
            }
        }

        Scope (_SB.PCI0.LPC0.RTC)
        {
            OperationRegion (RCM0, SystemCMOS, Zero, 0x10)
            Field (RCM0, ByteAcc, NoLock, Preserve)
            {
                AccessAs (ByteAcc, 0x00), 
                RTCS,   8, 
                Offset (0x02), 
                RTCM,   8, 
                Offset (0x04), 
                RTCH,   8, 
                Offset (0x06), 
                RTCW,   8, 
                RTCD,   8
            }
        }

        Scope (_SB.PCI0.LPC0)
        {
            Device (PS2M)
            {
                Name (TPID, Package (0x06)
                {
                    Package (0x05)
                    {
                        Zero, 
                        0xFF, 
                        0xFF, 
                        0x8A1B2E4F, 
                        Package (0x01)
                        {
                            0x130FD041
                        }
                    }, 

                    Package (0x05)
                    {
                        One, 
                        0x2C, 
                        0x20, 
                        "SYNA7DB5", 
                        "PNP0C50"
                    }, 

                    Package (0x05)
                    {
                        0x02, 
                        0xFF, 
                        0xFF, 
                        0x18058416, 
                        Package (0x01)
                        {
                            0x130FD041
                        }
                    }, 

                    Package (0x05)
                    {
                        0x03, 
                        0x15, 
                        One, 
                        "ELAN050A", 
                        "PNP0C50"
                    }, 

                    Package (0x05)
                    {
                        0xFE, 
                        0x2C, 
                        0x20, 
                        "MSFT0001", 
                        "PNP0C50"
                    }, 

                    Package (0x05)
                    {
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        "MSFT0003", 
                        0x030FD041
                    }
                })
                Method (_HID, 0, Serialized)  // _HID: Hardware ID
                {
                    If (~CondRefOf (TPDF))
                    {
                        Name (TPDF, 0xFF)
                    }

                    Switch (One)
                    {
                        Case (Zero)
                        {
                            TPDF = 0xFE
                        }
                        Case (One)
                        {
                        }
                        Default
                        {
                            TPDF = 0xFF
                        }

                    }

                    Return (TPDS (0x03, 0xFF, "MSFT0003"))
                }

                Method (_CID, 0, Serialized)  // _CID: Compatible ID
                {
                    If (~CondRefOf (TPDF))
                    {
                        Name (TPDF, 0xFF)
                    }

                    Switch (One)
                    {
                        Case (Zero)
                        {
                            TPDF = 0xFE
                        }
                        Case (One)
                        {
                        }
                        Default
                        {
                            TPDF = 0xFF
                        }

                    }

                    Return (TPDS (0x04, 0xFF, 0x030FD041))
                }

                Method (TPDS, 3, Serialized)
                {
                    Local0 = Zero
                    Local1 = Zero
                    Local3 = TPDF /* \TPDF */
                    Switch (TPDF)
                    {
                        Case (One)
                        {
                            Local3 = Zero
                        }
                        Case (0x03)
                        {
                            Local3 = 0x02
                        }
                        Case (0x04)
                        {
                            Local3 = 0x02
                        }
                        Case (0xFE)
                        {
                            Local3 = 0xFF
                        }

                    }

                    Local1 = DerefOf (DerefOf (TPID [Local0]) [Zero])
                    While (((Local1 != Arg1) && (Local1 != Local3)))
                    {
                        Local0++
                        If ((Local0 >= SizeOf (TPID)))
                        {
                            Return (Arg2)
                        }

                        Local1 = DerefOf (DerefOf (TPID [Local0]) [Zero])
                    }

                    Return (DerefOf (DerefOf (TPID [Local0]) [Arg0]))
                }

                Method (_STA, 0, Serialized)  // _STA: Status
                {
                    Switch (TPDD)
                    {
                        Case (Zero)
                        {
                            If (Ones)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Case (One)
                        {
                            Return (0x0F)
                        }
                        Case (0x02)
                        {
                            Return (Zero)
                        }
                        Default
                        {
                            Return (Zero)
                        }

                    }
                }

                Name (_CRS, Buffer (0x06)  // _CRS: Current Resource Settings
                {
                     0x23, 0x00, 0x10, 0x01, 0x79, 0x00               // #...y.
                })
            }
        }

        Scope (_SB.I2CD)
        {
            Device (TPAD)
            {
                Name (_ADR, One)  // _ADR: Address
                Name (_UID, One)  // _UID: Unique ID
                Name (HID2, Zero)
                Name (TPID, Package (0x06)
                {
                    Package (0x05)
                    {
                        Zero, 
                        0xFF, 
                        0xFF, 
                        0x8A1B2E4F, 
                        Package (0x01)
                        {
                            0x130FD041
                        }
                    }, 

                    Package (0x05)
                    {
                        One, 
                        0x2C, 
                        0x20, 
                        "SYNA7DB5", 
                        "PNP0C50"
                    }, 

                    Package (0x05)
                    {
                        0x02, 
                        0xFF, 
                        0xFF, 
                        0x18058416, 
                        Package (0x01)
                        {
                            0x130FD041
                        }
                    }, 

                    Package (0x05)
                    {
                        0x03, 
                        0x15, 
                        One, 
                        "ELAN050A", 
                        "PNP0C50"
                    }, 

                    Package (0x05)
                    {
                        0xFE, 
                        0x2C, 
                        0x20, 
                        "MSFT0001", 
                        "PNP0C50"
                    }, 

                    Package (0x05)
                    {
                        0xFF, 
                        0xFF, 
                        0xFF, 
                        "MSFT0003", 
                        0x030FD041
                    }
                })
                Name (SBFB, Buffer (0x1E)
                {
                    /* 0000 */  0x8E, 0x19, 0x00, 0x01, 0x00, 0x01, 0x02, 0x00,  // ........
                    /* 0008 */  0x00, 0x01, 0x06, 0x00, 0x80, 0x1A, 0x06, 0x00,  // ........
                    /* 0010 */  0x00, 0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x49,  // ..\_SB.I
                    /* 0018 */  0x32, 0x43, 0x44, 0x00, 0x79, 0x00               // 2CD.y.
                })
                Name (SBFI, Buffer (0x0B)
                {
                    /* 0000 */  0x89, 0x06, 0x00, 0x15, 0x01, 0x09, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x79, 0x00                                 // .y.
                })
                Name (SBFG, Buffer (0x25)
                {
                    /* 0000 */  0x8C, 0x20, 0x00, 0x01, 0x00, 0x01, 0x00, 0x02,  // . ......
                    /* 0008 */  0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00,  // ........
                    /* 0010 */  0x00, 0x19, 0x00, 0x23, 0x00, 0x00, 0x00, 0x09,  // ...#....
                    /* 0018 */  0x00, 0x5C, 0x5F, 0x53, 0x42, 0x2E, 0x47, 0x50,  // .\_SB.GP
                    /* 0020 */  0x49, 0x4F, 0x00, 0x79, 0x00                     // IO.y.
                })
                CreateWordField (SBFB, 0x10, ADR0)
                Method (_S0W, 0, NotSerialized)  // _S0W: S0 Device Wake State
                {
                    Return (Zero)
                }

                Method (_HID, 0, Serialized)  // _HID: Hardware ID
                {
                    If (~CondRefOf (TPDF))
                    {
                        Name (TPDF, 0xFE)
                    }

                    Switch (One)
                    {
                        Case (Zero)
                        {
                            TPDF = 0xFE
                        }
                        Case (One)
                        {
                        }
                        Default
                        {
                            TPDF = 0xFE
                        }

                    }

                    Return (TPDS (0x03, 0xFE, "MSFT0001"))
                }

                Method (_CID, 0, Serialized)  // _CID: Compatible ID
                {
                    If (~CondRefOf (TPDF))
                    {
                        Name (TPDF, 0xFE)
                    }

                    Switch (One)
                    {
                        Case (Zero)
                        {
                            TPDF = 0xFE
                        }
                        Case (One)
                        {
                        }
                        Default
                        {
                            TPDF = 0xFE
                        }

                    }

                    Return (TPDS (0x04, 0xFE, "PNP0C50"))
                }

                Method (TPDS, 3, NotSerialized)
                {
                    Local0 = Zero
                    Local1 = Zero
                    Local1 = DerefOf (DerefOf (TPID [Local0]) [Zero])
                    While (((Local1 != Arg1) && (Local1 != TPDF)))
                    {
                        Local0++
                        If ((Local0 >= SizeOf (TPID)))
                        {
                            Return (Arg2)
                        }

                        Local1 = DerefOf (DerefOf (TPID [Local0]) [Zero])
                    }

                    Return (DerefOf (DerefOf (TPID [Local0]) [Arg0]))
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */))
                    {
                        If ((Arg2 == Zero))
                        {
                            If ((Arg1 == One))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }
                            Else
                            {
                                Return (Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }
                        }

                        If ((Arg2 == One))
                        {
                            Return (HID2) /* \_SB_.I2CD.TPAD.HID2 */
                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }

                    If ((Arg0 == ToUUID ("ef87eb82-f951-46da-84ec-14871ac6f84b") /* Unknown UUID */))
                    {
                        If ((Arg2 == Zero))
                        {
                            If ((Arg1 == One))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }
                            Else
                            {
                                Return (Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }
                        }

                        If ((Arg2 == One))
                        {
                            Return (ConcatenateResTemplate (SBFB, SBFG))
                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }

                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }

                Method (_STA, 0, Serialized)  // _STA: Status
                {
                    Switch (TPDD)
                    {
                        Case (Zero)
                        {
                            If (Zero)
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Case (One)
                        {
                            Return (Zero)
                        }
                        Case (0x02)
                        {
                            Return (0x0F)
                        }
                        Default
                        {
                            Return (Zero)
                        }

                    }
                }

                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {
                    Local0 = Zero
                    Local1 = Zero
                    Local1 = DerefOf (DerefOf (TPID [Local0]) [Zero])
                    While (((Local1 != 0xFE) && (Local1 != TPDF)))
                    {
                        Local0++
                        If ((Local0 >= SizeOf (TPID)))
                        {
                            Break
                        }

                        Local1 = DerefOf (DerefOf (TPID [Local0]) [Zero])
                    }

                    ADR0 = DerefOf (DerefOf (TPID [Local0]) [One])
                    HID2 = DerefOf (DerefOf (TPID [Local0]) [0x02])
                    If ((OSYS < 0x07DC))
                    {
                        Return (SBFI) /* \_SB_.I2CD.TPAD.SBFI */
                    }

                    If (Ones)
                    {
                        Return (ConcatenateResTemplate (SBFB, SBFG))
                    }

                    Return (ConcatenateResTemplate (SBFB, SBFI))
                }
            }
        }

        Mutex (DPMX, 0x00)
        Method (CDPC, 2, Serialized)
        {
            Acquire (DPMX, 0xFFFF)
            Name (XX11, Buffer (0x07){})
            CreateWordField (XX11, Zero, SSZE)
            CreateByteField (XX11, 0x02, SMUF)
            CreateDWordField (XX11, 0x03, SMUD)
            SSZE = 0x07
            Local0 = Arg1
            Switch (ToInteger (Arg0))
            {
                Case (0x03)
                {
                }
                Case (0x05)
                {
                    Local0 *= 0x03E8
                }
                Case (0x06)
                {
                    Local0 *= 0x03E8
                }
                Case (0x07)
                {
                    Local0 *= 0x03E8
                }
                Case (0x08)
                {
                }
                Case (0x09)
                {
                    Local0 *= 0x03E8
                }
                Case (0x0B)
                {
                    Local0 *= 0x03E8
                }
                Case (0x0C)
                {
                    Local0 *= 0x03E8
                }
                Case (0x0E)
                {
                    Local0 *= 0x03E8
                }
                Case (0x2E)
                {
                    Local0 *= 0x03E8
                }
                Default
                {
                    Return (Zero)
                }

            }

            SMUF = Arg0
            SMUD = Local0
            \_SB.ALIB (0x0C, XX11)
            Release (DPMX)
            Return (Zero)
        }
    }

    Scope (_SB.PCI0.LPC0)
    {
        Method (ECOK, 0, NotSerialized)
        {
            If ((^EC0.OKEC == One))
            {
                Return (One)
            }
            Else
            {
                Return (Zero)
            }
        }

        Device (EC0)
        {
            Name (_HID, EisaId ("PNP0C09") /* Embedded Controller Device */)  // _HID: Hardware ID
            Name (_GPE, 0x03)  // _GPE: General Purpose Events
            Name (OKEC, One)
            Name (_CRS, Buffer (0x12)  // _CRS: Current Resource Settings
            {
                /* 0000 */  0x47, 0x01, 0x62, 0x00, 0x62, 0x00, 0x01, 0x01,  // G.b.b...
                /* 0008 */  0x47, 0x01, 0x66, 0x00, 0x66, 0x00, 0x01, 0x01,  // G.f.f...
                /* 0010 */  0x79, 0x00                                       // y.
            })
            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If ((Arg0 == 0x03))
                {
                    OKEC = Arg1
                    OSTP ()
                    ECFG (One)
                }
            }

            OperationRegion (ECMM, SystemMemory, 0xFE000800, 0x1000)
            Field (ECMM, AnyAcc, Lock, Preserve)
            {
                    ,   1, 
                LCDS,   1, 
                    ,   5, 
                Offset (0x01), 
                HTBN,   8, 
                HTBT,   8, 
                LMEN,   1, 
                    ,   3, 
                PSEE,   1, 
                RFEN,   1, 
                BTHE,   1, 
                BTCE,   1, 
                ADAP,   3, 
                Offset (0x05), 
                CORE,   2, 
                Offset (0x06), 
                Offset (0x07), 
                    ,   6, 
                PTPS,   1, 
                Offset (0x08), 
                Offset (0x0A), 
                DNLV,   8, 
                Offset (0x0D), 
                GC6F,   1, 
                    ,   2, 
                Q27F,   1, 
                Offset (0x13), 
                C1FR,   16, 
                G1FR,   16, 
                KBLE,   8, 
                KBLS,   8, 
                KBBP,   8, 
                KBCS,   8, 
                KBED,   8, 
                KBCR,   8, 
                KBCG,   8, 
                KBCB,   8, 
                Offset (0x20), 
                DCAC,   1, 
                    ,   2, 
                BBMS,   1, 
                    ,   3, 
                Offset (0x21), 
                    ,   5, 
                MAXF,   1, 
                Offset (0x23), 
                GRTX,   1, 
                N8G2,   1, 
                Offset (0x24), 
                TKST,   8, 
                GPUM,   8, 
                SLKB,   8, 
                VPST,   8, 
                CPOC,   8, 
                GPOC,   8, 
                S1TV,   8, 
                Offset (0x2D), 
                DSPM,   1, 
                Offset (0x30), 
                    ,   7, 
                WAMK,   1, 
                KBLK,   1, 
                Offset (0x32), 
                TCLT,   8, 
                P204,   8, 
                Offset (0x37), 
                CPUF,   8, 
                Offset (0x3A), 
                GPUF,   8, 
                Offset (0x3C), 
                KB1R,   8, 
                KB1G,   8, 
                KB1B,   8, 
                KB2R,   8, 
                KB2G,   8, 
                KB2B,   8, 
                KB3R,   8, 
                KB3G,   8, 
                KB3B,   8, 
                KB4R,   8, 
                KB4G,   8, 
                KB4B,   8, 
                KBBA,   8, 
                Offset (0x5D), 
                ERIB,   16, 
                Offset (0x61), 
                SMST,   8, 
                SMAD,   8, 
                SMCM,   8, 
                SMD0,   256, 
                BCNT,   8, 
                SMAA,   24, 
                SMBN,   8, 
                Offset (0x8D), 
                SUPL,   8, 
                SPPT,   8, 
                FPPT,   8, 
                BMFN,   72, 
                BATD,   56, 
                Offset (0xA1), 
                    ,   1, 
                VIDO,   1, 
                TOUP,   1, 
                Offset (0xA2), 
                ODTS,   8, 
                OSTY,   4, 
                    ,   1, 
                PBOV,   1, 
                ECRD,   1, 
                ADPT,   1, 
                PWAK,   1, 
                MWAK,   1, 
                LWAK,   1, 
                RWAK,   1, 
                WWAK,   1, 
                UWAK,   1, 
                KWAK,   1, 
                TWAK,   1, 
                CCAC,   1, 
                AOAC,   1, 
                BLAC,   1, 
                PSRC,   1, 
                BOAC,   1, 
                LCAC,   1, 
                AAAC,   1, 
                ACAC,   1, 
                S3ST,   1, 
                S3RM,   1, 
                S4ST,   1, 
                S4RM,   1, 
                S5ST,   1, 
                S5RM,   1, 
                CSST,   1, 
                CSRM,   1, 
                OSTT,   8, 
                OSST,   8, 
                THLT,   8, 
                TCNL,   8, 
                MODE,   1, 
                    ,   2, 
                INIT,   1, 
                FAN1,   1, 
                FAN2,   1, 
                FANT,   1, 
                SKNM,   1, 
                SDTM,   8, 
                FSSN,   4, 
                FANU,   4, 
                PCVL,   6, 
                SWTO,   1, 
                TTHR,   1, 
                TTHM,   1, 
                THTL,   1, 
                TFCT,   1, 
                NPST,   5, 
                CTMP,   8, 
                CTML,   8, 
                EST3,   8, 
                SKTB,   8, 
                SKTC,   8, 
                DPOT,   8, 
                EST1,   8, 
                EST2,   8, 
                    ,   1, 
                LIDF,   1, 
                PMEE,   1, 
                PWBE,   1, 
                RNGE,   1, 
                BTWE,   1, 
                Offset (0xB9), 
                BRTS,   8, 
                S35M,   1, 
                S35S,   1, 
                    ,   1, 
                MSFG,   1, 
                FFEN,   1, 
                FFST,   1, 
                Offset (0xBB), 
                WLAT,   1, 
                BTAT,   1, 
                WLEX,   1, 
                BTEX,   1, 
                KLSW,   1, 
                WLOK,   1, 
                AT3G,   1, 
                EX3G,   1, 
                PJID,   8, 
                CPUJ,   3, 
                CPNM,   3, 
                GATY,   2, 
                Offset (0xC0), 
                BTY0,   1, 
                BAM0,   1, 
                BAL0,   1, 
                    ,   1, 
                BMF0,   4, 
                BST0,   8, 
                BRC0,   16, 
                BSN0,   16, 
                BPV0,   16, 
                BDV0,   16, 
                BDC0,   16, 
                BFC0,   16, 
                GAU0,   8, 
                BAT0,   8, 
                BPC0,   16, 
                BAC0,   16, 
                BCG0,   16, 
                BFCB,   16, 
                BTPB,   16, 
                BOL0,   1, 
                BFS0,   1, 
                Offset (0xDB), 
                ORRF,   1, 
                Offset (0xDC), 
                Offset (0xDD)
            }

            OperationRegion (USEC, SystemMemory, 0xFE000200, 0x0100)
            Field (USEC, ByteAcc, Lock, Preserve)
            {
                Offset (0x50), 
                VER1,   8, 
                VER2,   8, 
                RSV1,   8, 
                RSV2,   8, 
                CCI0,   8, 
                CCI1,   8, 
                CCI2,   8, 
                CCI3,   8, 
                CTL0,   8, 
                CTL1,   8, 
                CTL2,   8, 
                CTL3,   8, 
                CTL4,   8, 
                CTL5,   8, 
                CTL6,   8, 
                CTL7,   8, 
                MGI0,   8, 
                MGI1,   8, 
                MGI2,   8, 
                MGI3,   8, 
                MGI4,   8, 
                MGI5,   8, 
                MGI6,   8, 
                MGI7,   8, 
                MGI8,   8, 
                MGI9,   8, 
                MGIA,   8, 
                MGIB,   8, 
                MGIC,   8, 
                MGID,   8, 
                MGIE,   8, 
                MGIF,   8, 
                MGO0,   8, 
                MGO1,   8, 
                MGO2,   8, 
                MGO3,   8, 
                MGO4,   8, 
                MGO5,   8, 
                MGO6,   8, 
                MGO7,   8, 
                MGO8,   8, 
                MGO9,   8, 
                MGOA,   8, 
                MGOB,   8, 
                MGOC,   8, 
                MGOD,   8, 
                MGOE,   8, 
                MGOF,   8
            }

            OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
            Field (ERAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x5F), 
                ERBD,   8, 
                SMPR,   8, 
                Offset (0x62)
            }

            Method (FANG, 1, NotSerialized)
            {
                Local0 = EIDR (Arg0)
                Return (Local0)
            }

            Method (FANW, 2, NotSerialized)
            {
                EIDW (Arg0, Arg1)
                Return (Arg1)
            }

            Method (TUVR, 1, NotSerialized)
            {
                Return (0x05)
            }

            Method (THRO, 1, NotSerialized)
            {
                ATHR (Arg0)
            }

            Method (CLCK, 1, NotSerialized)
            {
                Return (Zero)
            }

            Method (PCLK, 0, NotSerialized)
            {
                APCL ()
            }

            Method (ATHR, 1, NotSerialized)
            {
                If ((Arg0 == Zero))
                {
                    Return (0xFF)
                }
                ElseIf ((Arg0 == One))
                {
                    Return (^^^^PLTF.C000._PPC) /* External reference */
                }
                ElseIf ((Arg0 == 0x02))
                {
                    Return (TTHR) /* \_SB_.PCI0.LPC0.EC0_.TTHR */
                }
                Else
                {
                    Return (0xFF)
                }
            }

            Method (APCL, 0, NotSerialized)
            {
                Local0 = PCVL /* \_SB_.PCI0.LPC0.EC0_.PCVL */
                Local1 = NPST /* \_SB_.PCI0.LPC0.EC0_.NPST */
                Local2 = CPNM /* \_SB_.PCI0.LPC0.EC0_.CPNM */
                If ((Local0 <= Local1))
                {
                    Local3 = Local0
                }
                Else
                {
                    Local3 = Local1
                }

                ^^^^PLTF.C000._PPC = Local3
                If ((Local2 >= One))
                {
                    ^^^^PLTF.C001._PPC = Local3
                }

                If ((Local2 >= 0x02))
                {
                    ^^^^PLTF.C002._PPC = Local3
                    ^^^^PLTF.C003._PPC = Local3
                }

                If ((Local2 >= 0x03))
                {
                    ^^^^PLTF.C004._PPC = Local3
                    ^^^^PLTF.C005._PPC = Local3
                }

                If ((Local2 >= 0x04))
                {
                    ^^^^PLTF.C006._PPC = Local3
                    ^^^^PLTF.C007._PPC = Local3
                }

                If ((Local2 >= 0x05))
                {
                    ^^^^PLTF.C008._PPC = Local3
                    ^^^^PLTF.C009._PPC = Local3
                }

                If ((Local2 >= 0x06))
                {
                    ^^^^PLTF.C00A._PPC = Local3
                    ^^^^PLTF.C00B._PPC = Local3
                }

                If ((Local2 >= 0x07))
                {
                    ^^^^PLTF.C00C._PPC = Local3
                    ^^^^PLTF.C00D._PPC = Local3
                    ^^^^PLTF.C00E._PPC = Local3
                    ^^^^PLTF.C00F._PPC = Local3
                }

                Notify (^^^^PLTF.C000, 0x80) // Status Change
                If ((Local2 >= One))
                {
                    Notify (^^^^PLTF.C001, 0x80) // Status Change
                }

                If ((Local2 >= 0x02))
                {
                    Notify (^^^^PLTF.C002, 0x80) // Status Change
                    Notify (^^^^PLTF.C003, 0x80) // Status Change
                }

                If ((Local2 >= 0x03))
                {
                    Notify (^^^^PLTF.C004, 0x80) // Status Change
                    Notify (^^^^PLTF.C005, 0x80) // Status Change
                }

                If ((Local2 >= 0x04))
                {
                    Notify (^^^^PLTF.C006, 0x80) // Status Change
                    Notify (^^^^PLTF.C007, 0x80) // Status Change
                }

                If ((Local2 >= 0x05))
                {
                    Notify (^^^^PLTF.C008, 0x80) // Status Change
                    Notify (^^^^PLTF.C009, 0x80) // Status Change
                }

                If ((Local2 >= 0x06))
                {
                    Notify (^^^^PLTF.C00A, 0x80) // Status Change
                    Notify (^^^^PLTF.C00B, 0x80) // Status Change
                }

                If ((Local2 >= 0x07))
                {
                    Notify (^^^^PLTF.C00C, 0x80) // Status Change
                    Notify (^^^^PLTF.C00D, 0x80) // Status Change
                    Notify (^^^^PLTF.C00E, 0x80) // Status Change
                    Notify (^^^^PLTF.C00F, 0x80) // Status Change
                }
            }

            Method (_Q10, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====PROJECT_QUERY_10====="
            }

            Method (_Q11, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====PROJECT_QUERY_11====="
                P80H = 0x11
                ^^^WMID.FEBC [Zero] = One
                ^^^WMID.FEBC [One] = HTBN /* \_SB_.PCI0.LPC0.EC0_.HTBN */
                Notify (WMID, 0xBC) // Device-Specific
                If ((OSYS >= 0x07D6))
                {
                    Notify (^^^GP17.VGA.LCD, 0x87) // Device-Specific
                }

                ^^^WMID.FEBC [One] = BRTS /* \_SB_.PCI0.LPC0.EC0_.BRTS */
                ^^^WMID.FEBC [Zero] = 0x04
                Notify (WMID, 0xBC) // Device-Specific
            }

            Method (_Q12, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====PROJECT_QUERY_12====="
                P80H = 0x12
                ^^^WMID.FEBC [Zero] = One
                ^^^WMID.FEBC [One] = HTBN /* \_SB_.PCI0.LPC0.EC0_.HTBN */
                Notify (WMID, 0xBC) // Device-Specific
                If ((OSYS >= 0x07D6))
                {
                    Notify (^^^GP17.VGA.LCD, 0x86) // Device-Specific
                }

                ^^^WMID.FEBC [One] = BRTS /* \_SB_.PCI0.LPC0.EC0_.BRTS */
                ^^^WMID.FEBC [Zero] = 0x04
                Notify (WMID, 0xBC) // Device-Specific
            }

            Method (_Q13, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====PROJECT_QUERY_13====="
            }

            Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====PROJECT_QUERY_15====="
                P80H = 0x15
                Notify (LID0, 0x80) // Status Change
            }

            Method (_Q1D, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====PROJECT_QUERY_1D====="
            }

            Method (_Q1E, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====PROJECT_QUERY_1E====="
            }

            Method (_Q20, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====QUERY_20====="
                P80H = 0x20
                Local0 = SUPL /* \_SB_.PCI0.LPC0.EC0_.SUPL */
                Local1 = SPPT /* \_SB_.PCI0.LPC0.EC0_.SPPT */
                Local2 = FPPT /* \_SB_.PCI0.LPC0.EC0_.FPPT */
                Local3 = TCLT /* \_SB_.PCI0.LPC0.EC0_.TCLT */
                CDPC (0x05, Local0)
                CDPC (0x07, Local1)
                CDPC (0x06, Local2)
                CDPC (0x03, Local3)
            }

            Method (_Q22, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x22
                Notify (BAT1, 0x80) // Status Change
            }

            Method (_Q27, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====QUERY_27====="
                P80H = 0x27
                Notify (\_TZ.TZ01, 0x80) // Thermal Status Change
            }

            Method (_Q32, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====PROJECT_QUERY_32====="
            }

            Method (_Q33, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====PROJECT_QUERY_33====="
            }

            Method (_Q34, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====PROJECT_QUERY_34====="
            }

            Method (_Q37, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x37
                Debug = "=====PROJECT_QUERY_37====="
                Notify (ACAD, 0x80) // Status Change
                Sleep (0x03E8)
                Notify (BAT1, 0x80) // Status Change
                PWRS = ADPT /* \_SB_.PCI0.LPC0.EC0_.ADPT */
                ^^^WMID.FEBC [One] = ADPT /* \_SB_.PCI0.LPC0.EC0_.ADPT */
                ^^^WMID.FEBC [Zero] = 0x08
                Notify (WMID, 0xBC) // Device-Specific
                DCAC = Zero
            }

            Method (_Q41, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x41
                ^^^WMID.FEBC [Zero] = One
                ^^^WMID.FEBC [One] = 0x8A
                ^^^WMID.FEBC [0x02] = One
                Notify (WMID, 0xBC) // Device-Specific
            }

            Method (_Q43, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x43
                Notify (I2CD, One) // Device Check
            }

            Method (_Q44, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====PROJECT_QUERY_44====="
                If ((DNLV == One))
                {
                    Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                }
                ElseIf ((DNLV == 0x02))
                {
                    Notify (^^^GPP0.PEGP, 0xD2) // Hardware-Specific
                }
                ElseIf ((DNLV == 0x03))
                {
                    Notify (^^^GPP0.PEGP, 0xD3) // Hardware-Specific
                }
                ElseIf ((DNLV == 0x04))
                {
                    Notify (^^^GPP0.PEGP, 0xD4) // Hardware-Specific
                }
                ElseIf ((DNLV == 0x05))
                {
                    Notify (^^^GPP0.PEGP, 0xD5) // Hardware-Specific
                }
                Else
                {
                    Notify (^^^GPP0.PEGP, 0xD1) // Hardware-Specific
                }
            }

            Method (_Q45, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x45
                ^^^WMID.FEBC [Zero] = One
                ^^^WMID.FEBC [One] = HTBN /* \_SB_.PCI0.LPC0.EC0_.HTBN */
                Notify (WMID, 0xBC) // Device-Specific
            }

            Method (_Q46, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x46
                ^^^WMID.FEBC [Zero] = 0x02
                ^^^WMID.FEBC [One] = HTBN /* \_SB_.PCI0.LPC0.EC0_.HTBN */
                Notify (WMID, 0xBC) // Device-Specific
            }

            Method (_Q48, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                DSPM = One
                Sleep (0x64)
                OE0C = One
                OV0C = Zero
            }

            Method (_Q4C, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                CSMI (0x4C, Zero)
                Stall (0xFF)
                Stall (0xFF)
            }

            Method (_Q58, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====PROJECT_QUERY_58====="
                ^^^WMID.FEBC [Zero] = 0x07
                ^^^WMID.FEBC [One] = 0x04
                ^^^WMID.FEBC [0x02] = One
                Notify (WMID, 0xBC) // Device-Specific
            }

            Method (_Q5A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====PROJECT_QUERY_5A====="
                ^^^WMID.FEBC [Zero] = 0x09
                ^^^WMID.FEBC [One] = BBMS /* \_SB_.PCI0.LPC0.EC0_.BBMS */
                Notify (WMID, 0xBC) // Device-Specific
            }

            Method (_Q63, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                P80H = 0x63
                Notify (AAMC, 0x80) // Status Change
            }

            Method (_Q52, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                BTCE = Zero
                ^^^WMID.FEBC [Zero] = 0x0B
                ^^^WMID.FEBC [One] = One
                Notify (WMID, 0xBC) // Device-Specific
            }

            Method (_Q53, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                BTCE = Zero
                ^^^WMID.FEBC [Zero] = 0x0B
                ^^^WMID.FEBC [One] = Zero
                Notify (WMID, 0xBC) // Device-Specific
            }

            OperationRegion (PRT0, SystemIO, 0x80, 0x04)
            Field (PRT0, ByteAcc, Lock, Preserve)
            {
                P80H,   8
            }

            Method (_Q24, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====QUERY_24====="
                P80H = 0x24
                Sleep (0x03E8)
                Notify (BAT1, 0x80) // Status Change
            }

            Method (_Q25, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
            {
                Debug = "=====QUERY_25====="
                P80H = 0x25
                Sleep (0x03E8)
                Notify (BAT1, 0x81) // Information Change
                Sleep (0x03E8)
                Notify (BAT1, 0x80) // Status Change
            }

            Name (CTSL, Package (0x19)
            {
                0x10, 
                0x12, 
                0x13, 
                0x14, 
                0x15, 
                0x16, 
                0x17, 
                0x20, 
                0x21, 
                0x22, 
                0x24, 
                0x25, 
                0x26, 
                0x28, 
                0x90, 
                0x91, 
                0xFE, 
                0x92, 
                0x93, 
                0x94, 
                0x95, 
                0x96, 
                0x97, 
                0x98, 
                0x99
            })
            Mutex (CFMX, 0x00)
            Method (CFUN, 4, Serialized)
            {
                Name (ESRC, 0x05)
                If ((DerefOf (Arg0 [Zero]) == 0x15))
                {
                    CreateWordField (Arg1, Zero, SFUN)
                    If ((SFUN == 0x9001)){}
                    ElseIf ((SFUN == 0x9002))
                    {
                        STDT = Zero
                        BFDT = Zero
                        BFDT = Zero
                        STDT = One
                    }
                    ElseIf ((SFUN == 0x9000))
                    {
                        ESMC (Arg2)
                        If ((ESMS != 0xFF))
                        {
                            Local1 = Buffer (0x80){}
                            Local1 [Zero] = 0x80
                            Local1 [One] = ESMS /* \ESMS */
                            Local3 = ESMB /* \ESMB */
                            Local1 [0x02] = DerefOf (Local3 [Zero])
                            Local1 [0x03] = DerefOf (Local3 [One])
                            Local1 [0x04] = DerefOf (Local3 [0x02])
                            Local1 [0x05] = DerefOf (Local3 [0x03])
                            Local1 [0x06] = DerefOf (Local3 [0x04])
                            Local1 [0x07] = DerefOf (Local3 [0x05])
                            Local1 [0x08] = DerefOf (Local3 [0x06])
                            Local1 [0x09] = DerefOf (Local3 [0x07])
                            Local1 [0x0A] = DerefOf (Local3 [0x08])
                            Local1 [0x0B] = DerefOf (Local3 [0x09])
                            Local1 [0x0C] = DerefOf (Local3 [0x0A])
                            Local1 [0x0D] = DerefOf (Local3 [0x0B])
                            Local1 [0x0E] = DerefOf (Local3 [0x0C])
                            Local1 [0x0F] = DerefOf (Local3 [0x0D])
                            Local1 [0x10] = DerefOf (Local3 [0x0E])
                            Local1 [0x11] = DerefOf (Local3 [0x0F])
                            Local1 [0x12] = DerefOf (Local3 [0x10])
                            Local1 [0x13] = DerefOf (Local3 [0x11])
                            Local1 [0x14] = DerefOf (Local3 [0x12])
                            Local1 [0x15] = DerefOf (Local3 [0x13])
                            Local1 [0x16] = DerefOf (Local3 [0x14])
                            Local1 [0x17] = DerefOf (Local3 [0x15])
                            Local1 [0x18] = DerefOf (Local3 [0x16])
                            Local1 [0x19] = DerefOf (Local3 [0x17])
                            Local1 [0x1A] = DerefOf (Local3 [0x18])
                            Local1 [0x1B] = DerefOf (Local3 [0x19])
                            Local1 [0x1C] = DerefOf (Local3 [0x1A])
                            Local1 [0x1D] = DerefOf (Local3 [0x1B])
                            Local1 [0x1E] = DerefOf (Local3 [0x1C])
                            Local1 [0x1F] = DerefOf (Local3 [0x1D])
                            Local1 [0x20] = DerefOf (Local3 [0x1E])
                            Local1 [0x21] = DerefOf (Local3 [0x1F])
                            BFDT = Local1
                            STDT = One
                        }
                        Else
                        {
                            STDT = 0x8000
                        }
                    }
                    Else
                    {
                        SFNO = Arg1
                        BFDT = Arg2
                        CSMI (0xCE, Arg0)
                    }
                }
                ElseIf ((Match (CTSL, MEQ, DerefOf (Arg0 [Zero]), 
                    MTR, Zero, Zero) != Ones))
                {
                    SFNO = Arg1
                    BFDT = Arg2
                    CSMI (0xCE, Arg0)
                }
                Else
                {
                    STDT = 0x8000
                }
            }

            Name (OCSL, Package (0x03)
            {
                0x80, 
                0x81, 
                0x82
            })
            Method (PFUN, 4, Serialized)
            {
                SFNO = Arg1
                BFDT = Arg2
                CSMI (0xCF, Arg0)
                STDT = Zero
            }

            Method (CMFC, 4, Serialized)
            {
                Name (RTVL, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Debug = "=== In CMFC method ==="
                If ((ObjectType (Arg0) == One))
                {
                    RTVL [Zero] = 0x8000
                }
                ElseIf ((DerefOf (Arg0 [Zero]) < 0xFF))
                {
                    Local1 = Buffer (0x82){}
                    CreateWordField (Local1, Zero, RTST)
                    CreateField (Local1, 0x10, 0x0400, RTDT)
                    If (((ToInteger (Arg0) <= 0x8F) && (ToInteger (Arg0
                        ) >= 0x80)))
                    {
                        PFUN (Arg0, Arg1, Arg2, Arg3)
                    }
                    Else
                    {
                        CFUN (Arg0, Arg1, Arg2, Arg3)
                    }

                    RTST = STDT /* \STDT */
                    RTDT = BFDT /* \BFDT */
                    Return (Local1)
                }
                Else
                {
                    RTVL [Zero] = 0x8000
                }

                Return (RTVL) /* \_SB_.PCI0.LPC0.EC0_.CMFC.RTVL */
            }

            Mutex (FAMX, 0x00)
            Method (EIDR, 1, Serialized)
            {
                Acquire (FAMX, 0xFFFF)
                ERIB = Arg0
                Local0 = ERRD (0x5F)
                Release (FAMX)
                Return (Local0)
            }

            Method (EIDW, 2, Serialized)
            {
                Acquire (FAMX, 0xFFFF)
                ERIB = Arg0
                ERWT (0x5F, Arg1)
                Release (FAMX)
            }

            OperationRegion (ECCD, SystemMemory, 0xFE000800, 0x1000)
            Field (ECCD, AnyAcc, Lock, Preserve)
            {
                Offset (0x580), 
                Offset (0x582), 
                ECTB,   1, 
                ECTE,   1, 
                Offset (0x583), 
                ERN1,   8, 
                ERN2,   8, 
                ERN3,   8, 
                ERN4,   8, 
                ERN5,   8, 
                ERN6,   8, 
                ERN7,   8, 
                ERN8,   8, 
                ECMD,   8, 
                EDT1,   8, 
                EDT2,   8, 
                EDT3,   8, 
                EDT4,   8, 
                EDT5,   8, 
                    ,   1
            }

            Method (ERWT, 2, Serialized)
            {
                Local0 = Buffer (0x08){}
                Local0 [Zero] = 0xB1
                Local0 [One] = Arg0
                Local0 [0x02] = Arg1
                ERCD (Local0)
            }

            Method (ERRD, 1, Serialized)
            {
                Local0 = Buffer (0x08){}
                Local0 [Zero] = 0xB0
                Local0 [One] = Arg0
                Return (ERCD (Local0))
            }

            Mutex (CSMX, 0x00)
            Method (ERCD, 1, Serialized)
            {
                Acquire (CSMX, 0xFFFF)
                Name (ESRC, 0x64)
                ECTB = One
                ECMD = DerefOf (Arg0 [Zero])
                EDT1 = DerefOf (Arg0 [One])
                EDT2 = DerefOf (Arg0 [0x02])
                ECTE = One
                While (((ESRC != Zero) && (ECTE != Zero)))
                {
                    Sleep (0x0A)
                    ESRC -= One
                }

                Local0 = ERN1 /* \_SB_.PCI0.LPC0.EC0_.ERN1 */
                ECTB = Zero
                Release (CSMX)
                Return (Local0)
            }

            Method (SBAT, 2, NotSerialized)
            {
                Local0 = Buffer (0x08){}
                Local0 [Zero] = Arg0
                Local0 [One] = 0x16
                Local0 [0x02] = Arg1
                Local0 [0x03] = Zero
                Local0 [0x04] = Zero
                ESMC (Local0)
            }

            Method (SBA2, 2, NotSerialized)
            {
                Local0 = Buffer (0x08){}
                Local0 [Zero] = Arg0
                Local0 [One] = 0x36
                Local0 [0x02] = Arg1
                Local0 [0x03] = Zero
                Local0 [0x04] = Zero
                ESMC (Local0)
            }

            Mutex (ESCX, 0x00)
            Method (ESMC, 1, NotSerialized)
            {
                Acquire (ESCX, 0xFFFF)
                Name (ESRC, 0x05)
                SMD0 = Zero
                SMAD = DerefOf (Arg0 [One])
                SMCM = DerefOf (Arg0 [0x02])
                SMBN = DerefOf (Arg0 [0x03])
                Local4 = DerefOf (Arg0 [0x04])
                Local5 = Zero
                BCNT = Local4
                If ((Local4 != Zero))
                {
                    Local1 = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    While (~(Local4 == Local5))
                    {
                        Local1 [Local5] = DerefOf (Arg0 [(0x05 + Local5)]
                            )
                        Local5 += One
                    }

                    SMD0 = Local1
                }

                SMPR = DerefOf (Arg0 [Zero])
                While ((~(ESRC == Zero) && ~((SMST & 0x80
                    ) == 0x80)))
                {
                    Sleep (0x14)
                    ESRC -= One
                }

                If ((SMST == 0x80))
                {
                    ESMB = SMD0 /* \_SB_.PCI0.LPC0.EC0_.SMD0 */
                    ESMS = BCNT /* \_SB_.PCI0.LPC0.EC0_.BCNT */
                }
                Else
                {
                    Debug = "====== Sent EC SMBus command time out. ======"
                    ESMS = 0xFF
                }

                Release (ESCX)
            }
        }

        Scope (EC0)
        {
            Method (GBMN, 0, NotSerialized)
            {
                Name (BFWB, Buffer (0x07){})
                If (ECOK ())
                {
                    BFWB = BATD /* \_SB_.PCI0.LPC0.EC0_.BATD */
                }

                Return (BFWB) /* \_SB_.PCI0.LPC0.EC0_.GBMN.BFWB */
            }

            Method (GUBS, 0, NotSerialized)
            {
                Name (BRSN, "      ")
                If (ECOK ())
                {
                    BRSN = ToDecimalString (BSN0)
                }
                Else
                {
                    BRSN = "41167"
                }

                Return (BRSN) /* \_SB_.PCI0.LPC0.EC0_.GUBS.BRSN */
            }

            Method (GUBT, 0, NotSerialized)
            {
                Local0 = "Li-Ion"
                Return (Local0)
            }

            Method (GUBI, 0, Serialized)
            {
                Local1 = BMF0 /* \_SB_.PCI0.LPC0.EC0_.BMF0 */
                Switch (Local1)
                {
                    Case (One)
                    {
                        Local0 = "SANYO "
                    }
                    Case (0x02)
                    {
                        Local0 = "SONY "
                    }
                    Case (0x03)
                    {
                        Local0 = "SDI "
                    }
                    Case (0x04)
                    {
                        Local0 = "PANASONIC "
                    }
                    Case (0x05)
                    {
                        Local0 = "Samsung "
                    }
                    Case (0x06)
                    {
                        Local0 = "SMP "
                    }
                    Case (0x07)
                    {
                        Local0 = "Dynapack "
                    }
                    Case (0x08)
                    {
                        Local0 = "LGC "
                    }
                    Case (0x09)
                    {
                        Local0 = "WELLTECH ENERGY "
                    }
                    Case (0x0A)
                    {
                        Local0 = "Celxpert "
                    }
                    Case (0x0B)
                    {
                        Local0 = "Murata "
                    }
                    Case (0x0C)
                    {
                        Local0 = "COSMX "
                    }
                    Default
                    {
                        Local0 = "COMPAL "
                    }

                }

                Return (Local0)
            }

            Method (BMN2, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (UBS2, 0, NotSerialized)
            {
                Return (Zero)
            }

            Method (UBT2, 0, NotSerialized)
            {
                Local0 = "Li-Ion"
                Return (Local0)
            }

            Method (UBI2, 0, NotSerialized)
            {
                Return (Zero)
            }
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A") /* Control Method Battery */)  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB, 
            })
            Name (BMDL, Zero)
            Name (BASC, One)
            Name (BFFW, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (ECOK ())
                {
                    If (^^EC0.BOL0)
                    {
                        Return (0x1F)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
                Else
                {
                    Return (0x1F)
                }
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Return (BIFX (Zero))
            }

            Method (_BIX, 0, NotSerialized)  // _BIX: Battery Information Extended
            {
                Return (BIFX (One))
            }

            Method (BIFX, 1, NotSerialized)
            {
                Name (STAX, Package (0x14)
                {
                    Zero, 
                    One, 
                    0x1770, 
                    0x1770, 
                    One, 
                    0x2A30, 
                    0x0258, 
                    0xB4, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x0108, 
                    0x0EC4, 
                    "PABAS0241231", 
                    "41167", 
                    "Li-Ion", 
                    "COMPAL "
                })
                Name (STAF, Package (0x0D)
                {
                    One, 
                    0x1770, 
                    0x1770, 
                    One, 
                    0x2A30, 
                    0x0258, 
                    0xB4, 
                    0x0108, 
                    0x0EC4, 
                    "PABAS0241231", 
                    "41167", 
                    "Li-Ion", 
                    "COMPAL "
                })
                STAX [0x10] = ^^EC0.GBMN ()
                STAX [0x11] = ^^EC0.GUBS ()
                STAX [0x13] = ^^EC0.GUBI ()
                If (ECOK ())
                {
                    BFFW = ^^EC0.ORRF /* \_SB_.PCI0.LPC0.EC0_.ORRF */
                    If ((^^EC0.BAM0 == Zero))
                    {
                        BASC = 0x0A
                    }

                    STAX [One] = ^^EC0.BAM0 /* \_SB_.PCI0.LPC0.EC0_.BAM0 */
                    Local0 = ^^EC0.BDC0 /* \_SB_.PCI0.LPC0.EC0_.BDC0 */
                    BMDL = Local0
                    STAX [0x02] = (^^EC0.BDC0 * BASC)
                    STAX [0x05] = ^^EC0.BDV0 /* \_SB_.PCI0.LPC0.EC0_.BDV0 */
                    If ((BFFW == One))
                    {
                        Local2 = ^^EC0.BFCB /* \_SB_.PCI0.LPC0.EC0_.BFCB */
                    }
                    Else
                    {
                        Local2 = ^^EC0.BFC0 /* \_SB_.PCI0.LPC0.EC0_.BFC0 */
                    }

                    Local2 = (Local2 * BASC)
                    STAX [0x03] = Local2
                    Divide (Local2, 0x64, Local0, Local1)
                    Local1 *= 0x0A
                    STAX [0x06] = Local1
                    Divide (Local2, 0x64, Local0, Local1)
                    Local1 *= 0x03
                    STAX [0x07] = Local1
                    STAF [Zero] = DerefOf (STAX [One])
                    STAF [One] = DerefOf (STAX [0x02])
                    STAF [0x02] = DerefOf (STAX [0x03])
                    STAF [0x03] = DerefOf (STAX [0x04])
                    STAF [0x04] = DerefOf (STAX [0x05])
                    STAF [0x05] = DerefOf (STAX [0x06])
                    STAF [0x06] = DerefOf (STAX [0x07])
                    STAF [0x07] = DerefOf (STAX [0x0E])
                    STAF [0x08] = DerefOf (STAX [0x0F])
                    STAF [0x09] = DerefOf (STAX [0x10])
                    STAF [0x0A] = DerefOf (STAX [0x11])
                    STAF [0x0B] = DerefOf (STAX [0x12])
                    STAF [0x0C] = DerefOf (STAX [0x13])
                    If ((Arg0 == One))
                    {
                        Return (STAX) /* \_SB_.PCI0.LPC0.BAT1.BIFX.STAX */
                    }
                    Else
                    {
                        Return (STAF) /* \_SB_.PCI0.LPC0.BAT1.BIFX.STAF */
                    }
                }
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Name (PBST, Package (0x04)
                {
                    Zero, 
                    Ones, 
                    Ones, 
                    0x1770
                })
                If (ECOK ())
                {
                    PBST [Zero] = ^^EC0.BST0 /* \_SB_.PCI0.LPC0.EC0_.BST0 */
                    If ((^^EC0.BAC0 >> 0x0F))
                    {
                        Local4 = ((~^^EC0.BAC0 & 0xFFFF) + One)
                    }
                    Else
                    {
                        Local4 = ^^EC0.BAC0 /* \_SB_.PCI0.LPC0.EC0_.BAC0 */
                    }

                    If ((^^EC0.BAM0 == Zero))
                    {
                        Local4 = ((Local4 * ^^EC0.BPV0) / 0x03E8)
                    }

                    PBST [One] = Local4
                    PBST [0x02] = (^^EC0.BRC0 * BASC)
                    PBST [0x03] = ^^EC0.BPV0 /* \_SB_.PCI0.LPC0.EC0_.BPV0 */
                    If ((^^EC0.BDC0 != BMDL))
                    {
                        Notify (BAT1, 0x81) // Information Change
                    }
                }

                Return (PBST) /* \_SB_.PCI0.LPC0.BAT1._BST.PBST */
            }

            Method (_BTP, 1, NotSerialized)  // _BTP: Battery Trip Point
            {
                Local0 = (Arg0 / BASC)
                ^^EC0.BTPB = Local0
            }
        }

        Device (ACAD)
        {
            Name (_HID, "ACPI0003" /* Power Source Device */)  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                _SB, 
            })
            Name (XX00, Buffer (0x03){})
            Name (ACDC, 0xFF)
            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Local0 = ^^EC0.ADPT /* \_SB_.PCI0.LPC0.EC0_.ADPT */
                If ((Local0 != ACDC))
                {
                    CreateWordField (XX00, Zero, SSZE)
                    CreateByteField (XX00, 0x02, ACST)
                    SSZE = 0x03
                    If (Local0)
                    {
                        P80H = 0xAC
                        AFN4 (One)
                        ACST = Zero
                    }
                    Else
                    {
                        P80H = 0xDC
                        AFN4 (0x02)
                        ACST = One
                    }

                    ALIB (One, XX00)
                    ACDC = Local0
                }

                Return (Local0)
            }
        }

        Method (OSTP, 0, NotSerialized)
        {
            Local1 = One
            If ((OSYS == 0x07D1))
            {
                Local1 = Zero
            }

            If ((OSYS == 0x07D2))
            {
                Local1 = Zero
            }

            If ((OSYS == 0x07D6))
            {
                Local1 = One
            }

            If ((OSYS == 0x03E8))
            {
                Local1 = 0x02
            }

            If ((OSYS == 0x07D9))
            {
                Local1 = 0x03
            }

            If ((OSYS == 0x07DC))
            {
                Local1 = 0x04
            }

            If ((OSYS == 0x07DD))
            {
                Local1 = 0x05
            }

            If ((OSYS == 0x07DF))
            {
                Local1 = 0x06
            }

            If ((OSYS == 0x07E0))
            {
                Local1 = 0x06
            }

            If ((OSYS == 0x07E1))
            {
                If (_OSI ("Windows 2017.2"))
                {
                    Local1 = 0x07
                }
                Else
                {
                    Local1 = 0x06
                }
            }

            ^EC0.OSTY = Local1
        }

        Device (LID0)
        {
            Name (_HID, EisaId ("PNP0C0D") /* Lid Device */)  // _HID: Hardware ID
            Name (PLID, One)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                Local0 = ^^EC0.LIDF /* \_SB_.PCI0.LPC0.EC0_.LIDF */
                If (Local0)
                {
                    Return (Zero)
                }

                Return (One)
            }
        }

        Method (ECFG, 1, NotSerialized)
        {
            If ((Arg0 == One))
            {
                ^EC0.ECRD = One
            }
            Else
            {
                ^EC0.ECRD = Zero
            }
        }
    }

    Scope (_SB.PCI0.LPC0.EC0)
    {
        Method (GCMS, 1, NotSerialized)
        {
            Local0 = Zero
            Arg0 = Local0
            Return (Zero)
        }

        Method (GOTS, 2, Serialized)
        {
            Local0 = Zero
            Local1 = (Arg0 & 0xFF)
            Switch (Local1)
            {
                Case (0x83)
                {
                    If (!TOUP)
                    {
                        Local0 |= 0x02
                    }
                }

            }

            Arg1 = Local0
            Return (Zero)
        }

        Method (GBL1, 1, NotSerialized)
        {
            Local0 = Zero
            Arg0 = Local0
            Return (Zero)
        }

        Method (GBL2, 1, NotSerialized)
        {
            Local0 = Zero
            Arg0 = Local0
            Return (Zero)
        }

        Method (GSTY, 1, NotSerialized)
        {
            Local0 = Zero
            Arg0 = Local0
            Return (Zero)
        }

        Method (GSDA, 1, NotSerialized)
        {
            Local0 = Zero
            Arg0 = Local0
            Return (Zero)
        }

        Method (GTTY, 1, NotSerialized)
        {
            Local0 = Zero
            Arg0 = Local0
            Return (Zero)
        }

        Method (GTDA, 1, NotSerialized)
        {
            Local0 = Zero
            Arg0 = Local0
            Return (Zero)
        }

        Method (GACS, 1, NotSerialized)
        {
            Local0 = Zero
            Local0 = ADPT /* \_SB_.PCI0.LPC0.EC0_.ADPT */
            Arg0 = Local0
            Return (Zero)
        }

        Method (GHKF, 1, NotSerialized)
        {
            Local0 = Zero
            Arg0 = Local0
            Return (Zero)
        }

        Method (GHKD, 1, NotSerialized)
        {
            Local0 = Zero
            Arg0 = Local0
            Return (Zero)
        }

        Method (GGSI, 2, Serialized)
        {
            Local0 = Zero
            Local1 = DerefOf (Arg0 [Zero])
            Local2 = DerefOf (Arg0 [One])
            If ((Local1 == Zero))
            {
                Arg1 = Local0
            }
            ElseIf ((Local1 == One))
            {
                Switch (Local2)
                {
                    Case (One)
                    {
                        Local0 = CTMP /* \_SB_.PCI0.LPC0.EC0_.CTMP */
                    }
                    Case (0x02)
                    {
                        Local0 = C1FR /* \_SB_.PCI0.LPC0.EC0_.C1FR */
                    }
                    Case (0x03)
                    {
                        Local0 = SKTB /* \_SB_.PCI0.LPC0.EC0_.SKTB */
                    }
                    Case (0x04)
                    {
                    }
                    Case (0x05)
                    {
                    }
                    Case (0x06)
                    {
                        Local0 = G1FR /* \_SB_.PCI0.LPC0.EC0_.G1FR */
                    }
                    Case (0x07)
                    {
                    }
                    Case (0x08)
                    {
                    }
                    Case (0x09)
                    {
                    }
                    Case (0x0A)
                    {
                        Local0 = SKTC /* \_SB_.PCI0.LPC0.EC0_.SKTC */
                    }
                    Case (0x0B)
                    {
                    }
                    Case (0x0C)
                    {
                    }
                    Case (0x0D)
                    {
                    }
                    Case (0x0E)
                    {
                    }
                    Case (0x0F)
                    {
                    }
                    Case (0x10)
                    {
                    }
                    Case (0x11)
                    {
                    }

                }

                Arg1 = Local0
            }
            ElseIf ((Local1 == 0x02))
            {
                Local0 = BBMS /* \_SB_.PCI0.LPC0.EC0_.BBMS */
                Arg1 = Local0
            }

            Return (Zero)
        }
    }

    Device (AAMC)
    {
        Name (_HID, "10251229")  // _HID: Hardware ID
        Name (_DDN, "Acer Airplane Mode Controller")  // _DDN: DOS Device Name
        Name (_UID, Zero)  // _UID: Unique ID
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }

    Scope (_SB.PCI0.GPP4)
    {
        Device (PXSX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            OperationRegion (RPXX, PCI_Config, Zero, 0x10)
            Field (RPXX, AnyAcc, NoLock, Preserve)
            {
                VDID,   16
            }

            Method (FLCP, 0, Serialized)
            {
                If ((VDID == 0x8086))
                {
                    Return (0x44)
                }
                Else
                {
                    Return (0x84)
                }
            }

            OperationRegion (FLDR, PCI_Config, FLCP (), 0x06)
            Field (FLDR, ByteAcc, NoLock, Preserve)
            {
                DCAP,   32, 
                DCTR,   16
            }

            Method (WIST, 0, Serialized)
            {
                If (CondRefOf (VDID))
                {
                    Switch (ToInteger (VDID))
                    {
                        Case (0x8086)
                        {
                            Return (One)
                        }
                        Case (0x14C3)
                        {
                            Return (One)
                        }
                        Default
                        {
                            Return (Zero)
                        }

                    }
                }
                Else
                {
                    Return (Zero)
                }
            }

            PowerResource (WRST, 0x05, 0x0000)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (One)
                }

                Method (_ON, 0, NotSerialized)  // _ON_: Power On
                {
                    ^^^^LPC0.EC0.WLEX = One
                }

                Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                {
                    ^^^^LPC0.EC0.WLEX = Zero
                }

                Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                {
                    If (WIST ())
                    {
                        If ((DCAP & 0x10000000))
                        {
                            Local0 = DCTR /* \_SB_.PCI0.GPP4.PXSX.DCTR */
                            Local0 |= 0x8000
                            DCTR = Local0
                        }
                    }
                }
            }

            Method (_PRR, 0, NotSerialized)  // _PRR: Power Resource for Reset
            {
                Return (Package (0x01)
                {
                    WRST, 
                })
            }

            Name (WRDX, Package (0x03)
            {
                Zero, 
                Package (0x02)
                {
                    0x80000000, 
                    0x8000
                }, 

                Package (0x02)
                {
                    0x80000000, 
                    0x8000
                }
            })
            Method (WRDD, 0, Serialized)
            {
                DerefOf (WRDX [One]) [Zero] = 0x07
                If ((CMSR (0x4C) == 0x04))
                {
                    DerefOf (WRDX [One]) [One] = 0x4944
                }
                Else
                {
                    DerefOf (WRDX [One]) [One] = 0x4150
                }

                DerefOf (WRDX [0x02]) [Zero] = 0x07
                If ((CMSR (0x4C) == 0x04))
                {
                    DerefOf (WRDX [0x02]) [One] = 0x4944
                }
                Else
                {
                    DerefOf (WRDX [0x02]) [One] = 0x4150
                }

                Return (WRDX) /* \_SB_.PCI0.GPP4.PXSX.WRDX */
            }
        }
    }
}

