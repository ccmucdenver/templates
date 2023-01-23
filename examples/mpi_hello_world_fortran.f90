program mpi_hello_world
  use mpi
  integer:: comm, size, ierror, rank
  character(len=32)::hostname

  call MPI_INIT(ierror)
  print *,'mpi_init ierror=',ierror

  comm = MPI_COMM_WORLD

  call MPI_COMM_SIZE(comm,size,ierror)
  print *,'mpi_comm_size comm=', comm, ' size=',size,' ierror=',ierror

  call MPI_COMM_RANK(comm,rank,ierror)
  print *,'mpi_comm_rank comm=', comm, ' rank=',rank,' ierror=',ierror

  call hostnm(hostname,ierror)
  print *,'hostnm hostname=',hostname,' ierror=',ierror

  call MPI_Finalize(ieror)
  print *,'mpi_finalize ierror=',ierror
  
end

