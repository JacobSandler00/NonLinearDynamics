function NLD_HW1_PR3C
N = -10:1/10:10;
N_DOT = @(N) -3*N+4*N.^2-N.^3
plot(N,N_DOT(N))
axis([-10 10 -10 10]);xlabel('N');ylabel('N(dot)');
hold all
text(3,0,'N_1*')
text(1,0,'N_2*')

