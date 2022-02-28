clc;clear all;close all
% Nullclines
t = -10:.01:10;
n1 = -1 * ones(length(t));
n2 = @(x)(-(x-1)+sqrt((x-1).^2-4*(-x.^3)))./(2);
n3 = @(x) (-(x-1)-sqrt((x-1).^2-4*(-x.^3)))./(2);
subplot(1,2,1); 
hold on 
xline(0);
plot(t,n1,t,n2(t),t,n3(t));
title('Nullclines');
axis([-10 10 -10 10]);
grid on;
xlabel('X');
ylabel('Y');
lgd = legend('Nullcline 1','Nullcline 2', 'Nullcline 3','Nullcline 4');
lgd.Location = 'SOUTHOUTSIDE';
% Jacobian Evaluation At Each Fixed Point
%           FP 1
Fp1 = [0;0];
x1 = 0;
y1 = 0;
A1 = [1+y1 x1;y1-3*x1^2 2*y1+x1-1]
[v1,D1] = eig(A1)
d1= det(A1)
t1 = trace(A1)
disp('Fixed Point One Classification')
if t1>0 
    disp("unstable")
elseif t1<0
    disp("stable")
elseif t1==0 && d1>0
    disp("centers")
end
if d1<0 
    disp("saddle")
elseif d1==0
    disp("non-isolated fixed pt")
elseif d1>0 && t1^2-4*d1>0
    disp("nodes")
elseif (d1>0) && (t1^2-4*d1<0)
    disp("spiral")
elseif (d1>0) && (t1^2-4*d1==0)
    disp("Stars & Improper Nodes")
elseif (d1>0) && (t1 == 0)    
    disp("centers")
end
%       FP2
Fp2 = [0;1];
x2 = 0;
y2 = 1;
A2 = [1+y2 x2;y2-3*x2^2 2*y2+x2-1]
[v2,D2] = eig(A2)
d2= det(A2)
t2 = trace(A2)
disp('Fixed Point Two Classification')
if t2>0 
    disp("unstable")
elseif t2<0
    disp("stable")
elseif t2==0 && d2>0
    disp("centers")
end
if d2<0 
    disp("saddle")
elseif d2==0
    disp("non-isolated fixed pt")
elseif d2>0 && t2^2-4*d2>0
    disp("nodes")
elseif (d2>0) && (t2^2-4*d2<0)
    disp("spiral")
elseif (d2>0) && (t2^2-4*d2==0)
    disp("Stars & Improper Nodes")
elseif (d2>0) && (t2 == 0)    
    disp("centers")
end
%       FP3
Fp3 = [1;-1];
x3 = 1;
y3 = -1;
A3 = [1+y3 x3;y3-3*x3^2 2*y3+x3-1]
[v3,D3] = eig(A3)
d3= det(A3)
t3 = trace(A3)
disp('Fixed Point Three Classification')
if t3>0 
    disp("unstable")
elseif t3<0
    disp("stable")
elseif t3==0 && d3>0
    disp("centers")
end
if d3<0 
    disp("saddle")
elseif d3==0
    disp("non-isolated fixed pt")
elseif d3>0 && t3^2-4*d3>0
    disp("nodes")
elseif (d3>0) && (t3^2-4*d3<0)
    disp("spiral")
elseif (d3>0) && (t3^2-4*d3==0)
    disp("Stars & Improper Nodes")
elseif (d3>0) && (t3 == 0)    
    disp("centers")
end

%Simulation
tspan = t;
z0 = [-2,0]
[T,Z] = ode45('stateeqns',tspan,z0);

x=Z(:,1);
y=Z(:,2);

hold on
subplot(1,2,2)
plot(x,y)
xlabel('X')
ylabel('Y')
title(sprintf('X vs. Y: Initial Condition [%d %d]',z0(1,1),z0(1,2)))
lgd = legend('Simulation');
lgd.Location = 'SOUTHOUTSIDE';