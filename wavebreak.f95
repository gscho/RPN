program WaveBreak
real :: T, Hb, m, B
real, parameter :: g= 9.80665
write(*,*)'Please enter the slope:'
read(*,*) T
write(*,*)'Please enter the wave height:'
read(*,*) Hb
write(*,*)'Please enter the period:'
read(*,*) m
B = Hb/g*m*(t**2.0)
if(B < 0.003)then
	write(*,*)'Surging'
else if(B > 0.068)then
	write(*,*)'Spilling'
else
	write(*,*)'Plunging'
end if
write(*,*)'The B=', B
end

