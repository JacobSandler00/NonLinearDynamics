function zDot = state_1(T,Z)

zDot(1) = Z(1) + Z(3)^2-15*Z(1)-3*Z(2)+7*Z(3);
zDot(2) = -Z(2)-Z(3);
zDot(3) = Z(2).*Z(1)-sin(Z(3))-15*Z(1)-3*Z(2)+7*Z(3);

zDot = [zDot(1);zDot(2);zDot(3)];

end
