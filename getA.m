function A = getA(X,r)
if nargin < 2
    r = inf;
end
[n, ~] = size(X);
A = zeros(n);
for i = 1:n
    for j = 1:n
        if i > j
            d = norm(X(i,:)-X(j,:));
            if d < r
                A(i,j) = exp(-(d^2));
                A(j,i) = A(i,j);
            end
        end    
    end
end