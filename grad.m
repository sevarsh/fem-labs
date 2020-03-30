function z = grad(x, y)
%GRAD Summary of this function goes here
%   Detailed explanation goes here
z = zeros(1, 2);
z(1) = (1 - 2*x)*(1 - y)*y;
z(2) = (1 - 2*y)*(1 - x)*x;
end
