function v = fem_2D(p, t, e)
n = length(t(1, :));
m = length(p(1, :)); 
M = zeros(m, m);
R = zeros(m, 1);

for i=1:n
    elem = getTriangle(t, i);
    a = area(elem, p);
    
    %fill right part
    v1 = getPoint(p, elem(1));
    v2 = getPoint(p, elem(2));
    v3 = getPoint(p, elem(3));
    
    f12 = getMiddleValue(v1, v2, @f);
    f13 = getMiddleValue(v1, v3, @f);
    f23 = getMiddleValue(v3, v2, @f);
    
    R(elem(1)) = R(elem(1)) + a*(f12 + f13)/6;
    R(elem(2)) = R(elem(2)) + a*(f12 + f23)/6;
    R(elem(3)) = R(elem(3)) + a*(f23 + f13)/6;
    
    %fill matrix
    g = doBasis(elem, p);
    for j=1:3
        for l=j+1:3
            prod = a*dot(g(j, :), g(l, :));
            ind1 = elem(j);
            ind2 = elem(l);
            M(ind1, ind2) = M(ind1, ind2) + prod;
            M(ind2, ind1) = M(ind2, ind1) + prod;
        end
    end
    
    for j=1:3
        ind = elem(j);
        M(ind, ind) = M(ind, ind) + a*dot(g(j, :), g(j, :));
    end
end

%add boundary conditions
for i = 1:length(e(1, :))
    for j = 1:m
        M(e(1, i), j) = 0;
    end
    M(e(1, i), e(1, i)) = 1;
    R(e(1, i)) = 0;
end

v = M\R;

