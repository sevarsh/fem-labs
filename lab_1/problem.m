clear;
pkg load symbolic;  

u = inline('x .* (1 - x) .* sin(x)');
du = inline('(1-2.*x).*sin(x)+(x-x.^2).*cos(x)');
a = 0;
b = 1;


