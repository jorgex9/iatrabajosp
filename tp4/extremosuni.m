function [ xmin  xmax] = extremosuni( f,nvars, intervalo ,iter )
%EXTREMOSUNI Summary of this function goes here
%   Detailed explanation goes here

 % Configuramos numero de iteraciones y graficas a mostrar
    opts = gaoptimset('Generations',iter,'PlotFcns',{@gaplotbestf,@gaplotstopping});

if isequal(nvars,1)
    % Graficamos funcion
    [x,y]=fplot(f,[intervalo(1) intervalo(2)]);
    plot(x,y);
    
    %calculo de x minimo
    [xmin fvalmin exitflagmin Outputmin] = ga(f, nvars,opts) ;% calculamos el minimo xmin =5.0029
    
    %calculo de x maximo
    g =@(x) 1/f(x);
    [xmax fvalmax exitflagmax Outputmin] = ga(g, 1,[],[],[],[], 0,15,[],opts) ; % calculamos el maximo xmax = 11,16
elseif isequal(nvars,2)
    
    [xmin fvalmin exitflagmin Outputmin] = ga(f,2,opts);  % Calculos de minimo global de Rosenbrock
else    
    
end

