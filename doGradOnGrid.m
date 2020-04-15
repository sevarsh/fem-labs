function g = doGradOnGrid(va, vb, vc, points, elem)
    g = zeros(1, 2);

    [xa, ya] = getCoords(points, elem(1));
    [xb, yb] = getCoords(points, elem(2));
    [xc, yc] = getCoords(points, elem(3));

    det = (xa*yb + xb*yc + xc*ya) - (xb*ya + xc*yb + xa*yc);
    c1 = (va*yb + vb*yc + vc*ya) - (va*yc + vb*ya + vc*yb);
    c2 = (vb*xa + vc*xb + va*xc) - (vb*xc + vc*xa + va*xb);
    g(1) = c1/det;
    g(2) = c2/det;
end
