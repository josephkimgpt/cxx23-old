CXX = g++
CXXFLAGS = -std=c++23 -Wall -Werror -Wextra -Wpedantic
INCLUDE_DIR = include
SRC_DIR = src
BUILD_DIR = build

# Ensure build directory exists
$(shell mkdir -p $(BUILD_DIR))

# Find all source files
SRCS = $(wildcard $(SRC_DIR)/*.cc)
OBJS = $(SRCS:$(SRC_DIR)/%.cc=$(BUILD_DIR)/%.o)

# Target executable
TARGET = $(BUILD_DIR)/main

# Default target
all: $(TARGET)

# Link object files into executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -o $@ $^

# Compile source files into object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cc
	@mkdir -p $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -c -o $@ $<

# Clean build artifacts
clean:
	rm -rf $(BUILD_DIR)

# Phony targets
.PHONY: all clean