PROGRAM initialization
  USE functions, ONLY: assign_value

  IMPLICIT NONE
  INTEGER :: i, n = 10000
  REAL, ALLOCATABLE :: a(:), b(:), c(:)
  REAL :: t_start, t_end
  ALLOCATE (a(n))
  ALLOCATE (b(n))
  ALLOCATE (c(n))

  !$ACC DATA COPYIN(a,b) COPYOUT(c)

  CALL CPU_TIME(t_start)
  !$ACC PARALLEL
  !$ACC LOOP
  DO i = 1, n
    c(i) = 2*a(i)*a(i) + b(i) + 3
  END DO
  !$ACC END PARALLEL
  CALL CPU_TIME(t_end)

  PRINT *, "time[s] = ", t_end - t_start

  CALL CPU_TIME(t_start)
  !$ACC PARALLEL
  !$ACC LOOP
  DO i = 1, n
    CALL assign_value(a(i), b(i), c(i))
  END DO
  !$ACC END PARALLEL
  CALL CPU_TIME(t_end)

  PRINT *, "time[s] = ", t_end - t_start

  !$ACC END DATA
END PROGRAM
