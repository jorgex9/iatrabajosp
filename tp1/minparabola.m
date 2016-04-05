function [min,x,y] = minparabola(parabola,dominio,cont)
%% maxparabola: function description
%% parabola = [1 -2 8]
%% dominio = [-3 8]
%% cont = numero de iteraciones
min=1000000;
for i=1:cont
% x(i)= round(dominio(2)-dominio(1)*rand() + dominio(1));
 x(i)=randi([dominio(1),dominio(2)]);
 y(i)=(parabola(1)*x(i).^2)+parabola(2)*x(i)+parabola(3);
 if y(i)<=min
     min=y(i);
 end
end; 

;


