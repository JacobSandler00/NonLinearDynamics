function Zdot = stateeqns_p7(T,Z)
global sigma r b

Zdot(1) = sigma*(Z(2)-Z(1)); % xdot=sigma(y-x)
Zdot(2) = r*Z(1)-Z(2)-Z(1)*Z(3); % ydot=rx-y-xz
Zdot(3) = Z(1)*Z(2)-b*Z(3);% zdot=xy-bz

Zdot = [Zdot(1); Zdot(2); Zdot(3)];
end