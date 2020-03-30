function y = my_norm(v, x, u, is_diff)
  normL2sum = 0;
  for j = 1:length(v) - 1
    k = ( - v(j+1) + v(j) ) / (x(j) - x(j+1));
    b = (v(j+1).*x(j+1) - x(j+1).*v(j) + v(j+1).*x(j) - x(j+1).*v(j+1)) ... 
    / (x(j) - x(j+1));
    if is_diff
      my_f = @(y) (my_diff(u, 0, k, y));
    else
      my_f = @(y) (my_diff(u, k, b, y));
    endif
    normL2(j) =  quadv(my_f, x(j), x(j+1)); 
    normL2sum = normL2sum + normL2(j);
  endfor
  bar(normL2);
  y = sqrt(normL2sum);
endfunction
