function uh = analyticOnGrid(points)
%ANALYTICONGRID Summary of this function goes here
%   Detailed explanation goes here
l = length(points);
uh = zeros(l, 1);
for i=1:l
    uh(i) = analytic(points(1, i), points(2, i));
end
