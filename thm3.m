eps = 0.5;
a = 10;
b = .5;

[~,sol_healthy_thm3] = ode23(@(t,p)coupled2eps(p,A1,A2,b*B1,B2/a,D1,D2,eps,eps,n,t),tspan,p0);

Bhat = diag(b*B1*A1*sol_healthy_thm3(end,1:n)');

pos_please0 = max(eig(B1*A1*b-D1))

pos_please =  max(eig(B2*A2/a-D2))

neg_please = max(eig(((eye(n)- diag(sol_healthy_thm3(end,1:n)))*B2*A2/a-D2)))

F1 = -D1-D2+eps*diag(sol_healthy_thm3(end,1:n))*B2*A2/a;
F2 = eps*(diag(sol_healthy_thm3(end,1:n))*B2*A2/a+Bhat);
F3 = -D2 + (eye(n)- diag(sol_healthy_thm3(end,1:n)))*B2*A2/a -eps*Bhat;
F4 = D1 + (eye(n)- diag(sol_healthy_thm3(end,1:n)))*B2*A2/a;

neg_please2 = max(eig(F1-F2*inv(F3)*F4))

avgs_healthy_thm3 = avg_inf(sol_healthy_thm3);
plot(avgs_healthy_thm3)