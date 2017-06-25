program triangle
real :: a, b, c, theta
write (*,*) 'Enter the length of the hypotenuse C: '
read (*,*) c
write (*,*) 'Enter the angle theta in degrees: '
read (*,*) theta
!a = cos(theta)*c
!b = sin(theta)*c
a=sin(30.0)
a = a*5.0
write (*,*) 'The length of the adjacent side is ', a
write (*,*) 'The length of the opposite side is ', b
end program triangle
