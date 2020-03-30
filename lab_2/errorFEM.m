function error = errorFEM(vh, t, p)
%ERRORFEM Summary of this function goes here
%   Detailed explanation goes here
n = length(t(1, :)); 
vt = zeros(1, 3);
err = 0;

for i=1:n
    elem = getTriangle(t, i);
    a = area(elem, p);
    
    %analytic
    ut12 = getMiddleValue(p(:, elem(1)), p(:, elem(2)), @analytic);
    ut23 = getMiddleValue(p(:, elem(2)), p(:, elem(3)), @analytic);
    ut31 = getMiddleValue(p(:, elem(3)), p(:, elem(1)), @analytic);
    
    %numeric
    for j = 1:3
        vt(j) = vh(elem(j));
    end
    vt12 = middleVal(vt(1), vt(2));
    vt23 = middleVal(vt(2), vt(3));
    vt31 = middleVal(vt(3), vt(1));
    
    err = err + a*( (vt12 - ut12).^2 + (vt23 - ut23).^2 + (vt31 - ut31).^2 )/3;
end
error = sqrt(err); 
end
