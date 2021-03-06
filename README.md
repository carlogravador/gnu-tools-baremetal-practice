## Star-up file
* Responsible for setting up right environment for the main user code to run.

### Contents of Startup file
1. Create a vector table for your microcontroller. Vector table are MCU specific
2. Write a start-up code which initializes `.data` `.bss` section in SRAM
3. Call main()

* Vector Table - contains handler addresses
**Search for your MCU's reference manual**

### Creating a Vector Table

Code memory (Flash)

```
------------------
Unused Code memory
------------------
.data
(initialized
global and static
variables)
-------------------
.rodata
-------------------
.text
-------------------                         ----------------------------
Vector Table          ------------------->     Addr of IRQ-N Handler 
-------------------                         ----------------------------
                                              Addr of IRQ-(N-1) Handler
                                            ----------------------------
                                                          .
                                                          .
                                                          .

                                            ----------------------------
                                                  Addr of IRQ-1 Handler
                                            ----------------------------
                                                  Initial MSP Value
                                            ----------------------------
```

1. Create an array to hold MSP and handlers addresses.
```C
uint32_t vectors[] = {store MSP and address of various handlers here}
```
MSP - main stack pointer (first word in the vector table)

2. Instruct the compiler no to include the above array in `.data`  but in a user defined section


## Linker Scripts
* Explains how different sections of the object files should be merged to create an output file
* must be supply during linking phase

VMA - virtual memory address
LMA - load memory address

Location Counter always tracks vma of the section in whic it is being used
