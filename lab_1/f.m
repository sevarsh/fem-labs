function y = f(x, c)
  y = (2 .* sin(x) - 2 .* cos(x) + 4 .* x .* cos(x) + x .* sin(x) - x.^2 .* sin(x)) .* (x - c);
endfunction
