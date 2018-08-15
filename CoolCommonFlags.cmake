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


# Adds some useful compiler flags


set(COOL_C_AND_CXX_FLAGS " \
-D_XOPEN_SOURCE=700 \
-Wall \
-Wextra \
-Werror=incompatible-pointer-types \
-fno-strict-aliasing \
-ftrapv \
-fvisibility=hidden \
-pipe \
-Warray-bounds \
-Wconversion \
-Wdeprecated-declarations \
-Wempty-body \
-Werror-implicit-function-declaration \
-Werror=int-conversion \
-Wfloat-conversion \
-Wfloat-equal \
-Wformat-extra-args \
-Wformat-nonliteral \
-Wformat-security \
-Wformat-y2k \
-Wformat-zero-length \
-Wformat=2 \
-Wignored-qualifiers \
-Winit-self \
-Wno-format-nonliteral \
-Wpointer-arith \
-Wredundant-decls \
-Wshadow \
-Wsign-compare \
-Wstrict-overflow=5 \
-Wswitch-default \
-Wswitch-enum \
-Wtype-limits \
-Wundef \
-Wuninitialized \
-Wunreachable-code \
-Wwrite-strings \
-Wno-unused-parameter \
-Wno-unused-variable \
-Wno-cast-align \
-Wno-undef \
-Wno-shadow \
-Wno-zero-as-null-pointer-constant \
-Wno-conversion \
-Wno-float-conversion \
-Wno-unknown-pragmas \
")
