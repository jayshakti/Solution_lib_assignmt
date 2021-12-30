TARGET: exe

exe: evaluation.o libdll.a
	gcc evaluation.o -o exe -L . -ldll
evaluation.o: evaluation.c 
	gcc -c -I . evaluation.c -o evaluation.o
diff.o: diff.c 
	gcc -c -I . diff.c -o diff.o
libdll.a: dll.o diff.o
	ar rs libdll.a dll.o diff.o
dll.o: dll.c
	gcc -c -I . dll.c -o dll.o
clean:
	rm *.o
	rm libdll.a
	rm exe

