% This function simulates a bivirus
function pdot = coupled2eps(p,A1,A2,B1,B2,D1,D2,epsil1,epsil2,n,t)
I = eye(n);
x1 = p(1:n);
x2 = p(n+1:2*n);
z  = p(2*n+1:end);
X1 = diag(x1);
X2 = diag(x2);
Z  = diag(z);
x1dot = (I-X1-X2-Z)*B1*A1*(x1+z)-D1*x1+D2*z-epsil1*X1*B2*(x2+z);
x2dot = (I-X2-X1-Z)*B2*A2*(x2+z)-D2*x2+D1*z-epsil2*X2*B1*(x1+z);
zdot  = -(D1+D2)*z+epsil1*X1*B2*(x2+z)+epsil2*X2*B1*(x1+z);
pdot = [ x1dot; x2dot; zdot];