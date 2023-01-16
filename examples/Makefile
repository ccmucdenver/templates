EXECS=mpi_hello_world.exe hello_world_fortran.exe mpi_hello_world_fortran.exe mpi_spawn_fortran.exe
MPICC?=mpicc
FC=mpif90
BENCH=osu-micro-benchmarks-5.8

all: ${EXECS} mpi

mpi_hello_world.exe: mpi_hello_world.c Makefile
	${MPICC} -o mpi_hello_world.exe mpi_hello_world.c

hello_world_fortran.exe: hello_world_fortran.f90
	$(FC) -o hello_world_fortran.exe hello_world_fortran.f90

#mpi_hello_world_fortran.exe: mpi_hello_world_fortran.f90
##	$(FC) -o mpi_hello_world_fortran.exe mpi_hello_world_fortran.f90

mpi_hello_world_fortran_sub.o: mpi_hello_world_fortran_sub.f90
	$(FC) -c -o mpi_hello_world_fortran_sub.o mpi_hello_world_fortran_sub.f90


mpi_hello_world_fortran.exe: mpi_hello_world_fortran.f90 mpi_hello_world_fortran_sub.o
	$(FC) -o mpi_hello_world_fortran.exe mpi_hello_world_fortran.f90 mpi_hello_world_fortran_sub.o


mpi_spawn_fortran.exe: mpi_spawn_fortran.f90 mpi_hello_world_fortran_sub.o
	$(FC) -o mpi_spawn_fortran.exe mpi_spawn_fortran.f90 mpi_hello_world_fortran_sub.o

mpi:
	wget --no-check-certificate https://mvapich.cse.ohio-state.edu/download/mvapich/$(BENCH).tgz	
	tar xvfz $(BENCH).tgz
	cd $(BENCH); ./configure CC=`which mpicc` CXX=`which mpicxx` 
	cd $(BENCH); make
	ln -s $(BENCH)/mpi mpi

clean:
	rm -rf ${EXECS} $(BENCH) $(BENCH).tgz mpi
