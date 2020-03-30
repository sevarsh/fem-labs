function [p, e, t] = initMesh(dl)
%INITMESH Summary of this function goes here
%   Detailed explanation goes here

[p, e, t] = initmesh(dl, 'hmax', inf);
[p, e, t] = refinemesh(dl, p, e, t, 'regular');
end

