program mpi_spawn_fortran

  use mpi
  integer, parameter:: n=1
  CHARACTER(len=40) COMMAND, ARGV(n)
  INTEGER INFO, MAXPROCS, ROOT, COMM, INTERCOMM, &
          ARRAY_OF_ERRCODES(n),IERROR

  call MPI_INIT(ierror)
  if (ierror.ne.0)then 
  print *,'mpi_init ierror=',ierror
  stop 1
  endif

  call mpi_hello_world_sub

  command="mpi_hello_world_fortran.exe"
  do i=1,n
    argv(i)=" "
  enddo

  maxprocs = n 
  info=0
  root=0
  comm = MPI_COMM_WORLD
  call MPI_COMM_SPAWN(COMMAND, ARGV, MAXPROCS, INFO, ROOT, COMM, &
    INTERCOMM, ARRAY_OF_ERRCODES, IERROR)

  call MPI_Finalize(ieror)
  if (ierror.ne.0)then 
  print *,'mpi_finalize ierror=',ierror
  stop 1
  endif
  
end program mpi_spawn_fortran

