macro(add_OpenACC_inline_library file_name)
	message("Register OpenACC inline library ${file_name}")
	execute_process(COMMAND ${CMAKE_Fortran_COMPILER} -Mextract=lib:External_LIB.ext ${file_name})
endmacro()