function y = my_diff(f, k, b, x)
  y = abs(f(x) - (k .* x + b)) .^ 2;
endfunction
