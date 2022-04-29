function avgs = avg_inf(sol)

n3 = length(sol(1,:));

n = n3/3;

avg_1 = mean(sol(:,1:n),2);
avg_2 = mean(sol(:,n+1:2*n),2);
avg_3 = mean(sol(:,2*n+1:3*n),2);

avgs = [avg_2 avg_1 avg_3];