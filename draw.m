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
