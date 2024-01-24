# File names
MAIN = main.c
BASECLASS = basicClassification.c
ADVLOOP = advancedClassificationLoop.c
ADVREC = advancedClassificationRecursion.c
LIBLOOP = libclassloops.a
LIBREC = libclassrec.a
LIBLOOPDYN = libclassloops.so
LIBRECDYN = libclassrec.so

all: libclassloops.so libclassrec.so libclassrec.a libclassloops.a mains maindloop maindrec

.PHONY: all clean 

# define macros that adjust to the assignment variables.
loops: $(LIBLOOP)

recursives: $(LIBREC)

loopd: $(LIBLOOPDYN)

recursived: $(LIBRECDYN)

allMainProg = mains maindloop maindrec

# Building all libraries

#Create make mains.
mains: $(MAIN:.c=.o) $(LIBREC)
	gcc -Wall -g $(MAIN:.c=.o) ./$(LIBREC) -lm -o mains

#Create make maindloop.
maindloop: $(MAIN:.c=.o) $(LIBLOOPDYN)
	gcc -Wall -g $(MAIN:.c=.o) ./$(LIBLOOPDYN) -lm -o maindloop

#Create make maindrec.
maindrec:$(MAIN:.c=.o) $(LIBRECDYN)
	gcc -Wall -g $(MAIN:.c=.o) ./$(LIBRECDYN) -lm -o maindrec

#Create libclassloops.a
$(LIBLOOP): $(ADVLOOP:.c=.o) $(BASECLASS:.c=.o)
	ar rcs $(LIBLOOP) $(ADVLOOP:.c=.o) $(BASECLASS:.c=.o)  

#Create libclassrec.a
$(LIBREC):$(ADVREC:.c=.o) $(BASECLASS:.c=.o)
	ar rcs $(LIBREC) $(ADVREC:.c=.o) $(BASECLASS:.c=.o)

#Create libclassloops.so
$(LIBLOOPDYN): $(ADVLOOP:.c=.o) $(BASECLASS:.c=.o)
	gcc -shared -o $(LIBLOOPDYN) $(ADVLOOP:.c=.o) $(BASECLASS:.c=.o)  

#Create  libclassrec.so.
$(LIBRECDYN): $(ADVREC:.c=.o) $(BASECLASS:.c=.o)
	gcc -shared -o $(LIBRECDYN) $(ADVREC:.c=.o) $(BASECLASS:.c=.o)  


# Build all programs and libraries. 
all: mains maindloop maindrec loops recursives recursived loopd

#remove all "main" programs an any file with prefix *.o *.a *.so
clean:
	rm -f $(allMainProg) *.o *.a *.so 