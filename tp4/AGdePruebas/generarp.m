%Genera una poblacion inicial aleatoria de 10 individuos.

y = round(10 * rand(10,1));
P0 = de2bi(y,'left-msb');
n = size(P0,1);

PobEvol = []; % Evolucion de la poblacion
DistEvol = []; % Evolucion de las distancias

%Calculo  de su distancia media y maxima
[media,max] = distancias(y);

%Mutacion con probabilidad variable entre [0, 0.5]
FactorMut = (0:0.05:0.5);
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

plot(PobEvol(:,5),0,'r*','MarkerSize',10)