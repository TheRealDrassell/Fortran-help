# how to compile this program

Since this program uses a mod, you will first need to compile the mod by using the command: gfortran -c sorting_mod.f90.

After compiling the mod, you will want to compile to main program with the compiled mod with the command : gfortran sorting_mod.o insertion.f90
