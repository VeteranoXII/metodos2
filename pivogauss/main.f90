PROGRAM MAIN
    IMPLICIT NONE

    INTEGER :: N, I, IOS
    REAL, ALLOCATABLE :: A(:,:), B(:), X(:), S(:)
    INTEGER, ALLOCATABLE :: L(:)

    ! ABRINDO O ARQUIVO DE TEXTO
    OPEN(UNIT=10, FILE='dados.txt', STATUS='OLD', IOSTAT=IOS, ACTION='READ')
    IF (IOS /= 0) THEN
        PRINT *, "ERRO AO ABRIR O ARQUIVO 'SISTEMA.TXT'."
        STOP
    END IF

    READ(10, *) N

    ALLOCATE(A(N,N), B(N), X(N), S(N), L(N))

    DO I = 1, N
        READ(10, *) A(I, 1:N)
    END DO

    READ(10, *) B(1:N)
    CLOSE(10)

    PRINT *, "========================================="
    PRINT *, "ARQUIVO LIDO COM SUCESSO! MATRIZ: ", N, "X", N
    PRINT *, "RESOLUCAO DE SISTEMA LINEAR (GAUSS PIVOT)"
    PRINT *, "========================================="
    
    CALL MODGAUSS(N, A, L, S)
    CALL SOLVE(N, A, L, B, X)

    PRINT *, "VETOR SOLUCAO:"
    DO I = 1, N
        PRINT '(A, I1, A, F8.4)', "X", I, " = ", X(I)
    END DO
    PRINT *, "========================================="

    DEALLOCATE(A, B, X, S, L)

END PROGRAM MAIN_POLGAUSS

