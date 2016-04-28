
%universo discurso
x= 0:0.1:20;

% variable de entreda temperatura
temp = zeros(7,3);
ptemp=3;
% en el caso que tengamos tres particiones de entrada
temp(1,:) = [0 0 8];
temp(2,:) = [5 10 15];
temp(3,:) = [12 20 20];
plot(x,triangulo(x,temp(1,:)),     x,triangulo(x,temp(2,:)),     x,triangulo(x,temp(3,:)));

% variable de entreda temperatura
vel = zeros(7,3);
pvel=4;
% cuatro particiones de la variable velocidad
vel(1,:) = [0 0 6];
vel(2,:) = [4 7 10];
vel(3,:) = [9 16 18];
vel(4,:) = [17 20 20];
plot(x,triangulo(x,vel(1,:)),   x,triangulo(x,vel(2,:)),   x,triangulo(x,vel(3,:))   ,x,triangulo(x,vel(4,:)));

% variable de salida aceleracion.
acel = zeros(7,3);
pfreno = 3;
% en el caso que tengamos tres particiones de entrada
acel(1,:) = [0 0 8];
acel(2,:) = [5 10 15];
acel(3,:) = [12 20 20];
plot(x,triangulo(x,acel(1,:)),     x,triangulo(x,acel(2,:)),   x,triangulo(x,acel(3,:)));


% matriz de reglas de implicacion: la idea aqui es cargar una regla en cada
% fila de la matriz donde cada columna sea una variable (entradas y
% salidas) en este caso dos variables de entrada y dos de salida. Cada
% valor corresponde al numero de particion asociada. Suponemos que se
% cargaran 4 reglas

mreglas = [1 1 3; 2 2 2; 3 4 1; 1 2 3];


% Con esto ya tengo definido el modelo del FIZ
% ahora vamos a evaluar con los datos:
t = 7.5;
v = 5;


% obtener salidas: la idea seria recorrer la matriz de reglas para ver
% cuales son las particiones que interviene en cada regla y evaluar sus
% valores de mu con t y v, para sacar el minimo y obtener el corte en la
% particion correspondiente de la variable de salida al mu minimo (and). Al
% final de esto se obtendra un vector con las salidas para cada  regla.

for i = 1:size(mreglas,1)
    p1=mreglas(i,1);
    mu1=triangulo(t,temp(p1,:));
    p2=mreglas(i,2);
    mu2=triangulo(t,vel(p2,:));
    
    p3=mreglas(i,3);
    mu3= min (mu1,mu2);
    salida(i,:)= cortef(x,triangulo(x,acel(p3,:)),mu3); 
end

% Se debe  realizar ahora la composicion del la salida total fuzzy por AND
yfuzzy = min(salida);
plot(x,yfuzzy);
% Se calcula el centro de masa, para obtener el valor de variable crisp de
% salida.
xCrisp= centroMasa(x,yfuzzy);


% DUDAS===>> 1) como se debe trabajar cuando las variables estan en
% distinto universo discurso?













