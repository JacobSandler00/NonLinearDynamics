function zDot = state_3(T,Z)
global a b l 
x1 = Z(1) ; x2 = Z(2) ; x3 = Z(3);
sig = x3+2*l*x2+l^2*x1;
uSMC = 0.25*(sin(x3)-2*x1.^2*x2-2*l*x3-l^2*x2-((a/sqrt(2) + b)*sign(sig)));


zDot(1) = x2;
zDot(2) = x3;
zDot(3) = 4*uSMC -sin(x3)+2*x1^2*x2;


zDot = [zDot(1);zDot(2);zDot(3)];
end
