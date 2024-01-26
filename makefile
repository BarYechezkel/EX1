# File names
MAIN = main.c
BASECLASS = basicClassification.c
ADVLOOP = advancedClassificationLoop.c
ADVREC = advancedClassificationRecursion.c
LIBLOOP = libclassloops.a
LIBREC = libclassrec.a
LIBLOOPDYN = libclassloops.so
LIBRECDYN = libclassrec.so

all: $(LIBLOOPDYN) $(LIBRECDYN) $(LIBREC) $(LIBLOOP)  mains maindloop maindrec

.PHONY: all clean loops recursives recursived loopd

# define macros that adjust to the assignment variables.
loops: $(LIBLOOP)

recursives: $(LIBREC)

loopd: $(LIBLOOPDYN)

recursived: $(LIBRECDYN)

allMainProg = mains maindloop maindrec

# Building all libraries

#Create make mains.
mains: $(MAIN:.c=.o)
	gcc -Wall -g $(MAIN:.c=.o) ./$(LIBREC) -o mains

#Create make maindloop.
maindloop: $(MAIN:.c=.o)
	gcc -Wall -g $(MAIN:.c=.o) ./$(LIBLOOPDYN) -o maindloop

#Create make maindrec.
maindrec: $(MAIN:.c=.o)
	gcc -Wall -g $(MAIN:.c=.o) ./$(LIBRECDYN) -o maindrec




$(MAIN:.c=.o): $(MAIN) NumClass.h
	gcc -c $(MAIN) -o $(MAIN:.c=.o)



#Create libclassloops.a
$(LIBLOOP): $(ADVLOOP:.c=.o) $(BASECLASS:.c=.o)
	ar rcs $(LIBLOOP) $(ADVLOOP:.c=.o) $(BASECLASS:.c=.o)  

#Create libclassrec.a
$(LIBREC):$(ADVREC:.c=.o) $(BASECLASS:.c=.o)
	ar rcs $(LIBREC) $(ADVREC:.c=.o) $(BASECLASS:.c=.o)

#Create libclassloops.so
$(LIBLOOPDYN): $(ADVLOOP:.c=.o) $(BASECLASS:.c=.o)
	gcc -shared  $(ADVLOOP:.c=.o) $(BASECLASS:.c=.o) -o $(LIBLOOPDYN)

#Create  libclassrec.so.
$(LIBRECDYN): $(ADVREC:.c=.o) $(BASECLASS:.c=.o)
	gcc -shared $(ADVREC:.c=.o) $(BASECLASS:.c=.o) -o $(LIBRECDYN)  


#////////////////////////////////////////////////////
$(BASECLASS:.c=.o): $(BASECLASS) NumClass.h
	gcc -Wall -g -fPIC -c $(BASECLASS) -o $(BASECLASS:.c=.o)

$(ADVLOOP:.c=.o): $(ADVLOOP) NumClass.h
	gcc -Wall -g -fPIC -c $(ADVLOOP) -o $(ADVLOOP:.c=.o)

$(ADVREC:.c=.o): $(ADVREC) NumClass.h
	gcc -Wall -g -fPIC -c $(ADVREC) -o $(ADVREC:.c=.o)


#remove all "main" programs an any file with prefix *.o *.a *.so
clean:
	rm -f $(allMainProg) *.o *.a *.so 