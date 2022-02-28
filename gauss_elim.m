function x=gauss_elim(A,b)

[M N]=size(A)
for k= 1:N; %pivot number
for i= k+1:N % rows -- Pivot # +1 to n

m = A(i,k)/A(k,k);
b(i)=b(i)-m*b(k);
	for j = 1 : 8 % number of columns
	 A(i,j) = A (i,j) - A(k,j)*m;
	end
end
end

%perform back substitution on upper diagonal matrix
x(N)=b(N)/A(N,N);
for i=7:-1:1
   x(i)=b(i);
   for j=8:-1:i+1
       x(i)=x(i)-A(i,j)*x(j);
   end
   x(i)=x(i)/A(i,i);
end;

