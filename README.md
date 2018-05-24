# Cool CMake config

Advanced CMake compier flags for C and C++.

Supported compilers:

  - GCC >= 4.9
  - Clang >= 3.9
  - MSVC >= 2013 (rudimentary support).

## Usage

 - Add this repository as a submodule to your git or download the files you need and copy them over. I like to put CMake include files in `cmake/` directory of my project's root like so:
  
    mkdir cmake && cd cmake
    git submodule add https://github.com/ivan-aksamentov/cool-cmake-config.git
 
 - Include some or all of the provided files with CMake's `include()` statement (see below)


## Cool C and C++ flags

Go beyond `-Wall` and `-Wextra` and make use of advanced compile-time checks and warnings for your build:

 - Adjust `CMAKE_MODULE_PATH` and include `CoolCFlags.cmake`, or `CoolCXXFlags.cmake`, or both into your root `CMakeLists.txt`:
        
       set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/cool-cmake-config ${CMAKE_MODULE_PATH})

       include(CoolCFlags)
       include(CoolCXXFlags)

 - Build and run as usual

 - Mandatory step: fix all the warnings without silencing them! ;)


## Cool Sanitizers

Create additional build types (the ones you set with `CMAKE_BUILD_TYPE` variable) that make use of Clang Sanitizers or GCC Sanitizers:

 - Adjust `CMAKE_MODULE_PATH` and include `CoolSanitizers.cmake` into your root `CMakeLists.txt`:

       set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/cool-cmake-config ${CMAKE_MODULE_PATH})

       include(CoolSanitizers)

  - run `cmake` with variable `CMAKE_BUILD_TYPE` set to one of the following:
  
      - ASAN - for address sanitizer
      - MSAN - for memory sanitizer
      - TSAN - for thread sanitizer
      - UBSAN - for undefined behavior sanitizer

        Example:

            cmake -DCMAKE_BUILD_TYPE=ASAN
  
  - Build and run as usual 


  - optionally, enforce clang as C and C++ compiler

        Example:

        cmake -DCMAKE_BUILD_TYPE=TSAN \
              -DCMAKE_C_COMPILER=$(which clang) \
              -DCMAKE_CXX_COMPILER=$(which clang++)

## References

 - [GCC online docs](https://gcc.gnu.org/onlinedocs/)
 - [Clang Compiler User’s Manual](https://clang.llvm.org/docs/UsersManual.html)
 - Release Notes for GCC [8](https://gcc.gnu.org/gcc-8/changes.html), [7](https://gcc.gnu.org/gcc-7/changes.html), [6](https://gcc.gnu.org/gcc-6/changes.html), [5](https://gcc.gnu.org/gcc-5/changes.html)
 - Release Notes for Clang [6](https://releases.llvm.org/6.0.0/tools/clang/docs/ReleaseNotes.html), [5](https://releases.llvm.org/5.0.0/tools/clang/docs/ReleaseNotes.html), [4](https://releases.llvm.org/4.0.0/tools/clang/docs/ReleaseNotes.html)
