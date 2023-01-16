subroutine mpi_hello_world_sub

  use mpi
  integer:: comm, size, ierror, rank
  character(len=32)::hostname

  comm = MPI_COMM_WORLD

  call MPI_COMM_SIZE(comm,size,ierror)
  if (ierror.ne.0)then 
  print *,'mpi_comm_size comm=', comm, ' size=',size,' ierror=',ierror
  stop 1
  endif

  call MPI_COMM_RANK(comm,rank,ierror)
  if (ierror.ne.0)then 
  print *,'mpi_comm_rank comm=', comm, ' rank=',rank,' ierror=',ierror
  stop 1
  endif

  call hostnm(hostname,ierror)
  if (ierror.ne.0)then 
  print *,'hostnm hostname=',hostname,' ierror=',ierror
  stop 1
  endif

  print *,'rank ',rank,' of ',size, ' at ',hostname 

end subroutine  mpi_hello_world_sub
