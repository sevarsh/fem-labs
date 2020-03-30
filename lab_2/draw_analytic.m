%pdeplot(p, e, t, 'xydata', vh, 'zdata', vh)

%analytic solution
xt = 0:0.005:1;
n = length(xt);
yt = 0:0.005:1;
zt = zeros(n, n);
for i=1:n
    for j = 1:n
        zt(i, j) = analytic(xt(i), yt(j));
    end
end
[Xt, Yt] = meshgrid(xt, yt);

figure 
surf(Xt, Yt, zt)
title('Точное решение задачи')
shading interp
