clear;

gm = [3;4;0;1;1;0;1;1;0;0];
sf = 'domain1';
ns = [100;111;109;97;105;110;49];
[dl, bt] = decsg(gm, sf, ns);
[p, e, t] = initMesh(dl);

numOfPartials = 2;
[p, e, t] = refine(numOfPartials, dl, p, e, t);

f = @(x, y) 2 * (x*(1 - x) + y*(1 - y));
analytic = @(x, y) x*(1 - x)*y*(1 - y);

vh = fem_2D(p, t, e, f);

fprintf('Норма погрешности в L^2: %d \n', errorFEM(vh, t, p, analytic));
fprintf('Норма погрешности градиента L^2: %d \n', gradErrorFEM(vh, t, p, @grad));

draw_analytic(analytic);
draw_solution(t, p, vh);


% Source functions
function [p, e, t] = initMesh(dl)
    [p, e, t] = initmesh(dl, 'hmax', inf);
    [p, e, t] = refinemesh(dl, p, e, t, 'regular');
end

function [p, e, t] = refine(num, dl, p, e, t)
    for i=1:num
        [p, e, t] = refinemesh(dl, p, e, t, 'regular');
    end
end

% Draw funcions
function draw_solution(t, p, vh)
    tr = t;
    tr(4,:) = [];

    figure
    trimesh(transpose(tr), transpose(p(1, :)), transpose(p(2, :)))
    title('Результат построения сетки')

    figure
    trisurf(transpose(tr), transpose(p(1, :)), transpose(p(2, :)), vh)
    xlabel('x')
    ylabel('y')
    zlabel('z')
    title('Решение задачи, полученное методом конечных элементов')
end

function draw_analytic(analytic)
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
end



