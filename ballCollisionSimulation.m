clear all, close all, clc, format compact

hit = 0;

h=0.0004;
tol =0.03;
tolb=0.03;
tolc=0.03;
t=0:h:0.1;

randomizer=rand(1,40);
randomsign=2*(randi(2,1,16)-1.5);

xc1=0.3+ 0.1*randomizer(1);
yc1=0.5+ 0.2*randomizer(2);
rc1=0.1+0.15*randomizer(3);
vx1= (10+ 10*randomizer(4))*randomsign(1);
vy1= (10+ 10*randomizer(5))*randomsign(2);

xc2=1+ 0.1*randomizer(6);
yc2=0.5+ 0.2*randomizer(7);
rc2=0.1+0.15*randomizer(8);
vx2= (10+ 10*randomizer(9))*randomsign(3);
vy2= (10+ 10*randomizer(10))*randomsign(4);

xc3=1.7+ 0.1*randomizer(11);
yc3=0.5+ 0.2*randomizer(12);
rc3=0.1+0.2*randomizer(13);
vx3= (10+ 10*randomizer(14))*randomsign(5);
vy3= (10+ 10*randomizer(15))*randomsign(6);

xc4=2.4+ 0.1*randomizer(16);
yc4=0.5+ 0.2*randomizer(17);
rc4=0.1+0.2*randomizer(18);
vx4= (10+ 10*randomizer(19))*randomsign(7);
vy4= (10+ 10*randomizer(20))*randomsign(8);

xc5=0.3+ 0.1*randomizer(21);
yc5=1.5+ 0.2*randomizer(22);
rc5=0.1+0.2*randomizer(23);
vx5= (10+ 10*randomizer(24))*randomsign(9);
vy5= (10+ 10*randomizer(25))*randomsign(10);

xc6=1+ 0.1*randomizer(26);
yc6=1.5+ 0.2*randomizer(27);
rc6=0.1+0.2*randomizer(28);
vx6= (10+ 10*randomizer(29))*randomsign(11);
vy6= (10+ 10*randomizer(30))*randomsign(12);

xc7=1.7+ 0.1*randomizer(31);
yc7=1.5+ 0.2*randomizer(32);
rc7=0.1+0.2*randomizer(33);
vx7= (10+ 10*randomizer(34))*randomsign(13);
vy7= (10+ 10*randomizer(35))*randomsign(14);

xc8=2.4+ 0.1*randomizer(36);
yc8=1.5+ 0.2*randomizer(37);
rc8=0.1+0.2*randomizer(38);
vx8= (10+ 10*randomizer(39))*randomsign(15);
vy8= (10+ 10*randomizer(40))*randomsign(16);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i=1:length(t)

    % Update the positions of all objects
    x = [xc1 + vx1 * h, xc2 + vx2 * h, xc3 + vx3 * h, xc4 + vx4 * h, xc5 + vx5 * h, xc6 + vx6 * h, xc7 + vx7 * h, xc8 + vx8 * h];
    y = [yc1 + vy1 * h, yc2 + vy2 * h, yc3 + vy3 * h, yc4 + vy4 * h, yc5 + vy5 * h, yc6 + vy6 * h, yc7 + vy7 * h, yc8 + vy8 * h];
    rc = [rc1, rc2, rc3, rc4, rc5, rc6, rc7, rc8];
    vx = [vx1, vx2, vx3, vx4, vx5, vx6, vx7, vx8];
    vy = [vy1, vy2, vy3, vy4, vy5, vy6, vy7, vy8];

    % Boundary conditions for all objects
    for j = 1:8
        if x(j) < rc(j) + tolb, vx(j) = abs(vx(j)); end  
        if 3 - x(j) < rc(j) + tolb, vx(j) = -abs(vx(j)); end
        if y(j) < rc(j) + tolb, vy(j) = abs(vy(j)); end 
        if 2 - y(j) < rc(j) + tolb, vy(j) = -abs(vy(j)); end
    end

    % Check for collisions between all pairs of objects
    for k = 1:7
        for l = k+1:8
            if (sqrt((x(k)-x(l))^2 + (y(k)-y(l))^2) < rc(k) + rc(l) + tol) && (sqrt((x(k)-x(l))^2 + (y(k)-y(l))^2) > rc(k) + rc(l) - tolc)
               hit = hit + 1;
               [vx(k), vx(l), vy(k), vy(l)] = collision(rc(k), rc(l), vx(k), vx(l), vy(k), vy(l),x(k),x(l),y(k),y(l));
            end
        end
    end

    % Update velocities after collision
    [vx1, vx2, vx3, vx4, vx5, vx6, vx7, vx8] = deal(vx(1), vx(2), vx(3), vx(4), vx(5), vx(6), vx(7), vx(8));
    [vy1, vy2, vy3, vy4, vy5, vy6, vy7, vy8] = deal(vy(1), vy(2), vy(3), vy(4), vy(5), vy(6), vy(7), vy(8));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    x1plot= filledcirclex(rc(1),x(1));
    y1plot= filledcircley(rc(1),y(1));

    x2plot= filledcirclex(rc(2),x(2));
    y2plot= filledcircley(rc(2),y(2));

    x3plot= filledcirclex(rc(3),x(3));
    y3plot= filledcircley(rc(3),y(3));

    x4plot= filledcirclex(rc(4),x(4));
    y4plot= filledcircley(rc(4),y(4));

    x5plot= filledcirclex(rc(5),x(5));
    y5plot= filledcircley(rc(5),y(5));

    x6plot= filledcirclex(rc(6),x(6));
    y6plot= filledcircley(rc(6),y(6));

    x7plot= filledcirclex(rc(7),x(7));
    y7plot= filledcircley(rc(7),y(7));

    x8plot= filledcirclex(rc(8),x(8));
    y8plot= filledcircley(rc(8),y(8));


    a=0:0.0001:3;
    b=0:0.0001:2;
    xborder= [0 a                   3*ones(1,length(b)-2)  a(end:-1:1)          zeros(1,length(b)-2) 0];
    yborder= [0 zeros(1,length(a))  b(2:end-1)             2*ones(1,length(a))  b(end-1:-1:2) 0];

    X=[ x(1) x(2) x(3) x(4) x(5) x(6) x(7) x(8)];
    Y=[ y(1) y(2) y(3) y(4) y(5) y(6) y(7) y(8)];
    U=[ vx(1) vx(2) vx(3) vx(4) vx(5) vx(6) vx(7) vx(8)];
    V=[ vy(1) vy(2) vy(3) vy(4) vy(5) vy(6) vy(7) vy(8)];
