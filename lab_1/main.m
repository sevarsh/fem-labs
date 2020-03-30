problem; % setup problem (partically hardcoded in FDM and in FEM)

n = 10; % num of nodes
N = 1000;
x1 = linspace(0, 1, N);

%[v, x, h] = FiniteDiffMethod(n, a, b);
[v, x, h] = FiniteElemMethod(n, a, b);

% normL2_u = my_norm(v, x, u, false);
normL2_du = my_norm(v, x, du, true);
  

%{
for i = 1:4
  [v, x, h] = FiniteElemMethod(n, a, b);
  
  normL2_u = my_norm(v, x, u, false);
  normL2_du = my_norm(v, x, du, true);
  
  hi(i) = h;
  normL2_ui(i) = normL2_u;
  normL2_dui(i) = normL2_du;
  
  h
  normL2_u
  
  n = n .* 2;
endfor
%}

graphics;



