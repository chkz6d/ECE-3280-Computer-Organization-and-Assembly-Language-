***************************************
* Name: Joe Satriani
* ID:   1234567
* Date: 09/25/19
* Lab 2
*
* Program description:
*
* This program will divide DIVIDEND by DIVISOR
* by subtracting DIVISOR from DIVIDEND the correct
* number of times. If the DIVISOR is zero, 
* QUOTIENT and REMAINDER will be both set to $FF
* 
* Pseudocode:
* 	
*							
* IF (DIVISOR != 0){
*         QUOTIENT = 0;
*         REMAINDER = DIVIDEND;        		
*         WHILE (REMAINDER >= DIVISOR){           					
*              REMAINDER = REMAINDER - DIVISOR;
*              QUOTIENT++;                                  
*         }                           			              		
*  } ELSE {                                       				
*         QUOTIENT = $FF;                     			
*         REMAINDER = $FF;                   			
*  }   
*							
***************************************
* start of data section

	ORG $B000
DIVIDEND	FCB     255         The dividend
DIVISOR	FCB       6         The divisor.

	ORG $B010
QUOTIENT	RMB       1         The quotient.
REMAINDER	RMB       1         The remainder.
* define any other variables that you might need here
DIV_BY_ZERO	EQU      $FF

	ORG $C000
* start of your program	
IF      	TST	DIVISOR     	IF (DIVISOR != 0) {
        	BEQ	ELSE      	
THEN    	CLR	QUOTIENT            QUOTIENT = 0;
	LDAA	DIVIDEND	
	STAA	REMAINDER	   REMAINDER = DIVIDEND;
WHILE	LDAA	REMAINDER
	CMPA	DIVISOR     	   WHILE (REMAINDER >= DIVISOR) {
     	BLO	ENDWHL	  	
        	SUBA	DIVISOR                 	REMAINDER = REMAINDER - DIVISOR;
	STAA	REMAINDER
        	INC	QUOTIENT      	    	QUOTIENT++;	
  	BRA	WHILE
ENDWHL	BRA	ENDIF    	   }
ELSE    	LDAA	#DIV_BY_ZERO      	} ELSE {
        	STAA	QUOTIENT      	    QUOTIENT = $FF;
	STAA	REMAINDER    	    REMAINDER = $FF; }
ENDIF				
DONE    	BRA	DONE      	For the simulator to know you're done.
        	END                     End of program!!!!!


