FC = gfortran

FFlags =

TARGET = TRIINF.EXE

OBJ = triangularinf.o

all: run

run: $(TARGET)
	./$(TARGET)

%.o: %.f90
	$(FC) -c $< -o $@ $(FFlags)

$(TARGET): $(OBJ)
	$(FC) $(OBJ) -o $@ $(FFlags)


.PHONY: all run clean

clean:
	rm -f *.o *.exe *~
