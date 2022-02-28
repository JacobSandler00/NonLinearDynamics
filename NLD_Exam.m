clc; clear all; close all;
format shortG
% ~~~~~~~~ODE WORK~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Times
t0=0; 
tf=10; 
DT=0.001; 
tspan=t0:DT:tf; 
% Initial Conditions
z10= 0 ;
z20= 1 ;
z01=[z10,z20];

z11 = 0;
z21 = 1;
z02 = [z11 z21];

z13 = 0;
z23 = 1;
z03 = [z13 z23];

R = .558;
g = 9.81;
omegaC = sqrt(2*g/R);

omega1 = omegaC ;  %Omega [parameter] 
omega2 = omegaC -2;
omega3 = omegaC *10;

al = 1; % alpha value for isocline

% ODE Solver
[T,Z] = ode45(@(T,Z)NLD_stateeqn(T,Z,omega1,omegaC),tspan,z01);
x=Z(:,1);
y=Z(:,2)/omegaC;

[T2,Z2] = ode45(@(T,Z)NLD_stateeqn(T,Z,omega2,omegaC),tspan,z02);
x2=Z2(:,1);
y2=Z2(:,2)/omegaC;

[T3,Z3] = ode45(@(T,Z)NLD_stateeqn(T,Z,omega3,omegaC),tspan,z03);
x3=Z3(:,1);
y3=Z3(:,2)/omegaC;

% Plot
figure(1)
hold on

plot(x,y,'k','linewidth',2)
plot(x2,y2,'r','linewidth',2)
plot(x3,y3,'g','linewidth',2)

grid on
xlabel('z_1','FontSize',24)
ylabel('z_2 / sigma_c','FontSize',24)
title(sprintf( 'z_1 vs z_2 / omega_c \n z0[1 2 3] = [%0.1f %0.1f][%0.1f %0.1f][%0.1f %0.1f] \n omega[1 2 3] = [%0.1f %0.1f %0.1f]', z10 , z20 ,z11 , z21,z13 , z23,round(omega1,1), round(omega2,1), round(omega3,1)),'FontSize',14)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% ~~~~~~~~~~~~ISOCLINES & NULLCLINES~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

t = -10:.01:10;
ome  = omega1;
omeC = omegaC;
a = 2*sin(t).*cos(t);
b = al*(1+sin(t).*cos(t));
c = -(ome.^2.*sin(t).*cos(t)-omeC^2*sin(t));
y = @(t) (-b+sqrt(b.^2-4*a.*c))./(2*a) ;%isocline eqn
plot(t,y(t))

% nullclines below
xline(0,'--');
xline(pi(),'-.');
xline(-pi());
yline(0);
null = @(x) acos(sqrt(omeC^2./x.^2));
null2 = @(x) -acos(sqrt(omeC^2./x.^2));
plot(t,null(t))
plot(t,null2(t))
axis([-5 5 -1 1])

legend('time response omega 1','time response omega 2','time response omega 3','isocline','nullcine z1 = 0','nullcline z1= pi','nullcline z1= -pi','nullcline z2= 0' , 'nullcline z2 = acos(omegaC^2/x^2))','nullcline z2 = -acos(omegaC^2/x^2))')
hold off




    
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% ~~~~~~Symbolic pDerivitaves for Jacobian Matrix~~~~~~~~~~~~~~~~~~~~~~~~~~
syms z1 z2 sig sigC
X_dot = z2;
Y_dot = ((sig^2 - 2 * z2^2)*sin(z1)*cos(z1) - sigC^2 * sin(z1))/(1 + 2*sin(z1)^2);

xdx = diff(X_dot,z1);
xdy = diff(X_dot,z2);
ydx = diff(Y_dot,z1);
ydy = diff(Y_dot,z2);
jacobian = [xdx xdy;ydx ydy]
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% ~~~~~~~~~~Jacobian Evaluation~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

oC = omegaC;
o = omega1;
%FP values  choose which FP you would like to eval A at andcomment/uncomment
Z1 = -acos(sqrt(oC^2/o^2));    
Z2 = 0 ;   
% Z1 = acos(sqrt(oC^2/o^2));    
% Z2 = 0 ;

% Z1 = 0 ;
% Z2 = 0 ;

% Z1 = pi();    
% Z2 = 0 ;
% Z1 = -pi();    
% Z2 = 0 ;

%Below is the partial derivatives of zdot2 evaluated at the fixed point
dydx = (4*cos(Z1)*sin(Z1)*(sin(Z1)*oC^2 - cos(Z1)*sin(Z1)*(o^2 - 2*Z2^2)))/(2*sin(Z1)^2 + 1)^2 - (oC^2*cos(Z1) - cos(Z1)^2*(o^2 - 2*Z2^2) + sin(Z1)^2*(o^2 - 2*Z2^2))/(2*sin(Z1)^2 + 1);
dydy = -(4*Z2*cos(Z1)*sin(Z1))/(2*sin(Z1)^2 + 1);

A = [0 1;round(dydx) dydy]     %Jacobian Matrix

d = det(A)
t = trace(A)
[E_vect,E_vals] = eig(A);
E_vals = diag(E_vals)
if t>0 
    disp("unstable")
elseif t<0
    disp("stable")
elseif t==0 && d>0
    disp("centers")
end
if d<0 
    disp("saddle")
elseif d==0
    disp("non-isolated fixed pt")
elseif d>0 && t^2-4*d>0
    disp("nodes")
elseif (d>0) && (t^2-4*d<0)
    disp("spiral")
elseif (d>0) && (t^2-4*d==0)
    disp("Stars & Improper Nodes")
elseif (d>0) && (t == 0)    
    disp("centers")

end
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% ~~~~~~~~~~Bifurcation Diagram~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

omega1 =0:.1:10;
zFP1 = zeros(size(omega1));
zFP2 = -pi()*ones(size(omega1));
zFP3 = pi()*ones(size(omega1));
zFP4 =@(x) acos(sqrt(oC^2./x.^2));
zFP5 = @(x) -acos(sqrt(oC^2./x.^2));
figure(2);
plot(omega1,zFP5(omega1),omega1,zFP4(omega1));
hold on;
plot(omega1,zFP3,' --');
plot(omega1,zFP2,' --');
plot(omega1,zFP1,'   --');
legend('zFP5','zFP4','zFP3','zFP2','zFP1')
hold off
xlabel('\Omega','FontSize',24);
ylabel('z_*','FontSize',18);
title('Bifurcation Diagram','FontSize',24)
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~