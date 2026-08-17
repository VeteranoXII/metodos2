SUBROUTINE ModGauss(N, A, L, S) 
IMPLICIT NONE

INTEGER, INTENT(IN) :: N
REAL, DIMENSION(N,N), INTENT(INOUT) :: A
INTEGER, DIMENSION(N), INTENT(OUT) :: L
REAL, DIMENSION(N), INTENT(INOUT) :: S    
INTEGER :: I, J, K, PIVO_IDX, TEMP_L
REAL :: R, RMAX, SMAX, XMULT

DO I = 1, N
        L(I) = I
        SMAX = 0.0
        DO J = 1, N
            IF (ABS(A(I,J)) > SMAX) THEN
                SMAX = ABS(A(I,J))
            END IF
        END DO
        S(I) = SMAX
    END DO

DO K = 1, N - 1

        RMAX = 0.0
        PIVO_IDX = K
        
        DO I = K, N
            R = ABS(A(L(I), K) / S(L(I)))
            IF (R > RMAX) THEN
                RMAX = R
                PIVO_IDX = I
            END IF
        END DO

        TEMP_L = L(K)
        L(K) = L(PIVO_IDX)
        L(PIVO_IDX) = TEMP_L

        DO I = K + 1, N
            XMULT = A(L(I), K) / A(L(K), K)
            A(L(I), K) = XMULT
            DO J = K + 1, N
                A(L(I), J) = A(L(I), J) - (XMULT * A(L(K), J))
            END DO
        END DO
    END DO

END SUBROUTINE ModGauss

