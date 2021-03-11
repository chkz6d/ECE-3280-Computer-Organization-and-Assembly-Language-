**************************************
*
* Name: Chan Kim
* ID: 12501098
* Date: 10/4/2019
* Lab3
*
* Program description:
*
*
* Pseudocode:
*int main()
*{
*    int NUM1 = 64;
*    int NUM2 = 36;
*    int x = NUM1;
*    int y = NUM2;
*    int GCD;
*    int temp;
*    int temp2;
*    
*    while (y > 0)
*    {
*        temp = x;
*        temp2 = y;
*        
*        while (temp >= temp2)
*        {
*            temp = temp - temp2;
*        }
*        x = y;
*        y = temp;
*    }
*    GCD = x;
*    printf("%d", GCD);
*
*    return 0;
*}
*
*
**************************************

* start of data section

	ORG $B000
NUM1	FCB	248		NUM1 = 248 (CONST)
NUM2	FCB	186		NUM2 = 186 (CONST)

	ORG $B010
GCD	RMB	1		
X	RMB	1
Y	RMB	1	
TEMP	RMB	1		
TEMP2	RMB	1
	
	ORG $C000
	LDAA	NUM1		x = num1;
	STAA	X
	LDAA	NUM2		y = num2;
	STAA	Y
WHILE	LDAA	Y		while (y > 0);
	CMPA	#0
	BLS	ENDWHILE
	LDAA	X		temp = x;
	STAA	TEMP
	LDAA	Y		temp2 = y;
	STAA	TEMP2
WHILE2	LDAA	TEMP		while (temp >= temp2)
	CMPA	TEMP2
	BLO	ENDWHILE2
	SUBA	TEMP2		temp = temp - temp2;
	STAA	TEMP
	BRA	WHILE2
ENDWHILE2
	LDAA	Y		x = y;
	STAA	X
	LDAA	TEMP		y = temp;
	STAA	Y
	BRA	WHILE
ENDWHILE
	LDAA	X		GCD = x;
	STAA	GCD
DONE	BRA	DONE