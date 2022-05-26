#With this setup, you can just have .c and .h files and compile it all without an IDE at all. 
#This file can be called makefile or Makefile and you can enter commands for make

#Steps to getting the code to compile, link and load to Arduino
#1.I downloaded WinAVR from the MSOE Prust Website
#2.I tried to use both the supplied makefile from AVR and the MSOE one I found in the includes and could not get either to work. Failed at EEprom build
#3.I followed the Youtube video https://www.youtube.com/watch?v=9Zyp4sdSUNM&t=420s How to Blink an LED in C by Jacob Sorber. 
#Note I had to run slightly different commands because just trying "make" didnt work

#The following commands can be used
#To compile simply open a terminal in VS code at the project level or you could open a cmd promt at the project level then type commands
#make all
#To program to the board type make install.blink
#To clean the build type make clean blink. This isnt working at the moment. Just delete files manually.

#compiler options
CC=avr-gcc
CFLAGS= -Os -DF_CPU=16000000UL -mmcu=atmega328p

#compiling
#will need to figure out how to add more files to this
all: blink.out

#Select USB port
USBPORT:= COM3

%.out: %.CC
	$(CC) $(CFLAGS) $< -o $@

%.hex: %.out
	avr-objcopy -O ihex -R .eeprom $< $@

#upload to board
install.%: %.hex
	avrdude -F -V -c arduino -p ATMEGA328P -P ${USBPORT} -b 115200 -U flash:w:$<

clean:
	rm -f *.hex *.out
