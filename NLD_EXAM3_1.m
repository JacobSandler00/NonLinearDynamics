% Jacob Sandler
% Exam 3 Problem 1 Matlab File
clc ; clear all ; close all
tspan = 0:.01:5;
y0 = [1,1,1;10,10,10];

for i = 1:2
figure(i)
[T,Z] = ode45('state_1',tspan,y0(i,:));

x1 = Z(:,1);
x2 = Z(:,2);
x3 = Z(:,3);

subplot(3,1,1)
plot(tspan,x1,'r');
title('x_1 vs. t');
xlabel('t');
ylabel('x_1');
grid on

subplot(3,1,2);
plot(tspan,x2,'k');
title('x_2 vs. t');
xlabel('t');
ylabel('x_2');
grid on

subplot(3,1,3);
plot(tspan,x3,'g');
title('x_3 vs. t');
xlabel('t');
ylabel('x_3');
grid on
end
