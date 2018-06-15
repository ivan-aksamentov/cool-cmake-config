
set(WITH_VECTORIZE ON CACHE BOOL "Enable")
if(${WITH_VECTORIZE})

if(CMAKE_C_COMPILER_ID MATCHES "GNU"
   OR CMAKE_C_COMPILER_ID MATCHES "Clang"
   OR CMAKE_C_COMPILER_ID MATCHES "Intel")
    set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} -ftree-vectorize")
endif()

endif()