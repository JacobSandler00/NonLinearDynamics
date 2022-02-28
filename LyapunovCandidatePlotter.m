clc; clear all; close all
set(0, 'defaultAxesTickLabelInterpreter','latex');  
set(0, 'defaultLegendInterpreter','latex');
set(0, 'defaultTextInterpreter','latex');
set(groot,'defaultLineLineWidth',1)
set(0,'defaultAxesFontSize',15)

lim=3.5; 

[T,R] = meshgrid(linspace(0,2*pi,100),linspace(0,lim,100));
x1=R.*cos(T);
x2=R.*sin(T);

vd = x1.^3.* (-x2 -x1.*(1-x1.^2-x2.^2)) + x2.^3.* (x1 - x2.*(1-x1.^2-x2.^2))

surf(x1,x2,vd,'linestyle','none','facecolor','interp')
xlabel('$x_1$')
ylabel('$x_2$')
zlabel('$V(\vec{x})$')
title('Lyapunov Function Candidate')
colormap('gray')
% Warning - just because something looks positive definite or negative
% definite in a region that you plotted, it does not mean it is pd/nd
% everywhere. You need to show that mathematically. Nonetheless, plotting
% can help you get a grip on things. 
