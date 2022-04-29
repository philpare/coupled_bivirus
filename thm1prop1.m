 
k = [0.5 2 1000];

i = 3;

[~,sol_healthy_1_eps1000] = ode23(@(t,p)coupled2eps(p,A1,A2,B1/6,B2/11,D1,D2,k(i),k(i),n,t),tspan,p0);

neg_please1 = max(eig(B1*A1/6-D1));

neg_please2 =  max(eig(B2*A2/11-D2));

avgs_healthy_1_eps1000 = avg_inf(sol_healthy_1_eps1000);
clf
plot(avgs_healthy_1_eps1000)



