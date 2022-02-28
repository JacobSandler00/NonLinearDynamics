function zdot = rossler(T,Z)
global a b c
x = Z(1);
y = Z(2);
z = Z(3);

zdot(1) = -y - z;
zdot(2) = x + a * y;
zdot(3) = b + z * (x - c);

zdot = [zdot(1);zdot(2);zdot(3)];
end