/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (32-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembly of TPM20.aml
 *
 * ACPI Data Table [TPM2]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
 */

[000h 0000 004h]                   Signature : "TPM2"    [Trusted Platform Module hardware interface Table]
[004h 0004 004h]                Table Length : 0000004C
[008h 0008 001h]                    Revision : 04
[009h 0009 001h]                    Checksum : 11
[00Ah 0010 006h]                      Oem ID : "ACRSYS"
[010h 0016 008h]                Oem Table ID : "ACRPRDCT"
[018h 0024 004h]                Oem Revision : 00000002
[01Ch 0028 004h]             Asl Compiler ID : "1025"
[020h 0032 004h]       Asl Compiler Revision : 00040000

[024h 0036 002h]              Platform Class : 0000
[026h 0038 002h]                    Reserved : 0000
[028h 0040 008h]             Control Address : 00000000FDE10510
[030h 0048 004h]                Start Method : 02 [ACPI Start Method]

[034h 0052 00Ch]           Method Parameters : 00 00 00 00 00 00 00 00 00 00 00 00
[040h 0064 004h]          Minimum Log Length : 00010000
[044h 0068 008h]                 Log Address : 00000000B64A9000

Raw Table Data: Length 76 (0x4C)

    0000: 54 50 4D 32 4C 00 00 00 04 11 41 43 52 53 59 53  // TPM2L.....ACRSYS
    0010: 41 43 52 50 52 44 43 54 02 00 00 00 31 30 32 35  // ACRPRDCT....1025
    0020: 00 00 04 00 00 00 00 00 10 05 E1 FD 00 00 00 00  // ................
    0030: 02 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  // ................
    0040: 00 00 01 00 00 90 4A B6 00 00 00 00              // ......J.....
