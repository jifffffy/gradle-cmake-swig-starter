find_package(SWIG REQUIRED)
find_package(JNI REQUIRED)

include(UseSWIG)

set(CMAKE_SWIG_FLAGS -c++ -package io.jiffy.gradle.cmake.swig.starter -features autodoc=1)
set(CMAKE_SWIG_OUTDIR ${CMAKE_CURRENT_SOURCE_DIR}/src/main/java/io/jiffy/gradle/cmake/swig/starter )
set(SWIG_OUTFILE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/src/main/cpp)
set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/src/main/swig/example.i PROPERTIES CPLUSPLUS ON)

swig_add_library(example
        LANGUAGE Java
        SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/main/swig/example.i)
  
target_include_directories(example PUBLIC
        include
        ${JNI_INCLUDE_DIRS}
        ${CMAKE_CURRENT_SOURCE_DIR}/src/main/swig
        )
add_custom_command(
            TARGET example
            POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:example> ${CMAKE_CURRENT_SOURCE_DIR}/src/main/resources/natives/linux_arm64
    )