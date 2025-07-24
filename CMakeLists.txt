cmake_minimum_required(VERSION 3.20)

# Project configuration
project(guc_project 
    VERSION 1.0.0
    DESCRIPTION "GUC C++ Project"
    LANGUAGES CXX
)

# Set C++ standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Compiler flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Werror -Wextra -Wpedantic")

# Include directories
include_directories(include)

# Collect source files
file(GLOB_RECURSE SOURCES "src/*.cc")

# Create executable
add_executable(main ${SOURCES})

# Set output directory for executables
set_target_properties(main PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
)

# Optional: Create a library from non-main source files
file(GLOB_RECURSE LIB_SOURCES "src/*.cc")
list(REMOVE_ITEM LIB_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/main.cc")

if(LIB_SOURCES)
    add_library(guc_lib STATIC ${LIB_SOURCES})
    target_include_directories(guc_lib PUBLIC include)
    target_link_libraries(main guc_lib)
endif()

# Enable testing (optional)
enable_testing()

# Print configuration information
message(STATUS "Project: ${PROJECT_NAME}")
message(STATUS "Version: ${PROJECT_VERSION}")
message(STATUS "C++ Standard: ${CMAKE_CXX_STANDARD}")
message(STATUS "Build Type: ${CMAKE_BUILD_TYPE}")