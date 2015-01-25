ldi R18 00000000
ldi R19 00000000
ldi R20 00000000
ldi R29 00000000
ldi R28 00000101
ldi R31 00000000
ldi R30 00000110
ld R17 Y # tic
add R18 R17 # add a second if tic
mov R16 R18 # Test if 60 seconds have elapsed
ldi R22 00111100
sub R16 R22
tst R16
breq 00001101
ldi R22 00000001
add R19 R22
ldi R18 00000000
mov R16 R19 # Test if 60 minutes have elapsed
ldi R22 00111100
sub R19 R22
tst R19
breq 00000111
ldi R22 00000001
add R20 R22
ldi R19 00000000
mov R16 R19 # Test if 24 hours have elapsed
ldi R22 00011000
sub R16 R22
tst R16
breq 00000001
ldi R16 00000000
breq 11100001 # go back to start (-30)

	ld0 R16
	ld1 0000000000000010 # seconds
	ld0 R17	
	ld1 0000000000000011 # min
	ld0 R18
	ld1 0000000000000100 # hour
	ld0 R19
	ld1 0000000000000101 # tic
	add R16 R19 # R20 is current seconds
	cpi R16 00111100 # R20, 60
	brmi DEBUT # branch if R20 - 60 < 0
	inc R17
	cpi R17 00111100 # R17, 60
	brmi DEBUT
	inc R18
	rjmp DEBUT
