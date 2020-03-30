vh = fem_2D(p, t, e);
%uh = analyticOnGrid(p);

disp('Норма погрешности в L^2: ')
err1 = errorFEM(vh, t, p)
disp('Норма погрешности градиента L^2: ')
err2 = gradErrorFEM(vh, t, p)