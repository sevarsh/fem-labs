function z = grad(x, y)
    z = zeros(1, 2);
    z(1) = (1 - 2*x)*(1 - y)*y;
    z(2) = (1 - 2*y)*(1 - x)*x;
end
