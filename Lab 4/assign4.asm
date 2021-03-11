***************************************
*
* Name: Chan Kim
* ID:12501098
* Date:10/23/2019
* Lab 4
*
* Program description:Solve GCD in subroutine push the stack and pull the stack and then store in RESULT ARRAY
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
* start of data section

	ORG $B000
TABLE1	FCB	222,  37, 16,  55,  55,  1,   3, 22, $FF
TABLE2	FCB	37,  222, 240,  5, 55, 15,  22,  3, $FF

	ORG $B020
RESULT	RMB	8
RESULTPTR	RMB	2
* define any other variables that you might need here using RMB (not FCB or FDB)
* remember that your subroutine must not access any of these variables, including
* N and PRIME

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
SUB	STAA	X
	STAB	Y
WHILE2	LDAA	Y		while (y > 0);
	CMPA	#0
	BLS	ENDWHILE2
	LDAA	X		temp = x;
	STAA	TEMP
	LDAA	Y		temp2 = y;
	STAA	TEMP2
WHILE3	LDAA	TEMP		while (temp >= temp2)
	CMPA	TEMP2
	BLO	ENDWHILE3
	SUBA	TEMP2		temp = temp - temp2;
	STAA	TEMP
	BRA	WHILE3
ENDWHILE3
	LDAA	Y		x = y;
	STAA	X
	LDAA	TEMP		y = temp;
	STAA	Y
	BRA	WHILE2
ENDWHILE2
	LDAA	X		GCD = x;
	PULX			PULL THE RETURN ADDRESS MEMORY
	
	STAA	GCD		STORE X INTO GCD
	PSHA			PUSH THE GCD INTO STACK
	PSHX
	RTS			RETURN
	