function a = cortef(x,y,corte)
a = zeros(1,length(x));

for i = 1:length(x)
    if y(i) > corte
        a(i) = corte;
    else
        a(i) = y(i);
    end
end    