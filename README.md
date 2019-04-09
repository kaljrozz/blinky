# Blinky for STM32F407G-DISC1
> Use the onboard timers to generate an interrupt that toggles the green led on and off using only the register definitions provied by st and the cmis core.

# Required Tools
* make
* [GNU ARM Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads)
* [texane stlink](https://github.com/texane/stlink)
* STM32F407G-DISC1 Discovery Board

# Compiling Instructions
> Make sure your discovery board is plugged in to your computer, and that you have the required tools installed. Then use your shell to clone the git repository and compile/flash your board.
```
git clone https://github.com/mkrolbass/blinky.git
make flash
```
