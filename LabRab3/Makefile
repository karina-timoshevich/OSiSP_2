CC = gcc
TARGET = invert_filter
PREF_SRC = ./src/
PREF_OBJ = ./obj/
SRC = $(PREF_SRC)main.c $(PREF_SRC)invert.c
OBJ = $(patsubst $(PREF_SRC)%.c, $(PREF_OBJ)%.o, $(SRC))

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC)  $(OBJ) -o $(TARGET)

$(PREF_OBJ)%.o: $(PREF_SRC)%.c
	@mkdir -p $(PREF_OBJ)  
	$(CC) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJ)

test: $(TARGET)
	echo "hello" | ./$(TARGET)
	echo "reverse" | ./$(TARGET) > output.txt
	cat output.txt



