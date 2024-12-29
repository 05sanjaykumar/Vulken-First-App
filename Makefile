# Set Vulkan SDK path
VULKAN_SDK_PATH = /Users/sanjaykumar/VulkanSDK/1.3.296.0/macOS

# Compiler and linker flags
CXX = /opt/homebrew/bin/g++-12
CXXFLAGS = -std=c++11 -I$(VULKAN_SDK_PATH)/include -I/opt/homebrew/opt/glfw/include
LDFLAGS = -L$(VULKAN_SDK_PATH)/lib -L/opt/homebrew/lib -lvulkan -lglfw

# List of source files and object files
SRC = $(wildcard *.cpp)
OBJ = $(SRC:.cpp=.o)
OUT = main

# Default target
all: $(OUT)

# Link object files to create the executable
$(OUT): $(OBJ)
	$(CXX) $(OBJ) -o $(OUT) $(LDFLAGS)

# Compile source files into object files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up object and output files
clean:
	rm -f $(OBJ) $(OUT)

.PHONY: clean
