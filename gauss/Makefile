FC = gfortran

FFLAGS = 

TARGET = programa.exe

OBJ = triangularsupnxn.o naivegauss.o sistemaslineares.o

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