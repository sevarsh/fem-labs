%{
gf = figure(1);
hold on;
grid on;
axis([min(x1), max(x1), min(u(x1)), max(u(x1))]);
plot(x1, u(x1), 'r', 'linewidth', 3);
plot(x, v, 'd','linewidth', 4);
%}

%{
figure;
grid on;
plot(x, abs(u(x) - v), 'k', 'linewidth', 2);
title("FEM, y = x * (1 - x)");
%}

%{
figure;
hold on;
grid on;
axis([min(hi), max(hi), min(normL2_ui), max(normL2_ui)]);
loglog(hi,normL2_ui, 'linewidth', 2);
x2 = [0, 0.01];
y2 = 2 .* x2;
plot(x2, y2, 'r');
%}

%{
figure;
title('Diff, L2 norm hist, h(i+1) = h(i) / 2');
xlabel('step');
ylabel('L2 norm value between real and approx')
bar(normL2_dui);

figure;
title('Function, L2 norm hist, h(i+1) = h(i) / 2');
xlabel('step');
ylabel('L2 norm value between real and approx')
bar(normL2_ui);
%}
