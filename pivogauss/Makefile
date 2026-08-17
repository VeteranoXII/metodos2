FC = gfortran

FFLAGS = 

TARGET = programa.exe

OBJ = modgauss.o solve.o main.o

all: run

run: $(TARGET)
	./$(TARGET)

%.o: %.f90
	$(FC) -c $< -o $@ $(FFLAGS)

$(TARGET): $(OBJ)
	$(FC) $(OBJ) -o $@ $(FFLAGS)

.PHONY: all run clean

clean:
	rm -f *.o *.exe *~
