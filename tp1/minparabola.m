function [min,max,itermin,itermax,x,y,minx,miny] = minparabola(parabola,dominio,cont)
%% maxparabola: function description
%% parabola = [1 -2 8]
%% dominio = [-3 8]
%% cont = numero de iteraciones
min=[0 1000000];
max=[0 -1000000];


%% calculo minimo real
a=parabola(1);
b=parabola(2);
c=parabola(3);
f = @(x) a*x^2+b*x+c;
[minx, miny] = fminbnd(f, dominio(1), dominio(2));

%% calculo iteraciones
for i=1:cont
% x(i)= round(dominio(2)-dominio(1)*rand() + dominio(1));
 x(i)=(dominio(2)-dominio(1))*rand()+dominio(1);
 y(i)=(parabola(1)*x(i).^2)+parabola(2)*x(i)+parabola(3);
 if y(i)<= min(2)
     min=[x(i) y(i)];
     itermin=i;
    
 end
 if y(i)>= max(2)
     max=[x(i) y(i)];
     itermax=i;
 end;
end;
;