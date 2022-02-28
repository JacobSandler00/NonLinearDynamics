function Zdot = sEqHw8(T,Z)
x1 = Z(1);
x2 = Z(2);
 
Zdot(1) = -x2 - x1.* (1 - x1.^2 - x2.^2)
Zdot(2) = x1 - x2.* (1 - x1.^2 - x2.^2)

Zdot = [Zdot(1); Zdot(2)];
end

