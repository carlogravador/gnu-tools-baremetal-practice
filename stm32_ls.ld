/* Linker script to configure memory regions.
 * Need modifying for a specific board.
 */

ENTRY(Reset_Handler)

/*   FLASH.ORIGIN: starting address of flash
 *   FLASH.LENGTH: length of flash
 *   RAM.ORIGIN: starting address of RAM bank 0
 *   RAM.LENGTH: length of RAM bank 0
 */
MEMORY
{
    FLASH (rx) : ORIGIN = 0x08000000, LENGTH = 0x7FFFF  /* 512K */
    RAM (rwx) : ORIGIN = 0x20000000, LENGTH = 0xFFFF   /*  64K */
}

/*
 * .sectionName:
 * {
 *
 * }>vma AT> lma
 */
SECTIONS
{
    /* This section should include .text section of all input files */
    .text :
    {
        *(.isr_vector)
        *(.text)
        *(.rodata)
        . = ALIGN(4);
        _etext = .;
    } > FLASH

    .data :
    {
        _sdata = .;
        *(.data)
        . = ALIGN(4);
        _edata = .;
    } > RAM AT> FLASH

    .bss :
    {
        _sbss = .;
        *(.bss)
        *(COMMON)
        . = ALIGN(4);
        _ebss = .;
    } > RAM
}
