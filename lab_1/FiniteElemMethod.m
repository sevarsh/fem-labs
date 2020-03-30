function [y, x, h] = FiniteElemMethod(n, a, b)
  h = (b - a) / (n - 1);
  x = linspace(a, b, n);
  n = length(x);
  
  r = zeros(1, n);
  B = zeros(1, n);
  C = zeros(1, n);
  D = zeros(1, n);
  
  B(1) = 0;
  B(n) = 0;
  C(1) = 1;
  C(n) = 1;
  D(1) = 0;
  D(n) = 0;
  r(1) = 0;
  r(n) = 0;
  
  for i = 2:n-1    
    D(i) = - 1 / h;
    C(i) = 2 / h ;
    B(i) = - 1 / h;
    f1 = @(y) (f(y, x(i - 1)));
    f2 = @(y) (f(y, x(i + 1)));
    r(i) = (1 / h) .* (quadv(f1, x(i - 1), x(i)) - ...
           quadv(f2, x(i), x(i + 1)));
    %2 * (x(i) .^ 2 - x(i) * (x(i - 1) + x(i + 1))) + ...
    %x(i - 1) .^ 2 + x(i + 1) .^ 2;
  end
  %{
  B
  C
  D
  r
  %}
  y = TrDiagMatrSolve(B, C, D, r); 
endfunction