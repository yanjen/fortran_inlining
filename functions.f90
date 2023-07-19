MODULE functions
  IMPLICIT NONE
CONTAINS
  SUBROUTINE assign_value(a, b, c)
    !$ACC ROUTINE SEQ
    REAL, INTENT(in) :: a, b
    REAL, INTENT(out) :: c
    c = 2*a*a + b + 3
  END SUBROUTINE
END MODULE
