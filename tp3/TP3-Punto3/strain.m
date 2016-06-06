% Se Resolvio un problema de reconocimiento de patrones con una red neuronal
rng('default');
load('input108.mat');
load('target650.mat');
inputs = input108';
targets = target650';

% Crear una Red de Reconocimiento de Patrones
hiddenLayerSize = 39;
net = patternnet(hiddenLayerSize);

% Seleccione entrada y salida
net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
net.outputs{2}.processFcns = {'removeconstantrows','mapminmax'};

% Establece divicion de datos para el entrenamiento, validacion y prueba
net.divideFcn = 'dividerand';  % Divide los datos aleatoriamente
net.divideMode = 'sample';  % Dividir cada muestra
net.divideParam.trainRatio = 80/100;
net.divideParam.testRatio = 20/100;
net.trainFcn = 'trainscg';

% Elija una función de rendimiento
net.performFcn = 'mse';  % Mean squared error

% Elija Funcion Plot
net.plotFcns = {'plotperform','plottrainstate','ploterrhist', ...
  'plotregression', 'plotfit'};

net.efficiency.memoryReduction = 100;
net.trainParam.max_fail = 6;
net.trainParam.min_grad=1e-5;
net.trainParam.show=10;
net.trainParam.lr=0.9;
net.trainParam.epochs=1000;
net.trainParam.goal=0.00;

% Entrenamiento de Red
[net,tr] = train(net,inputs,targets);

% Prueba de Red
outputs = net(inputs);
errors = gsubtract(targets,outputs);
performance = perform(net,targets,outputs)

% Recalcular Entrenamiento, Validación y Prueba
trainTargets = targets .* tr.trainMask{1};
valTargets = targets  .* tr.valMask{1};
testTargets = targets  .* tr.testMask{1};
trainPerformance = perform(net,trainTargets,outputs)
valPerformance = perform(net,valTargets,outputs)
testPerformance = perform(net,testTargets,outputs)

% Ver la Red
view(net)
disp('after training')
y1=sim(net,inputs);
y1=abs(y1);
y1=round(y1);
save   d:\TP3-Punto3\net net;

%gensim(net)

%Plots
%Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, plotconfusion(targets,outputs)
%figure, plotroc(targets,outputs)
%figure, ploterrhist(errors)
