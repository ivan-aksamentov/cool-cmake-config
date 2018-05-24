# MIT License
#
# Copyright (c) 2014 Ivan Aksamentov <ivan.aksamentov@gmail.com>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


# Adds some useful C++ compiler flags

include(CoolCommonFlags)


set(COOL_CXX_FLAGS " \
${COOL_C_AND_CXX_FLAGS} \
-Woverloaded-virtual \
-Wwrite-strings \
-Wsized-deallocation \
-fsized-deallocation \
")

set(COOL_CXX_FLAGS_DEBUG " \
-DDEBUG=1 \
-D_GLIBCXX_DEBUG=1 \
-D_LIBCPP_DEBUG=1 \
-g \
-O0 \
-fstack-protector-all \
-fno-inline-small-functions \
")

set(COOL_CXX_FLAGS_DEBUG_FAST " \
-DDEBUG=1 \
-D_GLIBCXX_DEBUG=1 \
-D_LIBCPP_DEBUG=1 \
-g \
-Og \
-fstack-protector-all \
-fno-inline \
")

set(COOL_CXX_FLAGS_RELEASE " \
-DNDEBUG=1 \
-fno-math-errno \
")

set(CMAKE_CXX_FLAGS_SANITIZE "\
-g \
-O1 \
-DNDEBUG=1 \
-fno-omit-frame-pointer \
-fno-optimize-sibling-calls \
")


set(COOL_CXX_FLAGS_GCC "${COOL_CXX_FLAGS}")

set(COOL_CXX_FLAGS_GCC5 " \
${COOL_CXX_FLAGS_GCC} \
-Wcast-qual \
-Wvector-operation-performance \
")

#-Wzero-as-null-pointer-constant \

set(COOL_CXX_FLAGS_GCC6 " \
${COOL_CXX_FLAGS_GCC5} \
-Wduplicated-cond \
-Wmisleading-indentation \
-Wnull-dereference \
-Wshift-negative-value \
-Wshift-overflow=2 \
-fconcepts \
")

set(COOL_CXX_FLAGS_GCC7 " \
${COOL_CXX_FLAGS_GCC6} \
-Wrestrict \
-Wvla-larger-than=1 \
-Wdangling-else \
-Walloc-zero \
-Wnonnull \
-Waligned-new \
")

set(COOL_CXX_FLAGS_GCC8 " \
${COOL_CXX_FLAGS_GCC7} \
-Wmultistatement-macros \
-Wif-not-aligned \
-Wmissing-attributes \
-Wold-style-cast \
")

set(COOL_EXE_LINKER_FLAGS_GCC "")
set(COOL_EXE_LINKER_FLAGS_GCC_DEBUG "")
set(COOL_EXE_LINKER_FLAGS_GCC_RELEASE "")
set(COOL_SHARED_LINKER_FLAGS_GCC "")
set(COOL_SHARED_LINKER_FLAGS_GCC_DEBUG "")
set(COOL_SHARED_LINKER_FLAGS_GCC_RELEASE "")


set(COOL_CXX_FLAGS_CLANG " \
${COOL_CXX_FLAGS} \
-Reverything \
-Wabsolute-value \
-Wcomma \
-Wloop-analysis \
-Wmove \
-Wnull-dereference \
-Wrange-loop-analysis \
-Wshift-negative-value \
-Wshift-overflow \
-Wtautological-undefined-compare \
")

set(COOL_CXX_FLAGS_CLANG4 " \
${COOL_CXX_FLAGS_CLANG} \
-fstrict-vtable-pointers \
")

set(COOL_CXX_FLAGS_CLANG5 " \
${COOL_CXX_FLAGS_CLANG4} \
-Wcast-qual \
-Wunused-lambda-capture \
")

set(COOL_CXX_FLAGS_CLANG6 " \
${COOL_CXX_FLAGS_CLANG5} \
-Wpragma-pack \
-Wpragma-pack-suspicious-include \
-Wtautological-compare \
-Wnull-pointer-arithmetic \
-fdouble-square-bracket-attributes \
")

set(COOL_EXE_LINKER_FLAGS_CLANG "")
set(COOL_EXE_LINKER_FLAGS_CLANG_DEBUG "")
set(COOL_EXE_LINKER_FLAGS_CLANG_RELEASE "")
set(COOL_SHARED_LINKER_FLAGS_CLANG "")
set(COOL_SHARED_LINKER_FLAGS_CLANG_DEBUG "")
set(COOL_SHARED_LINKER_FLAGS_CLANG_RELEASE "")



