% Jacob Sandler 
% Exam 3 Problem 3 Matlab File
clc ; clear all ; close all
global a l b 
a = 100 ; l = 50 ; b = .01 ;

tspan = 0 : .01 : 10;
x0 = [1, 1, 1]; 
[T,Z] = ode45('state_3',tspan,x0);

x1 = Z(:,1) ; x2 = Z(:,2) ; x3 = Z(:,3);

figure(1);
subplot(3,1,1);
plot(tspan,x1);
title('x_1 vs. t');
xlabel('t') ; ylabel('x_1');

subplot(3,1,2)
plot(tspan,x2)
title('x_2 vs. t')
xlabel('t') ; ylabel('x_2')

subplot(3,1,3);
plot(tspan,x3);
title('x_2 vs. t');
xlabel('t') ; ylabel('x_2');

figure(2);
plot3(x1,x2,x3);
grid on;
title('x_1 vs. x_2 vs. x_3');
xlabel('x_1') ; ylabel('x_2') ; zlabel('x_3');

figure(3)
sig = x3+2*l*x2+l^2*x1;
u = 0.25*(sin(x3)-2*x1.^2.*x2-2*l*x3-l^2*x2-((a/sqrt(2) + b)*sign(sig)));

subplot(2,1,1);
plot(tspan,sig);
title('\sigma vs. t');
xlabel('t') ; ylabel('\sigma');

subplot(2,1,2);
plot(tspan,u);
title('u vs. t');
xlabel('t') ; ylabel('u');

t_reach = 2/a *sqrt(.5*(1+2*l*1+l^2*1))