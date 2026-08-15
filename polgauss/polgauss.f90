PROGRAM Test_NGE
IMPLICIT NONE

INTEGER :: I, J, N
DOUBLE PRECISION, ALLOCATABLE :: A(:,:), B(:), X(:)

OPEN(20, FILE='resultado_exercicio.txt', ACTION='WRITE')

DO N = 4, 15
    ALLOCATE(A(N,N), B(N), X(N))

    ! Preenche a matriz A e o vetor B pelas formulas
    DO I = 1, N
        DO J = 1, N
            A(I,J) = (DBLE(I) + 1.0D0)**(J - 1)
        END DO
        B(I) = ((DBLE(I) + 1.0D0)**N - 1.0D0) / DBLE(I)
    END DO

    CALL NaiveGauss(N, A, B, X)

    WRITE(20, '(A, I2)') "= RESULTADO PARA N = ", N
    WRITE(20, *) (X(I), I=1,N)
    WRITE(20, *)

    DEALLOCATE(A, B, X)
END DO

CLOSE(20)
PRINT *, "Compilado! Verifique o arquivo resultado_exercicio.txt."

END PROGRAM Test_NGE