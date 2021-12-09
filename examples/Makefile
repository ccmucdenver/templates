EXECS=mpi_hello_world.exe hello_world_fortran.exe
MPICC?=mpicc
FC?=gfortran

all: ${EXECS}

mpi_hello_world.exe: mpi_hello_world.c Makefile
	${MPICC} -o mpi_hello_world.exe mpi_hello_world.c

hello_world_fortran.exe: hello_world_fortran.f90
	$(FC) -o hello_world_fortran.exe hello_world_fortran.f90

clean:
	rm -f ${EXECS}
