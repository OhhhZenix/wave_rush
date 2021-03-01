# Used for cmake vcpkg projects
cmake_minimum_required(VERSION 3.16)

if (DEFINED ENV{VCPKG_ROOT})
    set(CMAKE_TOOLCHAIN_FILE "$ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake" CACHE PATH "Path to vcpkg toolchain")
else ()
    if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/vcpkg)
        execute_process(COMMAND git clone https://github.com/microsoft/vcpkg.git WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})
    else ()
        execute_process(COMMAND git pull WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/vcpkg)
    endif ()
    set(CMAKE_TOOLCHAIN_FILE "${CMAKE_CURRENT_BINARY_DIR}/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE PATH "Path to vcpkg toolchain")
endif ()

message(STATUS "CMAKE_TOOLCHAIN_FILE=${CMAKE_TOOLCHAIN_FILE}")