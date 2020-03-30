gm = [3;4;0;1;1;0;1;1;0;0];
sf = 'domain1';
ns = [100;111;109;97;105;110;49];
[dl, bt] = decsg(gm, sf, ns);
%pdegplot(dl)
%axis equal
%xlim([-0.1, 1.1])

[p, e, t] = initMesh(dl);