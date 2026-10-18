/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (32-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ACPI_SSD3_ACRSYS_ACRPRDCT_00000002.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000080 (128)
 *     Revision         0x01
 *     Checksum         0xE6
 *     OEM ID           "ACRSYS"
 *     OEM Table ID     "ACRPRDCT"
 *     OEM Revision     0x00000002 (2)
 *     Compiler ID      "1025"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 1, "ACRSYS", "ACRPRDCT", 0x00000002)
{
    External (_SB_.PCI0.GP18.SATA, DeviceObj)

    Scope (\_SB.PCI0.GP18.SATA)
    {
        Device (PRT0)
        {
            Name (_ADR, 0xFFFF)  // _ADR: Address
            Name (NOP, Buffer (0x07)
            {
                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00         // .......
            })
            Name (SGTF, Buffer (0x07)
            {
                 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF5         // .......
            })
            Method (_GTF, 0, NotSerialized)  // _GTF: Get Task File
            {
                If (Zero)
                {
                    Return (SGTF) /* \_SB_.PCI0.GP18.SATA.PRT0.SGTF */
                }
                Else
                {
                    Return (NOP) /* \_SB_.PCI0.GP18.SATA.PRT0.NOP_ */
                }
            }
        }
    }
}

