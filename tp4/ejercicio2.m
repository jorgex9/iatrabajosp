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


% % opts = gaoptimset('Generations',55,'PlotFcns',@gaplotbestf);
% opts = gaoptimset('Generations',33,'PlotFcns',{@gaplotbestf,@gaplotstopping});
% % rng(1,'twister') % for reproducibility
% [xmin fval exitflag Output] = ga(f, 1,opts)  % calculamos el minimo xmin =5.0029
% 
% 
% fprintf('The number of generations was : %d\n', Output.generations);
% fprintf('The number of function evaluations was : %d\n', Output.funccount);
% fprintf('The best function value found was : %g\n', fval);
% 
% % calculos de maximizacion
% g =@(x) 1/f(x);
% [xmax fvalmax exitflagmax] = ga(g, 1,[],[],[],[], 0,15,[],opts)  % calculamos el maximo xmax = 11,16
% 
% 
