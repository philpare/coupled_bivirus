k = 0.0001;
i = 1;

[~,sol_healthy_4] = ode23(@(t,p)coupled2eps(p,A1,A1,B1,B1,D1,D1,k(i),k(i),n,t),0:1000,p0);

pos_please = max(eig(B1*A1-D1))

avgs_healthy_4 = avg_inf(sol_healthy_4);
clf
plot(avgs_healthy_4(1:299,:))

F6 = -D1 + (eye(n)- diag(sol_healthy_4(end,1:n)-sol_healthy_4(end,n+1:2*n)+k(i)*sol_healthy_4(end,n+1:2*n)))*B1*A1;
F7 = -D1 + (eye(n)- diag(sol_healthy_4(end,1:n)-sol_healthy_4(end,n+1:2*n)+k(i)*sol_healthy_4(end,1:n)))*B1*A1;
alpha = max(eig(F6))/max(eig(F7))

sol_healthy_4(end,1:n)./sol_healthy_4(end,n+1:2*n)


