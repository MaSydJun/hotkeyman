# ##############################################################################
# hotkeyman -- makefile
# ##############################################################################

TARGET  := hotkeyman
EXT     := exe
SRC     := main.c hotkeyman.c hklist.c
OBJ     := $(SRC:%.c=%.o)
CFLAGS  := 
LDFLAGS := 

RM      := rm -f

# default target is debug
default: debug

# debug
debug: CFLAGS := -g -D DEBUG
debug: build

# release
release: LDFLAGS := -mwindows
release: build

# build executable
build: $(OBJ)
	$(CC) -o $(TARGET).$(EXT) $(OBJ) $(LDFLAGS)

# build objects
%.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	$(RM) $(TARGET).$(EXT) $(OBJ)

.PHONY: clean
