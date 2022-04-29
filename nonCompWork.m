% nonCompWork.m
% Philip Pare
% 9/7/17

epsil = .5;
d = 2;
n = 15;
area = 1;
X0 = area*rand(n,d);
tspan = 1:.5:150;
x01 = round(rand(n,1)*.8);
x02 = round(rand(n,1)*.8);
ind = ((x01+x02)>1);
x01(ind) = 0;
x02(ind) = 0;
z0 = zeros(n,1);
z0(ind) = 1;
p0 = [x01; x02; z0];
I = eye(n);
B1 = rand(1,1)*I;%diag(rand(n,1));
B2 = rand(1,1)*I;%diag(rand(n,1));
D1 = rand(1,1)*I;%diag(rand(n,1));
D2 = rand(1,1)*I;%diag(rand(n,1));
r = .35;
Xa = area*rand(n,d);
Xb = area*rand(n,d);
A1 = getA(Xa,r);
A2 = getA(Xb,r); %getA(X0(1:n,:),2);
[~,sol] = ode23(@(t,p)noncompvirus(p,A1,A2,B1,B2,D1,D2,epsil,n,t),tspan,p0);

Roa = max(eig(D1\B1));
Rob = max(eig(D2\B2));

lamb1a = max(eig(B1*A1-D1));
lamb1b = max(eig(B2*A2-D2));
%plot_bivirus_ji(sol,X0,Aa,n,d,[0 area 0 area]);
%plot_bivirus3(sol(end,:),X0,Aa,Ab,n,d,[0 area 0 area]);