function s = area(tr, p)
trc = zeros(3, 2);
[trc(1, 1), trc(1, 2)] = getCoords(p, tr(1));
[trc(2, 1), trc(2, 2)] = getCoords(p, tr(2));
[trc(3, 1), trc(3, 2)] = getCoords(p, tr(3));
s = (1/2)*abs((trc(2, 1) - trc(1, 1))*(trc(3, 2) - trc(1, 2)) - (trc(2, 2) - trc(1, 2))*(trc(3, 1) - trc(1, 1)));
end

