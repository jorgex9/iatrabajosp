% a) Funcion unidimensional minimi en f(5)=0 y maximo en f(11,2)=6.07
f = @(x) abs((x- 5)/(2+sin(x)));
numvariables = 1;
intervalo = [0 15];
iteraciones = 33;
[min max] = extremosuni(f,1,[0 15],33);

errorxmin = 5 - min;
errorymin = f(5) - f(min);

errorxmax = 11.2 - max;
errorymax = 6.07 - f(max);


% b) Funcion de Rosenbrock
numvariables = 2;
iteraciones = 300;
g = @rosenbrock;

minimoRosen = extremosuni(g,numvariables,[],iteraciones);

errorRosenX = 1 - minimoRosen(1)
errorRosenY = 1 - minimoRosen(2)
errorRosenZ = 0 - rosenbrock(minimoRosen)
