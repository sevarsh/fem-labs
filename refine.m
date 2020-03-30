num = input('Введите количество измельчений:  ');
for i=1:num
     [p, e, t] = refinemesh(dl, p, e, t, 'regular');
end
