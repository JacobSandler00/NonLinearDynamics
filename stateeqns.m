function Zdot = stateeqns(T,Z)
global g l

Zdot(1) = Z(2);
Zdot(2) = -g/l*sin(Z(1));

Zdot = [Zdot(1); Zdot(2)];
end