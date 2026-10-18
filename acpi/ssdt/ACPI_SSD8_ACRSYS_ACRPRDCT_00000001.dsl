/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (32-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ACPI_SSD8_ACRSYS_ACRPRDCT_00000001.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000139 (313)
 *     Revision         0x01
 *     Checksum         0x63
 *     OEM ID           "ACRSYS"
 *     OEM Table ID     "ACRPRDCT"
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "1025"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 1, "ACRSYS", "ACRPRDCT", 0x00000001)
{
    External (_SB_.PCI0, DeviceObj)

    Scope (\_SB.PCI0)
    {
        Device (P010)
        {
            Name (_ADR, 0x00010000)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P020)
        {
            Name (_ADR, 0x00020000)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P080)
        {
            Name (_ADR, 0x00080000)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P180)
        {
            Name (_ADR, 0x00180000)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P181)
        {
            Name (_ADR, 0x00180001)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P182)
        {
            Name (_ADR, 0x00180002)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P183)
        {
            Name (_ADR, 0x00180003)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P184)
        {
            Name (_ADR, 0x00180004)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P185)
        {
            Name (_ADR, 0x00180005)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P186)
        {
            Name (_ADR, 0x00180006)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }

        Device (P187)
        {
            Name (_ADR, 0x00180007)  // _ADR: Address
            Name (_STA, 0x0B)  // _STA: Status
        }
    }
}

