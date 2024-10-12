
function [vx1n,vx2n,vy1n,vy2n] = collision(rc1,rc2,vx1,vx2,vy1,vy2,xc1,xc2,yc1,yc2)

% using conservation of momentum and The coefficient of restitution
% Inputs:
% rc1,rc2,vx1,vx2,vy1,vy2: radius of 1, radius of 2, x-axis velocity 1
% ,x-axis velocity 2,y-axis velocity 1,y-axis velocity 2
%
% Output:
% vx1n,vx2n,vy1n,vy2n : new x-axis velocity 1, new x-axis velocity 2, new y-axis velocity 1, new y-axis velocity 2
% Usage:
% [vx1n,vx2n,vy1n,vy2n] = collision(rc1,rc2,vx1,vx2,vy1,vy2)
a=(atan((yc2-yc1)/(xc2-xc1)));

u1=vx1*cos(a)+vy1*sin(a);
v1=vx1*sin(a)-vy1*cos(a);

u2=vx2*cos(a)+vy2*sin(a);
v2=vx2*sin(a)-vy2*cos(a);

u1n=(u1*(rc1^2-rc2^2)+2*rc2^2*u2)/(rc1^2+rc2^2);
u2n=u1-u2+u1n;

v1n=(v1*(rc1^2-rc2^2)+2*rc2^2*v2)/(rc1^2+rc2^2);
v2n=v1-v2+v1n;

vx1n=u1n*cos(a)+v1n*sin(a);
vy1n=u1n*sin(a)-v1n*cos(a);

vx2n=u2n*cos(a)+v2n*sin(a);
vy2n=u2n*sin(a)-v2n*cos(a);
%%%%%%%%% end of collision %%%%%%%%%%%
end