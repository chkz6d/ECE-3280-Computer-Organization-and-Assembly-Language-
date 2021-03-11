*************************************
*
* Name: Chan Kim
* ID: 12501098
* Date: 9/25/2019
* Lab2
*
* Program description: Divide one dividend by another divisor by subtracting the divisor from the dividend the correct number of times.
*
* Pseudocode:
*
*	#include <stdio.h>
*	
*	main()
*	{
*		unsigned int dividend = 255;
*		unsigned int divisor = 6;
*
*		unsigned int quotient = 0;
*		unsigned int remainder;
*		
*       if (divisor == 0)
*        {
*            quotient = 0xFF;
*            remainder = 0xFF;
*            
*        }
*	else
*	{
*		while (dividend >= divisor)
*	{
*		dividend = dividend - divisor;
*		quotient++;
*	}
*	   remainder = dividend;
*	}
*		printf("Quotient: %d Remainder: %d \n",quotient,remainder);
*	}
*
*
*
*
*
*
**************************************

* start of data section

	ORG $B000
DIVIDEND	FCB     255         The dividend   //int dividend = 255;
DIVISOR	FCB     6         The divisor	   //int divisor = 6;

	ORG $B010
QUOTIENT	RMB       1         The quotient.
REMAINDER	RMB       1         The remainder.
* define any other variables that you might need here using RMB (not FCB or FDB)


	ORG $C000
* start of your program
	LDAA	QUOTIENT	Load quotient
	CLR	QUOTIENT	quotient = 0;
IF	LDAA 	DIVISOR	if(divisor == 0)
	CMPA	#0	
	BNE	ELSE		
THEN	LDAA	#$FF		quotient = 0xFF
	STAA	QUOTIENT
	LDAA	#$FF		remainder = 0xFF
	STAA	REMAINDER
	BRA	ENDIF
ELSE			
WHILE	LDAA	DIVIDEND	while (dividend >= divisor)
	CMPA	DIVISOR	
	BLO	ENDWHILE
	SUBA	DIVISOR	dividend -= divisor;
	STAA	DIVIDEND
	INC	QUOTIENT	quotient++;
	BRA	WHILE
ENDWHILE	
ENDIF	LDAA	DIVIDEND	remainder = dividend;
	STAA	REMAINDER		
DONE	BRA	DONE
