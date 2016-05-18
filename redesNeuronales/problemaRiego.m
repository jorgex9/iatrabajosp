% Problema:  Riego de plantaciones en funcion de la humedad de la tierra y de la temperatura.
% Tiempo de regado
% 
% 
% Temp	HumTier	Tiempo
% 15	20	50
% 15	30	40
% 15	40	30
% 20	20	45
% 20	30	35
% 20	40	30
% 30	20	40
% 30	30	30
% 30	40	25
% 	
% 
% 
% Los datos de entradas Temp, HumTier  y la variable de salida deben estar en forma vectorial
% por lo que se debe hacer una tanspuesta de lo dato.
% 
% entrada= [15 20;15 30;15 40; 20 20 ;20 30;30 40 ;30 20;30 30;30 40]  
% temp = [15 15 15 20 20 20 30 30 30]
% HT = [20 30 40 20 30 40 20 30 40]
% tiempo = [50 40 30 45 35 30 40 30 25]

entrada= [15 20;15 30;15 40; 20 20 ;20 30;30 40 ;30 20;30 30;30 40] 
salida = [49 40 30 45 35 30 40 30 25]

Tentrada = entrada'
intervalo = minmax(Tentrada)


ncapas = [10 5 1] %numero de neuronas en cada capa (3 capas) 10 neuronas en capa entrada, 5 en capa oculta 1 en capa de salida

% se debe definir o no las funciones de activacion en cada capa. Si no se define se toma por defecto la funcion "tansig"

funcacti = {'tansig' 'tansig' 'purelin'}  % aqui se puede cambiar las funciones de activacion para que las tres sean purelin. asi convergeria mas rapido
%funcacti = {'purelin' 'purelin' 'purelin'}
net = newff(intervalo, ncapas, funcacti)  % generamos el modelo (estructura de la red)

%% train => entrena la red con ejemplo
%% gensim => genera un modelo simulnik

net = train(net, Tentrada, salida)

%% evaluar entradas nuevas

output = sim(net,[28; 30])


outputs = net(Tentrada) % calcula las predicciones para los datos de entrenamiento

error = Tentrada - outputs % calula errores 

mean (error) % error promedio

perf = perform(net, outputs, salida)  % calcula performance
%% gensim  >> crea la misma red pero en simulink (en bloques)

gensim(net, st)  %% crea y le pone valores a los pesos "hay que revisar"

gensim(net)  %% genera red en simulink




