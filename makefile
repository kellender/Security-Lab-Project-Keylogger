#Makefile rehauled!
#-g is for additional GDB debuging
FLAGS = -std=c99 -Wall -O1 -g
#-Dname is for defining a macro
FLAGS2 = -std=c99 -Wall -O1 -D_XOPEN_SOURCE

FLAGS3 = -std=c99 -Wall -O1 -D_XOPEN_SOURCE

all: keylog 

keylog: keylogger.c			
	gcc ${FLAGS3} keylogger.c -o keylog

run: 
	./keylog

clean: 
	rm -f keylog

#to find any memory leaks
memtest:
	valgrind --leak-check=yes ./shell


# mean and nasty test case used to test code:
#Hw 4
#ls
#ls | wc
#cd
#pwd
#
#
#

#hw 6
#echo hi > a | wc < a | echo hi > a  | echo hi >  | echo hi > sometest.txt | echo hi >> sometest.txt | echo hi >> sometest.txt 
#wc < someother.txt > sometest.txt
#echo hi > sometest.txt > someothertest.txt
#
#
#
#

#ls | wc > a | wc 


#ls > a
#wc < a
#wc >> a

#ls > b > c
#wc < a < b
#wc < a > d
#wc > e < a





#COMBINATIONS
#>				writes to a file , create one if not there				check!!!
#<				
#>>				append to a file, creates one if not there				check!!!

#> >			writes to last file!!! but empties first file  			check!!!
#< < 			reads from the last file!!! 
#< >			reads then writes
#> <			reads from last outer one and writes to inner one

#< >>
#>> <

#> >>			erases first file and append to last file!!!				check!!!
#>> >			ignores first file and writes to last file!!!				check!!!

# >> >>			appends to last file!!! leaves inner file the same!!!!!		check!!!

# ls a*
#


#exit | ls
