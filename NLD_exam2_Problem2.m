clc;    clear all;  close all;  %Nullclines
t = -10:.1:10;                  u = 0:1:2;         n1 = zeros(length(u),length(t));
for i=1:length(u)
n1(i,:) =t.*(u(i) - t);         n2 = t;
subplot(2,1,1);                 plot(t,n1(1,:),t,n1(2,:),t,n1(3,:),t,n2);
axis([-5 5 -10 10]);            grid on;
legend('u = 0','u = 1','u = 2','y = x')
xlabel('X');                    ylabel('Y');
title('Nullclines: Finding Critical "u"')
u = 0:1:2;                      x = u(i) - 1;      % Jacobian FP arounnd critical 'u' value             
y = u(i) - 1;
disp('u = ');                   disp(u(i))
FP = [x;y]
A = [u(i)-2*x -1;1 -1]
d = det(A)
t = trace(A)
[eig_vect,eig_val] = eig(A)
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
end
subplot(2,1,2);                    % Bifurcation Diagram
s1 = -5:0.1:0;                     s2 =  0:0.1:5;       
ys1 = s1;                          ys2 = s2;
hold all
plot(s1,zeros(length(s1)),'k');    plot(s1,ys1,'--k')
plot(s2,ys2,'k');                  plot(s2,zeros(length(s2)),'--k')
xlabel('u');                       ylabel('x*');
title('Bifurcation Diagram: Transcritical')
