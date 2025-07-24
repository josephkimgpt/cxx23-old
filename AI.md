# AI Project Structure and Conventions

## Project Directory Layout

```
project_root/
│
├── build/         # Build artifacts and compiled executables will be placed here
│
├── include/       # Header files directory
│   └── guc/       # Project-specific header files
│       └── *.hh   # Header files with .hh extension
│
├── src/           # Source code implementation files
│   └── *.cc       # Source files with .cc extension
│
├── CMakeLists.txt # CMake build configuration
├── Makefile       # Legacy Makefile (kept for reference)
└── AI.md          # This documentation file
```

## Naming Conventions

1. **File Extensions**:
   - Header files: `.hh`
   - Source files: `.cc`

2. **Directory Purpose**:
   - `build/`: Build artifacts, compiled objects, and executables
   - `include/`: Header files (interface definitions)
   - `include/guc/`: Project-specific header files
   - `src/`: Implementation source files

3. **Namespace**:
   - All project code is contained within the `guc` namespace

## Build System

The project uses **CMake** as the primary build system:

- **CMake Version**: 3.20 or higher required
- **Build Configuration**: CMakeLists.txt in project root
- **Out-of-source builds**: Recommended using `build/` directory

## Compilation Details

- **C++ Standard**: C++23
- **Compiler Flags**:
  - `-std=c++23`: Use C++23 standard
  - `-Wall`: Enable all warnings
  - `-Werror`: Treat warnings as errors
  - `-Wextra`: Enable extra warnings
  - `-Wpedantic`: Enforce strict ISO C++ compliance

## Build Commands

### Using CMake (Recommended)

```bash
# Create build directory and configure
mkdir -p build
cd build
cmake ..

# Build the project
cmake --build .

# Alternative: use make in build directory
make

# Clean build artifacts
rm -rf build/*
# or
make clean
```

### Advanced CMake Usage

```bash
# Configure with specific build type
cmake -DCMAKE_BUILD_TYPE=Debug ..
cmake -DCMAKE_BUILD_TYPE=Release ..

# Configure with specific compiler
cmake -DCMAKE_CXX_COMPILER=g++ ..
cmake -DCMAKE_CXX_COMPILER=clang++ ..

# Build with parallel jobs
cmake --build . --parallel 4

# Install (if install targets are defined)
cmake --install .
```

### Legacy Makefile Support

The original Makefile is still available for reference:

```bash
# Build using legacy Makefile
make

# Clean using legacy Makefile
make clean
```

## CMake Project Structure

The CMakeLists.txt file:
- Sets C++23 as the standard
- Configures strict compiler warnings
- Automatically discovers source files in `src/`
- Creates a main executable
- Optionally creates a static library from non-main sources
- Sets up proper include directories

## Rationale

- **CMake Benefits**:
  - Cross-platform build system
  - Better dependency management
  - Integration with IDEs and development tools
  - Scalable for larger projects
  - Industry standard for C++ projects

- **File Conventions**:
  - Using `.hh` instead of `.h` to distinguish from standard C headers
  - Separating interface (headers) from implementation (source files)
  - Organized directory structure for clear project management
  - `build/` directory for keeping build artifacts separate from source code
  - Using `guc` namespace to prevent naming conflicts
  - Strict compiler warnings to ensure code quality

## Best Practices

- Use out-of-source builds (build in `build/` directory)
- Keep header files minimal and focused
- Use include guards in header files
- Implement source files in the corresponding `.cc` files
- Follow namespace conventions
- Write clear, concise documentation comments
- Compile with strict warnings and standards
- Use CMake's target-based approach for complex projects

## Example Code Structure

### Header (include/guc/add.hh)
```cpp
#ifndef GUC_ADD_HH
#define GUC_ADD_HH

namespace guc {
    /**
     * @brief Adds two integers
     * @param a First integer to add
     * @param b Second integer to add
     * @return Sum of a and b
     */
    int add(int a, int b);
}

#endif // GUC_ADD_HH
```

### Implementation (src/add.cc)
```cpp
#include "guc/add.hh"

namespace guc {
    int add(int a, int b) {
        return a + b;
    }
}
```

### Main Program (src/main.cc)
```cpp
#include <iostream>
#include "guc/add.hh"

int main() {
    int x = 5, y = 7;
    int result = guc::add(x, y);
    std::cout << x << " + " << y << " = " << result << std::endl;
    return 0;
}
```

## Testing the Migration

To verify the CMake migration works correctly:

```bash
# Test CMake build
mkdir -p build
cd build
cmake ..
cmake --build .
./main

# Test legacy Makefile still works
cd ..
make
./build/main
```

This structure provides a modern, scalable approach to C++ project management using CMake while maintaining backward compatibility with the original Makefile.