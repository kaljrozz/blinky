# Blinky for STM32F407G-DISC1
> Use the onboard timers to generate an interrupt that toggles the green led on and off using only the register definitions provied by St and the CMSIS core.

## Required Tools
* [GNU Make](https://www.gnu.org/software/make/)
* [GNU ARM Toolchain](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads)
* [St-Link Flash Utility](https://github.com/texane/stlink)
* [STM32F407G-DISC1 Development Board](https://www.st.com/en/evaluation-tools/stm32f4discovery.html)

## Compiling Instructions
> Make sure your discovery board is plugged into your computer, and that you have the required tools installed. Then use your shell to clone the git repository and compile/flash your board.
```
git clone https://github.com/kolazojar/blinky.git
cd blinky
make flash
```
