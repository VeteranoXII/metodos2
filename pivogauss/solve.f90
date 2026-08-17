SUBROUTINE SOLVE(N, A, L, B, X)
    IMPLICIT NONE

    INTEGER, INTENT(IN) :: N
    REAL, DIMENSION(N,N), INTENT(IN) :: A
    INTEGER, DIMENSION(N), INTENT(IN) :: L
    REAL, DIMENSION(N), INTENT(INOUT) :: B
    REAL, DIMENSION(N), INTENT(OUT) :: X
    
    INTEGER :: I, J, K
    REAL :: SUM

    DO K = 1, N - 1
        DO I = K + 1, N
            B(L(I)) = B(L(I)) - A(L(I), K) * B(L(K))
        END DO
    END DO

    X(N) = B(L(N)) / A(L(N), N)
    
    DO I = N - 1, 1, -1
        SUM = B(L(I))
        DO J = I + 1, N
            SUM = SUM - A(L(I), J) * X(J)
        END DO
        X(I) = SUM / A(L(I), I)
    END DO
END SUBROUTINE SOLVE

