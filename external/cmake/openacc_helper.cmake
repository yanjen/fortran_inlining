macro(add_OpenACC_inline_library path_name file_name)
	message("Register OpenACC inline library ${file_name}")
	execute_process(COMMAND ${CMAKE_Fortran_COMPILER} -Mextract=lib:${path_name}/External_LIB.ext ${file_name})
endmacro()