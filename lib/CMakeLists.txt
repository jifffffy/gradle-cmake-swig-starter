find_package(SWIG REQUIRED)
find_package(JNI REQUIRED)

include(UseSWIG)

set(CMAKE_SWIG_FLAGS -c++ -package io.jiffy.gradle.cmake.swig.starter -module ${CMAKE_PROJECT_NAME} -features autodoc=1)
set( CMAKE_SWIG_OUTDIR ${CMAKE_CURRENT_SOURCE_DIR}/src/main/java/io/jiffy/gradle/cmake/swig/starter )
set_source_files_properties(${CMAKE_CURRENT_SOURCE_DIR}/src/main/swig/api.i PROPERTIES CPLUSPLUS ON)

swig_add_library(lib
        LANGUAGE Java
        SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/main/swig/lib.i)
  
target_include_directories(lib PUBLIC
        include
        ${JNI_INCLUDE_DIRS}
        ${CMAKE_CURRENT_SOURCE_DIR}/src/main/swig
        )
add_custom_command(
            TARGET lib
            POST_BUILD
            COMMAND ${CMAKE_COMMAND} -E copy_if_different $<TARGET_FILE:lib> ${CMAKE_CURRENT_SOURCE_DIR}/src/main/resources/natives/linux_arm64
    )