%Generar una poblacion inicial aleatoria en el entorno [112; 144]

y = round(112 + (144 - 112) * rand(20,1));
P0 = de2bi(y,'left-msb');
n = size(P0,1);

PobEvol = []; % Evolucion de la poblacion
DistEvol = []; % Evolucion de las distancias

%Calcular su distancia media y maxima
[media,max] = distancias(y);

%Aplicar el operador operador mutacion con prob. variable entre [0, 0.3] con incrementos de 0.03
FactorMut = (0:0.03:0.3);
Pmut = rand(n,1);

for t=1:size(FactorMut,2);
    for i=1:n
        if Pmut(i)<FactorMut(t)
            P0(i,:) = Mutar(P0(i,:));
        end
    end
    
    y = bi2de(P0,'left-msb'); %Transforma a decimal para calcular las distancias
    [dmedia,dmax] = distancias(y); %Para cada factor de mutacion, calcular dist media y max
    DistEvol = [DistEvol; [dmedia dmax]];
    
    PobEvol = [PobEvol y];
end

%plot(PobEvol(:,1),0,'r*','MarkerSize',10)
%plot(PobEvol(:,3),0,'r*','MarkerSize',10)
%plot(PobEvol(:,6),0,'r*','MarkerSize',10)
%plot(PobEvol(:,9),0,'r*','MarkerSize',10)
%plot(PobEvol(:,11),0,'r*','MarkerSize',10)
