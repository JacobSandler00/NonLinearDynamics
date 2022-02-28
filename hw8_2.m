clc;clear all;close all
start = -.2; stop = -start; N = 1000;
x1 = linspace(start,stop,N);
x2 = linspace(start,stop,N);

x1d = x2;
x2d = -x1.^3 - x2.^3;

v = 0.25 * x1.^4 + 0.25 * x2.^4;
vd = x1.^3.* x1d + x2.^3.* x2d;

for i = 1:length(x1)
    disp('Check')
    disp(x1(i))
   if(v(i) >=0)
       disp('v - PD')
   else
       disp('v - FAIL')
       return
   end
    if(vd(i) <= 0)
        disp('vd - ND')
    else 
        disp('vd - FAIL')
        return
    end
end