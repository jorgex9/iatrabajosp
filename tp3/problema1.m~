% Problema 1 – Predicción
% El archivo dblue.csv presenta una serie histórica de variación del dólar paralelo (del 03-01-2012 al 03-05-2013). Implementar un sistema de predicción neuronal bajo las siguientes consideraciones:
% Completar las series para los días faltantes.
% Implementar tres redes neuronales feedforward de tiempo diferido ((1+d)+N+1) para predecir el valor de la serie venta, para uno, seis y quince pasos adelantados, fuera de la serie, luego comparar con el valor correcto. 
% Seleccionar con algún criterio (y explicar) la cantidad necesaria de ventanas de tiempo diferido para cada modelo.
% Utilizar una heurística disponible para determinar la cantidad N de neuronas ocultas.
% En la fase de entrenamiento, distribuir convenientemente los conjuntos de entrenamiento y comprobación.
% Repetir la operación utilizando redes recurrentes, sin ventana de tiempo y  con realimentación de la salida anterior.
% Graficar, en todos los casos, los segmentos de predicción simultáneamente con los segmentos originales.
% Comparar los resultados y sacar conclusiones.

importdblue;  %importamos datos de dblue
importfechasCompleta; %importamos datos de dias totales en el rango de fechas de dblue
index = 1:1:487; %creamos un indice

% ordenamos vectores de forma vertical
Compra = fliplr(Compra')';
Venta = fliplr(Venta')';
Fecha= fliplr(Fecha')';
fechasComp = fliplr(fechasComp')';


ind=1;
indorg =1;
diasok= zeros;
diasFaltantes= zeros;

% buscamos y guardamos los vectores de dias correctos con sus indices
% correspondientes
for i= 1: size(fechasComp,1)
    if(find(ismember(Fecha, fechasComp(i))))

        diasok(indorg,1) = find(ismember(fechasComp, Fecha(indorg)));
        diasok(indorg,2) = Venta(indorg);
        diasok(indorg,3) = Compra(indorg);
        indorg = indorg +1;
        
    else
        diasFaltantes(ind) = i;
        ind = ind +1;
    end    
end

VentaComp= zeros;
CompraComp = zeros;

% se crea un nuevos vectores de valores completos para Venta y Compra
% se realiza interpolacion para aquellos dias que no tienen datos
% originales
   
for i= 1: size(fechasComp,1)
    if(find(ismember(diasok(:,1),i)))
        aux = find(ismember(diasok(:,1),i));
        VentaComp(i) = diasok(aux,2);
        CompraComp(i) = diasok(aux,3);
        
        
    else
        VentaComp(i) =  interpola_lineal(diasok(:,1), Venta,i);
        CompraComp(i) = interpola_lineal(diasok(:,1), Compra,i);
    end    
end

VentaComp = VentaComp';
CompraComp = CompraComp'; 

figure
plot(diasok(:,1),diasok(:,2),'b');
saveas(gcf, 'ventasOriginales.png');
% print('grafico Ventas originales ','-dpng');

figure
plot(diasok(:,1),diasok(:,3),'b');
saveas(gcf, 'ComprasOriginales.png');
% print('grafico Compras orignales ','-dpng');

figure
plot(index,VentaComp,'r');
saveas(gcf, 'ventasInterpolacion.png');
% print('grafico Ventas con interpolacion ','-dpng');

figure
plot(index,CompraComp,'r');
saveas(gcf, 'comprasInterpolacion.png');
% print('grafico Compras con interpolacion ','-dpng');



% 
% Tentrada = dataset';
% intervalo = minmax(Tentrada);
% 
% ncapas = [10 5 1];
% funcacti = {'tansig' 'tansig' 'purelin'};
% 
% net = newff(intervalo, ncapas, funcacti);
% 
% net = train(net, Tentrada)
% 
% 


