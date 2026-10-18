/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20260408 (32-bit version)
 * Copyright (c) 2000 - 2026 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of ACPI_SSDE_ACRSYS_ACRPRDCT_00000001.aml
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000007D (125)
 *     Revision         0x01
 *     Checksum         0x62
 *     OEM ID           "ACRSYS"
 *     OEM Table ID     "ACRPRDCT"
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "1025"
 *     Compiler Version 0x00040000 (262144)
 */
DefinitionBlock ("", "SSDT", 1, "ACRSYS", "ACRPRDCT", 0x00000001)
{
    External (_SB_.PLTF, DeviceObj)

    Scope (\_SB.PLTF)
    {
        Name (_LPI, Package (0x04)  // _LPI: Low Power Idle States
        {
            Zero, 
            Zero, 
            One, 
            Package (0x0A)
            {
                0x000F4240, 
                0xC350, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                Buffer (0x11)
                {
                    /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                    /* 0010 */  0x00                                             // .
                }, 

                Buffer (0x11)
                {
                    /* 0000 */  0x82, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // ........
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79,  // .......y
                    /* 0010 */  0x00                                             // .
                }, 

                "S0i3"
            }
        })
    }
}

