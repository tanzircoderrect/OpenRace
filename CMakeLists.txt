cmake_minimum_required(VERSION 3.0.0)
project(OpenRace
        VERSION 0.0.1
        LANGUAGES CXX)

if (NOT EXISTS ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
    message(WARNING "conanbuildinfo.cmake not found; attempting generation...")

    if (UNIX)
        execute_process(COMMAND conan install .. -s compiler=clang -s compiler.version=10
                WORKING_DIRECTORY ${CMAKE_BINARY_DIR}
                RESULT_VARIABLE CONAN_RESULT_FAILURE)
        if (CONAN_RESULT_FAILURE)
            message(FATAL_ERROR "Unable to generate conanbuildinfo.cmake; see log for details (if there's no output, conan may not be available on your system; make sure it's in your PATH!).")
        endif ()
    else ()
        message(FATAL_ERROR "Unable to generate conanbuildinfo.cmake; please generate with `conan install .. -s compiler=" clang" -s compiler.version="10.0.1"` or equivalent for your operating system before attempting to build.")
    endif ()

endif ()

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS)

list(APPEND CMAKE_PREFIX_PATH ${LLVM_DIR})
find_package(LLVM 10.0.1 REQUIRED CONFIG)
message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

## Don't do this. Do these for each target per modern cmake
# include_directories(${LLVM_INCLUDE_DIRS})
# add_definitions(${LLVM_DEFINITIONS})

# Find the libraries that correspond to the LLVM components
# that we wish to use
llvm_map_components_to_libnames(llvm_libs
        bitwriter
        core
        ipo
        irreader
        instcombine
        instrumentation
        target
        linker
        analysis
        scalaropts
        support
        transformutils
        codegen
        passes

        # needed when link llvm as shared library
        AggressiveInstCombine
        demangle
        mc)

add_subdirectory(src)

include(CTest)
include(Catch)
enable_testing()

add_subdirectory(tests)
