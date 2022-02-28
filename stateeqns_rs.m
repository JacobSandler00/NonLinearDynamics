function Zdot = stateeqns_rs(T,Z)
% global sig sigmaC
R = .558
g = 9.81
sigmaC = sqrt(2*g/R);
sig =  -sigmaC^2     %[sigmaC^2 sigmaC^2]

Zdot(1) = Z(2);        
Zdot(2) = ((sig.^2 - 2*Z(2)^2)*sin(Z(1))*cos(Z(1)) - sigmaC^2*sin(Z(1)))/(1+2*sin(Z(1))^2);

Zdot = [Zdot(1); Zdot(2)];
end