MODULE functions
  IMPLICIT NONE
CONTAINS
  SUBROUTINE assign_value(a, b, c)
    !$ACC ROUTINE SEQ
    REAL, INTENT(in) :: a, b
    REAL, INTENT(out) :: c
    c = 2*a*a + b + 3
  END SUBROUTINE

  SUBROUTINE pred(x) RESULT(y)
    INTEGER, INTENT(in) :: x
    INTEGER :: y
    y = 0
    IF (x == 0) THEN
      y = 0
    ELSE
      y = x - 1
    END IF
    RETURN
  END SUBROUTINE
END MODULE
