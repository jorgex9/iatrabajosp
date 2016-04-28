function m = centroMasa(x,y)

id = find(y);
yp = y(id);
xp = x(id);

paso = xp(2) - xp(1);
ya = 0;
a = zeros(1,length(xp));
areatot = 0;
for i = 1:length(xp)
     a(i) = (yp(i) + ya)/2;
     areatot = areatot + a(i);
     mp(i) = xp(i) - paso/2;
     ya=yp(i);
end
m=0;
for i = 1:length(mp)
    m= m + a(i)/areatot * mp(i);
end
