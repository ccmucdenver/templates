program mpi_hello_world

  use mpi
  integer:: comm, size, ierror, rank
  character(len=32)::hostname

  call MPI_INIT(ierror)
  if (ierror.ne.0)then 
  print *,'mpi_init ierror=',ierror
  stop 1
  endif

  call mpi_hello_world_sub

  call MPI_Finalize(ieror)
  if (ierror.ne.0)then 
  print *,'mpi_finalize ierror=',ierror
  stop 1
  endif
  
end program mpi_hello_world

