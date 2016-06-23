
% options = optimoptions(@fmincon,...
% 'Display','iter','Algorithm','interior-point','MaxIter',21);
% 
% [x,fval] = fmincon(@rosenbrock,2,[0 0],...
%     [],[],[],[],[],[],@unitdisk,options)

% 
% f = 100*(x(2) - x(1)^2)^2 + (1 - x(1))^2;
% h = @(x,y)((1-x)^2)+100*((y-x^2)^2);

opts = gaoptimset('Generations',3000,'PlotFcns',{@gaplotbestf,@gaplotstopping});
[xmin fvalmin exitflagmin Outputmin] = ga(@rosenbrock,2,opts)