%%%%%%%%%%%%%%%%%%%%%%%%%
    figure(1)
    
    
    text_plot = ['Time = ',num2str(t(i),'%6.3f'),' s,',' The number of collisions = ',num2str(hit,'%6.2d'),' ']; 
    axis([-1 4 -1 3]),axis equal
    plot(x1plot, y1plot, "b-", x2plot, y2plot, "g-", x3plot, y3plot, "c-",  x4plot, y4plot, "m-", ...
         x5plot, y5plot, "y-",  x6plot, y6plot, "k-",  x7plot, y7plot, "r-", ...
         x8plot, y8plot, "b-", xborder, yborder, "r-", "linewidth", 3)
    grid on, xlabel('x'), ylabel('y'), title(text_plot),axis([-1 4 -1 3])
    hold on
    quiver(X,Y,U,V,0.5,"k-","LineWidth",1, 'AutoScaleFactor', .1)
    
    hold off
    
    
    xc1=x(1);
    yc1=y(1);

    xc2=x(2);
    yc2=y(2);

    xc3=x(3);
    yc3=y(3);

    xc4=x(4);
    yc4=y(4);

    xc5=x(5);
    yc5=y(5);

    xc6=x(6);
    yc6=y(6);

    xc7=x(7);
    yc7=y(7);

    xc8=x(8);
    yc8=y(8);


    kinetic_energy1(i)=0.5*rc1^2*(vx(1)^2+vy(1)^2);
    kinetic_energy2(i)=0.5*rc2^2*(vx(2)^2+vy(2)^2);
    kinetic_energy3(i)=0.5*rc3^2*(vx(3)^2+vy(3)^2);
    kinetic_energy4(i)=0.5*rc4^2*(vx(4)^2+vy(4)^2);
    kinetic_energy5(i)=0.5*rc5^2*(vx(5)^2+vy(5)^2);
    kinetic_energy6(i)=0.5*rc6^2*(vx(6)^2+vy(6)^2);
    kinetic_energy7(i)=0.5*rc7^2*(vx(7)^2+vy(7)^2);
    kinetic_energy8(i)=0.5*rc8^2*(vx(8)^2+vy(8)^2);
    kinetic_energy_sum(i)=kinetic_energy8(i)+kinetic_energy7(i)+kinetic_energy6(i)+kinetic_energy5(i)+kinetic_energy4(i)+kinetic_energy3(i)+kinetic_energy2(i)+kinetic_energy1(i);

   
end

figure(2)
plot(t,kinetic_energy_sum,"k-",t,kinetic_energy1,"r-",t,kinetic_energy2,"b-",t,kinetic_energy3,"g-",t,kinetic_energy4,"m-",t,kinetic_energy5,"k-",t,kinetic_energy6,"y-",t,kinetic_energy7,"r-",t,kinetic_energy8,"b-")
grid on,xlabel("x"),ylabel("y"),legend("Total Kinetic Energy","Object 1","Object 2","Object 3","Object 4","Object 5","Object 6","Object 7","Object 8")
axis([0 t(end) 0 120]);




function xplot = filledcirclex(rc,xc)

theta=0:0.1:2*pi;
r=linspace(0,rc,8);
plot=[];
for i=1:length(r)
    plot=[plot (xc+r(i)*cos(theta))];
end

xplot=plot;
end

function yplot = filledcircley(rc,yc)

theta=0:0.1:2*pi;
r=linspace(0,rc,8);
plot=[];
for i=1:length(r)
    plot=[plot (yc+r(i)*sin(theta))];
end

yplot=plot;
end

