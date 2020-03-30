function x = TrDiagMatrSolve(b, c, d, r)
n = length(b);
delta(1) = -(d(1)/c(1));
lambda(1) = r(1)/c(1);
for i = 2:n
    delta(i) = -(d(i)/(c(i) + b(i)*delta(i-1)));
    lambda (i) = (r(i) - b(i)*lambda(i-1))/(c(i) + b(i)*delta(i-1));
end
x(n) = lambda(n);
for i = (n-1):(-1):1
    x(i) = delta(i)*x(i+1) + lambda(i);
end
end