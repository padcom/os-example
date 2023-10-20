.PHONY: all clean

ASM=nasm
SRC_DIR=src
BUILD_DIR=build

all: pre-build $(BUILD_DIR)/main_floppy.img

pre-build:
	mkdir $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)

$(BUILD_DIR)/main_floppy.img: $(BUILD_DIR)/main.bin
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main_floppy.img
	truncate -s 1440k $(BUILD_DIR)/main_floppy.img

$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm
	$(ASM) $(SRC_DIR)/main.asm -f bin -o $(BUILD_DIR)/main.bin
