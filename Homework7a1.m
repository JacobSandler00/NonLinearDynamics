% Homework 7a - 1 , 2
clc ; clear all ; close all
global s r b
s = 10;
r = 25;
b = 8 / 3;
lam = .9;
tol = 1;
tol0 = 10^-7
t_horizon = (1/lam)*(log(tol/tol0))

tspan = 0:.0001:100;
x0 = 11.5; %5 %.00001;
y0 = 17.5; %5 %.00001;
z0 = 20;   %5 %.00001;
z0 = [x0,y0,z0];

[T,Z] = ode45('stateeqns',tspan,z0);

x = Z(:,1);
y = Z(:,2);
z = Z(:,3);

figure(1)
subplot(2,2,1)
grid on
plot3(x,y,z)
xlabel('X')
ylabel('Y')
zlabel('Z')
title(['State Space Trajectory, $\sigma = $',num2str(s),', $b = $',num2str(b),', $r = $',num2str(r)],'interpreter','latex')
view(45,20);

subplot(2,2,2)
grid on
plot(x,y)
xlabel('X')
ylabel('Y')
title(['State Space Trajectory x vs. y, $\sigma = $',num2str(s),', $b = $',num2str(b),', $r = $',num2str(r)],'interpreter','latex')

subplot(2,2,3)
grid on
plot(x,z)
xlabel('X')
ylabel('Z')
title(['State Space Trajectory x vs. z, $\sigma = $',num2str(s),', $b = $',num2str(b),', $r = $',num2str(r)],'interpreter','latex')

subplot(2,2,4)
grid on
plot(y,z)
xlabel('Y')
ylabel('Z')
title(['State Space Trajectory y vs. z, $\sigma = $',num2str(s),', $b = $',num2str(b),', $r = $',num2str(r)],'interpreter','latex')

figure(2)
subplot(2,2,1)
plot(T,x)
xlabel('t')
ylabel('x')
title(['State Space Trajectory t vs. x, $\sigma = $',num2str(s),', $b = $',num2str(b),', $r = $',num2str(r)],'interpreter','latex')

subplot(2,2,2)
plot(T,y)
xlabel('t')
ylabel('y')
title(['State Space Trajectory t vs. y, $\sigma = $',num2str(s),', $b = $',num2str(b),', $r = $',num2str(r)],'interpreter','latex')

subplot(2,2,[3 4])
plot(T,z)
xlabel('t')
ylabel('z')
title(['State Space Trajectory t vs. z, $\sigma = $',num2str(s),', $b = $',num2str(b),', $r = $',num2str(r)],'interpreter','latex')

