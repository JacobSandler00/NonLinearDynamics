function Zdot = NLD_stateeqn(T,Z,omega,omegaC)
Zdot(1) = Z(2);        
Zdot(2) = ((omega.^2 - 2*Z(2)^2)*sin(Z(1))*cos(Z(1)) - omegaC^2*sin(Z(1)))/(1+2*sin(Z(1))^2);
Zdot = [Zdot(1); Zdot(2)];
end

