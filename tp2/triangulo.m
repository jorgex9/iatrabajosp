function y= triangulo(x, p)
[n,m]= size (x);
if n>1 %% m>1
    error ('no se puede realizar calculo en matrices');
end
if length(p) ~= 3
    error ('se deben tener tres puntos para definir el triangulo');
end
y= zeros(n,m);

a= p(1);
b= p(2);
c= p(3);

if a > b,
    error('parametros incorrectos: a>b');
elseif b > c,
    error('parametros incorrectos: b > c');
elseif a > c,
    error('parametros incorrectos a > c');
end;


for i = 1:max(n,m)
    if x(i) >= a && x(i) <= b
        y(i)= (x(i)-a)/(b-a);
    elseif x(i) >= b && x(i) <= c
        y(i)= -(x(i)-b)/(c-b)+1;
    else
        y(i)=0;
    end
    if isnan (y(i))
        y(i)=1;
    end
end


