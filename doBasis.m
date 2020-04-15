function g = doBasis(elem, points)
%GRAD_BASIS Summary of this function goes here
%   elem - current element
%   points - array of points
%   num - number of basis function in local numeration
g = zeros(3, 2);

set = [[1, 2, 3]; [2, 3, 1]; [3, 1, 2]];

for i=1:3
    [xa, ya] = getCoords(points, elem(set(i,1)));
    [xb, yb] = getCoords(points, elem(set(i,2)));
    [xc, yc] = getCoords(points, elem(set(i,3)));

    det = (xa*yb + xb*yc + xc*ya) - (xb*ya + xc*yb + xa*yc);
    g(i, 1) = (yb - yc)/det;
    g(i, 2) = (xc - xb)/det;
end
end

