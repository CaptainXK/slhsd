.PONY:clean

LIB_FLAG := -levent

SRC := $(wildcard *.c)
OBJ := $(patsubst %.c, %.o, $(SRC))

test.app:$(OBJ)
	gcc $^ -o $@ $(LIB_FLAG) -g

%.o:%.c
	gcc -c $< -o $@ -g 

test:test.app
	$(EXEC) ./test.app

clean:
	rm *.o *.app
