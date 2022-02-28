% Homework 7a3
clc ; clear all ; close all;

tspan = 0:.01:100;
x0 = 2.31 %118;
y0 = 3.21 %022;
z0 = 11.47%02;
int = [x0,y0,z0];

global a b c
a = .2;
b = .2;
c = 5.7;

[T,Z] = ode45('rossler',tspan,int);
t = T;

x = Z(:,1);
y = Z(:,2);
z = Z(:,3);

figure(1)
subplot(2,2,1)
plot3(x,y,z)
xlabel('x')
ylabel('y')
zlabel('z')
title('Rossler System x vs y vs z')

subplot(2,2,2)
plot(x,y)
xlabel('x')
ylabel('y')
title('Rossler System x vs y')

subplot(2,2,3)
plot(x,z)
xlabel('x')
ylabel('z')
title('Rossler System x vs z')

subplot(2,2,4)
plot(y,z)
xlabel('y')
ylabel('z')
title('Rossler System   y vs z')

figure(2)
subplot(2,2,1)
plot(t,x)
xlabel('t')
ylabel('x')
title('Rossler System x vs t')

subplot(2,2,2)
plot(t,y)
xlabel('t')
ylabel('y')
title('Rossler System y vs t')

subplot(2,2,[3 4])
plot(t,x)
xlabel('t')
ylabel('z')
title('Rossler System z vs t')