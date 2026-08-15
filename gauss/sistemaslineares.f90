PROGRAM Slineares
IMPLICIT NONE

INTEGER, PARAMETER :: N = 4
REAL :: A_ORIGINAL(N,N), B_ORIGINAL(N)
REAL :: A(N,N), B(N), X(N), PROVA(N)
INTEGER :: I, J

! Abre e le o arquivo de dados
OPEN(10, FILE='dados.txt')
DO I = 1,N
	READ(10,*) (A(I,J), J=1,N)
END DO
READ(10,*) (B(I), I=1,N)
CLOSE(10)

A_ORIGINAL = A
B_ORIGINAL = B

! Abre o arquivo 'resultados.txt' para escrever a saida
OPEN(20, FILE='resultados.txt', ACTION='WRITE')

WRITE(20, *) "MATRIZ LIDA: "
DO I = 1, N
	WRITE(20, *) (A(I,J), J = 1,N)
END DO
WRITE(20, *) "VETOR B: ", (B(I), I = 1, N)
WRITE(20, *)

! Chama a sub-rotina de Gauss
CALL NaiveGauss(N,A,B,X)

WRITE(20, *) "O VETOR SOLUCAO X: ", (X(I), I=1,N)
WRITE(20, *) "O VETOR B ORIGINAL: ", (B_ORIGINAL(I), I=1,N)

! Calcula a prova real usando a matriz e o vetor originais
PROVA = MATMUL(A_ORIGINAL, X)

WRITE(20, *)
WRITE(20, *) "CALCULADO: ", (PROVA(I), I=1,N)
WRITE(20, *) "ESPERADO:  ", (B_ORIGINAL(I), I=1,N)
WRITE(20, *)

PROVA = MATMUL(A_ORIGINAL, X)
WRITE(20, *) "PROVA REAL"
WRITE(20, *) "CALCULADO: ", (PROVA(I), I=1,N)
WRITE(20, *)

! Fecha o arquivo de resultados
CLOSE(20)

! Mensagem na tela apenas para avisar que terminou
PRINT *, "Execucao concluida! Abra o arquivo 'resultados.txt' para ver a saida."

END PROGRAM Slineares