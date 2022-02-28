% ~~~~~~Symbolic pDerivitaves for Jacobian Matrix~~~~~~~~~~
syms x y e
X_dot = y
Y_dot = -x - e * x^3

xdx = diff(X_dot,x)
xdy = diff(X_dot,y)
ydx = diff(Y_dot,x)
ydy = diff(Y_dot,y)
jacobian = [xdx xdy;ydx ydy]
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% ~~~~~~~~~~Jacobian Evaluation~~~~~~~~~~~~~~~~~~~~
A = [0 1 ; -1 0]  %Jacobian  @ FP # n 
d = det(A);
t = trace(A);
[E_vect,E_vals] = eig(A);
E_vals = diag(E_vals);
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
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% ~~~~~~~Printing useful values~~~~~~~~~~~~~~~
jacobian 
A 
d 
t
E_vect
E_vals
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

% ~~~~~~~~~~~ODE45 Work~~~~~~~~~~~~~~~~~~~~~~~~
% R = .558
% g = 9.81
% sigmaC = sqrt(2*g/R);
% sigma = -sigmaC^2:1/10:sigmaC^2;
% sig = 0


[T,Z]=ode45('sEquation',z0,tspan);
% T = Time Vector , Z = evalutated ODE matrix of state equations 
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
x = Z(:,1);
y = Z(:,2);
plot(x,y)

