include(${CMAKE_CURRENT_SOURCE_DIR}/cmake/openacc_helper.cmake)

add_library(External_LIB functions.f90)
target_compile_options(External_LIB PUBLIC ${OpenACC_Fortran_OPTIONS})
target_link_libraries(External_LIB OpenACC::OpenACC_Fortran)

add_OpenACC_inline_library(${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_SOURCE_DIR}/external/functions.f90)
