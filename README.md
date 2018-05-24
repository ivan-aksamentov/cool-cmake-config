# Cool CMake config

Advanced CMake compier flags for C and C++.

Include these files into your CMake build for extra build goodies. 

## Cool C and C++ flags

Go beyond `-Wall` and `-Wextra` and make use of advanced compile-time checks 
and warnings for your build.

Usage:

## Cool Sanitizers

Create additional build types (the ones you set with `CMAKE_BUILD_TYPE` variable)
that make use of Clang Sanitizers or GCC Sanitizers.

 Usage:
  - Add this repository as a submodule to your project or download the files 
  you need and copy them over. I like to keep CMake includes in `cmake/` directory 
  of my project's root like so:
  
     mkdir cmake/
     
     git clone git@github.com:ivan-aksamentov/cmake-compiler-config.git
 
  - include this file into your root CMakeLists.txt:
    
        CoolSanitizers.cmake

       include(CoolSanitizers)

  - run `cmake` with variable `CMAKE_BUILD_TYPE` to one of the following:
  
        - ASAN - for address sanitizer
        - MSAN - for memory sanitizer
        - TSAN - for thread sanitizer
        - UBSAN - for undefined behavior sanitizer

        Example:

        cmake -DCMAKE_BUILD_TYPE=ASAN
  
  - Build and run as usual 


  - optionally, set your C and C++ compiler paths to clang with
 CMAKE_C_COMPILER and CMAKE_CXX_COMPILER variables

        Example:

        cmake -DCMAKE_BUILD_TYPE=TSAN \
              -DCMAKE_C_COMPILER=$(which clang) \
              -DCMAKE_CXX_COMPILER=$(which clang++)
