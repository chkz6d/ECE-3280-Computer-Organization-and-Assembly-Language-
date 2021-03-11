***************************************
*
* Name: Chan Kim
* ID:12501098
* Date:11/06/2019
* Lab 5
*
* Program description:Solve GCD in subroutine push the stack and pull the stack and then store in RESULT ARRAY, **USING DYNAMIC LOCAL VARIABLES
*
*
* Pseudocode of Main Program:
*
*
*int main()
*{
* 	TABLE1[];
*	TABLE2[];   
*	RESULT();	
*	*resultptr = &result();
*     *X = TABLE1[];
*     *Y = TABLE2[];
*     WHILE (*X != $FF){
*     SUB();
*	RESULT = STACK();
*	X++;
*	Y++;
*	}
* return 0;
*}    
*   
* Pseudocode of Subroutine:
*  void sub();
*     {
*       int x = sub1;
*	  int GCD;
*       int temp;
*       int temp2;
*       int y = sub2; 
*       while (y > 0)
*       {
*         temp = x;
*         temp2 = y;
*        
*         while (temp >= temp2)
*        {
*            temp = temp - temp2;
*        }
*        x = y;
*        y = temp;
*       }
*    GCD = x;
*    STACK()
*	}
*    return 0;
*}
***************************************
	ORG $B000
TABLE1	FCB	222,  37, 16,  55,  55,  1,   3, 22, $FF
TABLE2	FCB	37,  222, 240,  5, 55, 15,  22,  3, $FF

	ORG $B020
RESULT	RMB	8
RESULTPTR	RMB	2

	ORG $C000
	LDS	#$01FF		initialize stack pointer
* start of your program
	LDX	#RESULT		*RESULTPTR = &RESULT()
	STX	RESULTPTR
	LDX	#TABLE1		X = TABLE1[0]
	LDY	#TABLE2		Y = TABLE2[0]
WHILE	LDAA	0,X			WHILE (*X != $FF)
	CMPA	#$FF
	BEQ	ENDWHILE
	LDAB	0,Y			
	PSHX				PUSH STACK
	JSR	SUB			SUB();
	PULA				PULL THE ADDRESS MOMEORY 
	LDX	RESULTPTR		LOAD RESULTPOINTER
	STAA	0,X			STORE IT INTO RESULT
	INX				INCREAMENT RESULTPOINTER
	STX 	RESULTPTR
	PULX				PULL THE ADDRESS MEMORY
	INX				INCREAMENT TABLE1
	INY				INCREAMENT TABLE2
	BRA	WHILE
ENDWHILE
DONE	BRA	DONE


* define any other variables that you might need here using RMB (not FCB or FDB)
* remember that your main program must not access any of these variables, including


	ORG $D000
GCD	RMB	1		int GCD
TEMP	RMB	1		INT TEMP
TEMP2	RMB	1		INT TEMP2
X	RMB	1		INT X
Y	RMB	1		INT Y
* start of your subroutine 
SUB	DES	OPEN HOLE FOR GCD
	DES	OPEN HOLE FOR TEMP
	DES	OPEN HOLE FOR TEMP2
	DES	OPEN HOLE FOR X
	DES	OPEN HOLE FOR Y
	TSX	X points to the dynamic local variables, (0 => X = GCD), (1 => X = TEMP), (2 => X = TEMP2), (3 => X = X), (4 => X = Y)
	STAA	3,X	
	STAB	4,X
WHILE2	LDAA	4,X		while (y > 0);
	CMPA	#0
	BLS	ENDWHILE2
	LDAA	3,X		temp = x;
	STAA	1,X
	LDAA	4,X		temp2 = y;
	STAA	2,X
WHILE3	LDAA	1,X		while (temp >= temp2)
	CMPA	2,X
	BLO	ENDWHILE3
	SUBA	2,X		temp = temp - temp2;
	STAA	1,X
	BRA	WHILE3
ENDWHILE3
	LDAA	4,X		x = y;
	STAA	3,X
	LDAA	1,X		y = temp;
	STAA	4,X
	BRA	WHILE2
ENDWHILE2
	LDAA	3,X	GCD = X
	STAA	0,X
	INS	CLOSE THE HOLE FOR GCD
	INS	CLOSE THE HOLE FOR TEMP
	INS	CLOSE THE HOLE FOR TEMP2
	INS	CLOSE THE HOLE FOR X
	INS	CLOSE THE HOLE FOR Y
	PULX	PULL THE RETURN ADDRESS
	PSHA	PUSH A REGISTER
	PSHX	PUSH THE RETURN ADDRESS
	RTS	RETURN