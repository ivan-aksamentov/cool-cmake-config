set(WITH_NATIVE_ARCH ON CACHE BOOL "Optimize for native architecture")
if(${WITH_NATIVE_ARCH})

if(CMAKE_C_COMPILER_ID MATCHES "GNU"
   OR CMAKE_C_COMPILER_ID MATCHES "Clang"
   OR CMAKE_C_COMPILER_ID MATCHES "Intel")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -march=native")
endif()

endif()