set(COOL_CXX_FLAGS_MSVC " \
/D_SCL_SECURE_NO_WARNINGS \
/D_CRT_SECURE_NO_WARNINGS \
/DNOMINMAX \
/DWIN32_LEAN_AND_MEAN \
")

set(COOL_CXX_FLAGS_MSVC_DEBUG "")

set(COOL_CXX_FLAGS_MSVC_RELEASE "")

set(COOL_EXE_LINKER_FLAGS_MSVC "/ignore:4099")

set(COOL_EXE_LINKER_FLAGS_MSVC_DEBUG "")

set(COOL_EXE_LINKER_FLAGS_MSVC_RELEASE "")

set(COOL_SHARED_LINKER_FLAGS_MSVC "/ignore:4099")

set(COOL_SHARED_LINKER_FLAGS_MSVC_DEBUG "")

set(COOL_SHARED_LINKER_FLAGS_MSVC_RELEASE "")


function(AddCompilerOptionRelease cmakeOptionName compilerOption description)
    set(${cmakeOptionName} "ON" CACHE STRING "${description}")
    set_property(CACHE WITH_NATIVE_ARCH PROPERTY STRINGS ON OFF)

    if(${cmakeOptionName})
        set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} ${compilerOption}" PARENT_SCOPE)
        set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} ${compilerOption}" PARENT_SCOPE)
    endif()
endfunction()

AddCompilerOptionRelease(WITH_NATIVE_ARCH "-march=native" "Use -march=native in Release mode")
AddCompilerOptionRelease(WITH_AUTOVECTORIZATION "-ftree-vectorize" "Use -march=native in Release mode")
AddCompilerOptionRelease(WITH_ASSOCIATIVE_MATH "-fassociative-math" "Use -fassociative-math in Release mode")
AddCompilerOptionRelease(WITH_FAST_MATH "-ffast-math" "Use -ffast-math in Release mode")


if(CMAKE_CXX_COMPILER_ID MATCHES "GNU")
    if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 8)
        set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${COOL_CXX_FLAGS_GCC8}")
        set(CMAKE_CXX_FLAGS_DEBUG "${COOL_CXX_FLAGS_DEBUG_FAST}")
    elseif(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 7)
        set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${COOL_CXX_FLAGS_GCC7}")
        set(CMAKE_CXX_FLAGS_DEBUG "${COOL_CXX_FLAGS_DEBUG_FAST}")
    elseif(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 6)
        set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${COOL_CXX_FLAGS_GCC6}")
        set(CMAKE_CXX_FLAGS_DEBUG "${COOL_CXX_FLAGS_DEBUG_FAST}")
    elseif(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 5)
        set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${COOL_CXX_FLAGS_GCC5}")
        set(CMAKE_CXX_FLAGS_DEBUG "${COOL_CXX_FLAGS_DEBUG}")
    else()
        set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${COOL_CXX_FLAGS_GCC}")
        set(CMAKE_CXX_FLAGS_DEBUG "${COOL_CXX_FLAGS_DEBUG}")
    endif()

    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} ${COOL_CXX_FLAGS_RELEASE}")
    set(CMAKE_CXX_FLAGS_SANITIZE "${CMAKE_CXX_FLAGS_SANITIZE} ${COOL_CXX_FLAGS_SANITIZE}")


elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    if(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 6)
        set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${COOL_CXX_FLAGS_CLANG6}")
        set(CMAKE_CXX_FLAGS_DEBUG "${COOL_CXX_FLAGS_DEBUG_FAST}")
    elseif(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 5)
        set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${COOL_CXX_FLAGS_CLANG5}")
        set(CMAKE_CXX_FLAGS_DEBUG "${COOL_CXX_FLAGS_DEBUG_FAST}")
    elseif(CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 4)
        set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${COOL_CXX_FLAGS_CLANG4}")
        set(CMAKE_CXX_FLAGS_DEBUG "${COOL_CXX_FLAGS_DEBUG_FAST}")
    else()
        set(CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} ${COOL_CXX_FLAGS_CLANG}")
        set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS} ${COOL_CXX_FLAGS_DEBUG}")
    endif()

    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} ${COOL_CXX_FLAGS_RELEASE}")
    set(CMAKE_CXX_FLAGS_SANITIZE "${CMAKE_CXX_FLAGS_SANITIZE} ${COOL_CXX_FLAGS_SANITIZE}")

elseif(CMAKE_CXX_COMPILER_ID MATCHES "Intel")


elseif(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")

    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COOL_MSVC_CXX_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${COOL_EXE_LINKER_FLAGS_MSVC}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${COOL_SHARED_LINKER_FLAGS_MSVC}")

endif()
