FC = gfortran

FFLAGS = 

TARGET = programa.exe

OBJ = modgauss.o solve.o main.o

%.o: %.f90
	$(FC) -c $< -o $@ $(FFLAGS)

$(TARGET): $(OBJ)
	$(FC) $(OBJ) -o $@ $(FFLAGS)
.PHONY: all

clean:
	rm -f *.o *.exe *~
