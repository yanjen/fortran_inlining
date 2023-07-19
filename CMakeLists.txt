cmake_minimum_required(VERSION 3.18)
project(FortranInlining VERSION 0.0.1 LANGUAGES Fortran)

find_package(OpenACC REQUIRED)
set(OpenACC_FLAGS "-Minfo=all -acc=gpu")
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${OpenACC_FLAGS}")

add_library(External_LIB functions.f90)
target_compile_options(External_LIB PRIVATE ${OpenACC_Fortran_OPTIONS})
target_link_libraries(External_LIB OpenACC::OpenACC_Fortran)

add_executable(init initialization.f90)
target_compile_options(init PRIVATE ${OpenACC_Fortran_OPTIONS})
target_link_libraries(init OpenACC::OpenACC_Fortran External_LIB)

add_executable(init_inline initialization.f90)
target_compile_options(init_inline PRIVATE ${OpenACC_Fortran_OPTIONS} -Minline=lib:External_LIB.ext)
target_link_libraries(init_inline OpenACC::OpenACC_Fortran)
