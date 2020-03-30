function [y, x, h] = FiniteDiffMethod(n, a, b)  
  h = (b - a) / (n - 1);
  x = linspace(a, b, n);
  n = length(x);
  
  r = zeros(1, n);
  B = zeros(1, n);
  C = zeros(1, n);
  D = zeros(1, n);
  
  B(1) = 0;
  D(n) = 0;
  r(1) = 0;
  r(n) = 0;
  D(1) = 0;
  C(1) = 1;
  B(n) = 0;
  C(n) = 1;
  
  for i = 2:n-1    
    D(i) = - 1;
    C(i) = 2 ;
    B(i) = - 1;
    r(i) = f(x(i), x(i) - 1) * h ^ 2;
  end
  %{
  B
  C
  D
  r
  %}
  y = TrDiagMatrSolve(B, C, D, r);  
endfunction
