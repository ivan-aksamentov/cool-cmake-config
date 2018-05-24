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


# Adds some useful C compiler flags

include(CoolCommonFlags)


set(COOL_C_FLAGS " \
${COOL_C_AND_C_FLAGS} \
-Waggregate-return \
-Wcast-qual \
-Wstrict-prototypes \
-Wtype-limits \
")

set(COOL_C_FLAGS_DEBUG " \
-DDEBUG=1 \
-O0 \
-fstack-protector-all \
")

set(COOL_C_FLAGS_DEBUG_FAST " \
-DDEBUG=1 \
-Og \
-fstack-protector-all \
")

set(COOL_C_FLAGS_RELEASE " \
-DNDEBUG=1 \
-fno-omit-frame-pointer \
")

set(CMAKE_C_FLAGS_SANITIZE "\
-g \
-O1 \
-DNDEBUG=1 \
-fno-omit-frame-pointer \
-fno-optimize-sibling-calls \
")


set(COOL_C_FLAGS_GCC "${COOL_C_FLAGS}")

set(COOL_C_FLAGS_GCC5 " \
-Wcast-qual \
-Wvector-operation-performance \
")

set(COOL_C_FLAGS_GCC6 " \
${COOL_C_FLAGS_GCC5} \
-Wduplicated-cond \
-Wmisleading-indentation \
-Wnull-dereference \
-Wshift-negative-value \
-Wshift-overflow=2 \
")

set(COOL_C_FLAGS_GCC7 " \
${COOL_C_FLAGS_GCC6} \
-Wrestrict \
-Wvla-larger-than=1 \
-Wdangling-else \
-Walloc-zero \
-Wnonnull \
")

set(COOL_C_FLAGS_GCC8 " \
${COOL_C_FLAGS_GCC7} \
-Wmultistatement-macros \
-Wif-not-aligned \
-Wmissing-attributes \
")

set(COOL_EXE_LINKER_FLAGS_GCC "")
set(COOL_EXE_LINKER_FLAGS_GCC_DEBUG "")
set(COOL_EXE_LINKER_FLAGS_GCC_RELEASE "")
set(COOL_SHARED_LINKER_FLAGS_GCC "")
set(COOL_SHARED_LINKER_FLAGS_GCC_DEBUG "")
set(COOL_SHARED_LINKER_FLAGS_GCC_RELEASE "")


set(COOL_C_FLAGS_CLANG " \
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

set(COOL_C_FLAGS_CLANG4 " \
${COOL_C_FLAGS_CLANG} \
-fstrict-vtable-pointers \
")

set(COOL_C_FLAGS_CLANG5 " \
${COOL_C_FLAGS_CLANG4} \
-Wcast-qual \
-Wunused-lambda-capture \
")

set(COOL_C_FLAGS_CLANG6 " \
${COOL_C_FLAGS_CLANG5} \
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



set(COOL_C_FLAGS_MSVC " \
/D_SCL_SECURE_NO_WARNINGS \
/D_CRT_SECURE_NO_WARNINGS \
/DNOMINMAX \
/DWIN32_LEAN_AND_MEAN \
")

set(COOL_C_FLAGS_MSVC_DEBUG "")

set(COOL_C_FLAGS_MSVC_RELEASE "")

set(COOL_EXE_LINKER_FLAGS_MSVC "/ignore:4099")

set(COOL_EXE_LINKER_FLAGS_MSVC_DEBUG "")

set(COOL_EXE_LINKER_FLAGS_MSVC_RELEASE "")

set(COOL_SHARED_LINKER_FLAGS_MSVC "/ignore:4099")

set(COOL_SHARED_LINKER_FLAGS_MSVC_DEBUG "")

set(COOL_SHARED_LINKER_FLAGS_MSVC_RELEASE "")


if(CMAKE_C_COMPILER_ID MATCHES "GNU")
    set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${COOL_C_FLAGS}")
    set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_GCC}")

    if(CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL 8)
        set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_GCC8}")
        set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_DEBUG_FAST}")
    elseif(CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL 7)
        set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_GCC7}")
        set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_DEBUG_FAST}")
    elseif(CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL 6)
        set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_GCC6}")
        set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_DEBUG_FAST}")
    elseif(CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL 5)
        set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_GCC5}")
        set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_DEBUG}")
    else()
        set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_DEBUG}")
    endif()

    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS_RELEASE} ${COOL_C_FLAGS_RELEASE}")
    set(CMAKE_C_FLAGS_SANITIZE "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS_SANITIZE} ${COOL_C_FLAGS_SANITIZE}")
    set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} ${COOL_SHARED_LINKER_FLAGS_GCC_RELEASE}")
    set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE} ${COOL_EXE_LINKER_FLAGS_GCC_RELEASE}")

elseif(CMAKE_C_COMPILER_ID MATCHES "Clang")
    set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${COOL_C_FLAGS}")
    set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_CLANG}")

    if(CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL 6)
        set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_CLANG6}")
        set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_DEBUG_FAST}")
    elseif(CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL 5)
        set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_CLANG5}")
        set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_DEBUG_FAST}")
    elseif(CMAKE_C_COMPILER_VERSION VERSION_GREATER_EQUAL 4)
        set(CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_CLANG4}")
        set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_DEBUG_FAST}")
    else()
        set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS} ${COOL_C_FLAGS_DEBUG}")
    endif()

    set(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS_RELEASE} ${COOL_C_FLAGS_RELEASE}")
    set(CMAKE_C_FLAGS_SANITIZE "${CMAKE_C_FLAGS} ${CMAKE_C_FLAGS_SANITIZE} ${COOL_C_FLAGS_SANITIZE}")
    set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} ${COOL_SHARED_LINKER_FLAGS_CLANG_RELEASE}")
    set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE} ${COOL_EXE_LINKER_FLAGS_CLANG_RELEASE}")

elseif(CMAKE_C_COMPILER_ID MATCHES "Intel")
    # TODO

elseif(CMAKE_C_COMPILER_ID MATCHES "MSVC")

    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COOL_MSVC_C_FLAGS}")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${COOL_EXE_LINKER_FLAGS_MSVC}")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} ${COOL_SHARED_LINKER_FLAGS_MSVC}")

endif()
