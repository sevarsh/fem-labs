gm = [3;4;0;1;1;0;1;1;0;0];
sf = 'domain1';
ns = [100;111;109;97;105;110;49];
[dl, bt] = decsg(gm, sf, ns);
%pdegplot(dl)
%axis equal
%xlim([-0.1, 1.1])

[p, e, t] = initMesh(dl);

h = zeros(1, 4)
err1 = h;
err2 = h;
h(1) = 0.03125
h(2) = h(1)/4;
h(3) = h(2)/4;
h(4) = h(3)/4;

for i=1:4
     [p, e, t] = refinemesh(dl, p, e, t, 'regular');
     vh = fem_2D(p, t, e);
    %uh = analyticOnGrid(p);

    disp('Норма погрешности в L^2: ')
    err1(i) = errorFEM(vh, t, p)
    disp('Норма погрешности градиента L^2: ')
    err2(i) = gradErrorFEM(vh, t, p)
end

figure
plot(h, h)
hold on
plot(h, err1)
hold on
grid on
