set(WITH_LTO ON CACHE BOOL
    "Build with Link-time optimization (LTO) or Link-time code generation (LTCG) in Release mode")
if(${WITH_LTO})
include(CheckIPOSupported)
check_ipo_supported(RESULT result)
if(result)
    set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE 1)
endif()
endif()
