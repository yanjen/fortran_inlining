cmake_minimum_required(VERSION 3.18)
project(OpenACCInlining VERSION 0.0.1 LANGUAGES Fortran)

if(CMAKE_Fortran_COMPILER_ID STREQUAL "NVHPC")
	message("Using Nvidia compiler!")
else()
	message(FATAL_ERROR "Error: please compile with an nvidia compiler\n"
						"Try: cmake -DCMAKE_Fortran_COMPILER=nvfortran ..")
	break()
endif()

find_package(OpenACC REQUIRED)
set(OpenACC_FLAGS "-Minfo=all -acc=gpu")
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${OpenACC_FLAGS}")

add_subdirectory(external)

set(Fortran_MODULE_DIRECTORY "${CMAKE_BINARY_DIR}/external")

add_executable(init initialization.f90)
target_compile_options(init PRIVATE ${OpenACC_Fortran_OPTIONS})
target_link_libraries(init OpenACC::OpenACC_Fortran External_LIB)
set_target_properties(init
  PROPERTIES
    Fortran_MODULE_DIRECTORY "${Fortran_MODULE_DIRECTORY}"
)

add_executable(init_inline initialization.f90)
target_compile_options(init_inline PRIVATE ${OpenACC_Fortran_OPTIONS} -Minline=lib:external/External_LIB.ext)
target_link_libraries(init_inline OpenACC::OpenACC_Fortran External_LIB)
set_target_properties(init_inline
  PROPERTIES
    Fortran_MODULE_DIRECTORY "${Fortran_MODULE_DIRECTORY}"
)
