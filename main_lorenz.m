% Dr. Karagiannis
% Lorenz Equations
% 2021 03 22
clc; clear all; close all;
set(0, 'defaultAxesTickLabelInterpreter','latex');  
set(0, 'defaultLegendInterpreter','latex');
set(0, 'defaultTextInterpreter','latex');
set(groot,'defaultLineLineWidth',1)
set(0,'defaultAxesFontSize',15)
set(0, 'DefaultFigureRenderer', 'painters')

global sigma r b

% Constants
sigma=10;
b=8/3;
r=10;

t0=0; % Starting time
tf=100; % End time
% tspan=[t0,tf]; % Let ODE solver figure out the time vector

DT=0.001; % Time Step
tspan=t0:DT:tf; % If I want the time-steps to be equally spaced

% Define the initial conditions
z10=5;
z20=5;
z30=5;
z0=[z10,z20,z30];

% ODE Solver
[T,Z] = ode45('stateeqns_lorenz',tspan,z0);

% ODE solver delivers T - discrete time and Z - state varialbles
z1=Z(:,1);
z2=Z(:,2);
z3=Z(:,3);


x=z1;
y=z2;
z=z3;

figure
plot3(x,y,z,'k','linewidth',1)
grid on
xlabel('$x$','interpreter','latex')
ylabel('$y$','interpreter','latex')
zlabel('$z$','interpreter','latex')
title(['State Space Trajectory, $\sigma = $',num2str(sigma),', $b = $',num2str(b),', $r = $',num2str(r)],'interpreter','latex')
view(45,20)