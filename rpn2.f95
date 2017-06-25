! TRANSLATING ALGRBRAIC EXPRESSIONS TO POLISH NOTATION
!
! THE VARIABLE NAMES AND THEIR MEANINGS ARE AS FOLLOWS:
!     source      	THE INPUT STRING, IN NORMAL ALGEBRAIC FORM
!     numHierarchy  ARRAY CONTAINING THE HIERARCHY NUMBERS OF THE INPUT
!     opStack       'OPERATOR STACK': THE OPERATORS FROM THE INPUT
!     opHierarchy   ARRAY CONTAINING THE HIERARCHY NUMBERS OF THE OPERATORS
!     polish	    THE OUTPUT STRING, IN POLISH NOTATION
!
!     L          DO INDEX USED IN INITIALIZING
!     M          DO INDEX USED IN SETTING UP SHIER ARRAY
!     I          POINTER TO INDEX STRING (SOURCE AND SHIER)
!     J          POINTER TO OPERATOR STACK (OPSTCK AND OHIER)
!     K          POINTER TO OUTPUT STRING (POLISH)
!
!     THE OTHER VARIABLES ARE ACTUALLY CONSTANTS, AND ARE
!     DEFINED IN THE DATA STATEMENT.
!
!
program Rpn
implicit none
integer, dimension(40) :: numHierarchy, opHierarchy 
character, dimension(40) :: polish, opStack, source
integer :: L, M, I, J, K
character, parameter :: space = ' ', leftParen = '(', rightParen = ')', plus = '+', minus = '-', asterisk = '*', slash = '/' 

do while(source(1)/='q')
!Initializing the arrays.
	do L = 1, 40, 1
		numHierarchy = 0
		opHierarchy = 0
		opStack = space
		polish = space
		source = space      
	end do


!Read the source string from user input
		write (*,*) 'Enter an equation to be translated to reverse polish notation'
		read (*, 30) source
	30  format (40A)

!Determining the number hierarchy
	M = 1
	do while(M <= 40)
		if(source(M) == space .AND. M == 1)then
			write(*,*) 'Error: input can not be blank'
			stop
		else if(source(M) == '' .OR. source(M) == space)then
			exit
		else if(source(M) == leftParen)then
			numHierarchy(M) = 1
			M = M + 1
		else if(source(M) == rightParen)then
			numHierarchy(M) = 2
			M = M + 1
		else if(source(M) == plus .OR. source(M) == minus)then
			numHierarchy(M) = 3
			M = M + 1
		else if(source(M) == asterisk .OR. source(M) == slash)then
			numHierarchy(m) = 4
			M = M + 1
		else
			M = M + 1
		end if
	end do

!Initializing the number and operator hierarchies.
	numHierarchy(M) = 0
	opHierarchy(1) = -1

!initializing the pointers to be used in the computation
	I=1
	J=2
	K=1

	do while(I/=M)
		if(numHierarchy(I) == 0)then
			polish(K) = source(I)
			I = I + 1
			K = K + 1
			do while(opHierarchy(J-1) >= numHierarchy(I))
				polish(K) = opStack(J-1)
				K = K + 1
				J = J - 1
			end do
		else if(numHierarchy(I) == 2)then
				I = I + 1
				J = J - 1
			do while(opHierarchy(J-1) >= numHierarchy(I))
				polish(K) = opStack(J-1)
				K = K + 1
				J = J - 1
			end do
		else
			opStack(J) = source(I)
			opHierarchy(J) = numHierarchy(I)
			I = I + 1
			J = J + 1
		end if
	end do
	
	if(source(1)/='q')then
		WRITE (*,130) "INPUT: ", SOURCE, "RPN:   ", POLISH
		130  FORMAT (1H ,A7, 40A1/1H , A7, 40A1)
	end if	
	
end do
end program Rpn
