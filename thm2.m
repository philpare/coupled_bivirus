 
k = [0.5];

i = 1;

[~,sol_healthy_2] = ode23(@(t,p)coupled2eps(p,A1,A2,B1,B2/11,D1,D2,k(i),k(i),n,t),tspan,p0);

pos_please1 = max(eig(B1*A1-D1))

neg_please2 =  max(eig(B2*A2/11-D2))

avgs_healthy_2 = avg_inf(sol_healthy_2);
clf
plot(avgs_healthy_2)



