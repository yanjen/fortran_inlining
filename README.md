# Fortran Inlining Example
While using OpenACC with GPU accelerator, the coding style affects the performance.  
When accelerating a OpenACC kernel with subroutine, it is performance critical to compile with inlining (Fortran).  
However, if the subroutine comes from an external library, the (Fortran) compiler doesn't always know how to perform inlining.

This is an example comparing the performance difference caused by the inlining problem mentioned as above, as well as how to solve the problem.
