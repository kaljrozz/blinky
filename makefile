# BARE METAL C MAKEFILE FOR STM32F4
# Written by Matt Krol

# Compile and Link Flags

CFLAGS = -g -Wall -mthumb -mcpu=cortex-m4 -I$(INC_DIR)
LDFLAGS = -Wl,-Map=$(OBJ_DIR)/$(TARGET).map,-T$(LD_SCRIPT),-lnosys

# Directory Structure

OBJ_DIR = obj
SRC_DIR = src
INC_DIR = inc
BIN_DIR = bin
TARGET = runme

# Define File Variables

SOURCES := $(wildcard $(SRC_DIR)/*)
OBJECTS := $(patsubst $(SRC_DIR)%.c, $(OBJ_DIR)%.o, $(SOURCES))
OBJECTS := $(patsubst $(SRC_DIR)%.s, $(OBJ_DIR)%.o, $(OBJECTS))
LD_SCRIPT := $(wildcard *.ld)

# Define Toolchain Variables

CC = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy
STFLASH = st-flash
FLASH_ADDR = 0x8000000

# Implicit Rules

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@$(CC) $(CFLAGS) -c -o $@ $^
	@echo "$^ => $@"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@$(CC) $(CFLAGS) -c -o $@ $^
	@echo "$^ => $@"

# Regular Rules

all: $(BIN_DIR)/$(TARGET).bin $(BIN_DIR)/$(TARGET).hex

$(BIN_DIR)/$(TARGET).bin: $(BIN_DIR)/$(TARGET).elf
	@$(OBJCOPY) -O binary $^ $@
	@echo "$^ => $@"

$(BIN_DIR)/$(TARGET).hex: $(BIN_DIR)/$(TARGET).elf
	@$(OBJCOPY) -O ihex $^ $@
	@echo "$^ => $@"

$(BIN_DIR)/$(TARGET).elf: $(OBJECTS)
	@$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
	@echo "$^ => $@"

flash: all
	$(STFLASH) write $(BIN_DIR)/$(TARGET).bin $(FLASH_ADDR)

# Phony Rules

.PHONY: clean print

clean:
	@rm -f $(OBJECTS)
	@rm -f $(BIN_DIR)/$(TARGET).elf
	@rm -f $(BIN_DIR)/$(TARGET).hex
	@rm -f $(BIN_DIR)/$(TARGET).bin
	@rm -f $(OBJ_DIR)/$(TARGET).map

print:
	@echo "CC = $(CC)"
	@echo "OBJCOPY = $(OBJCOPY)"
	@echo "CFLAGS = $(CFLAGS)"
	@echo "LDFLAGS = $(LDFLAGS)"
	@echo "SOURCES = $(SOURCES)"
	@echo "OBJECTS = $(OBJECTS)"
	@echo "LD_SCRIPT = $(LD_SCRIPT)"
