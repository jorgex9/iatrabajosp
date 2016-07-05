%{
    %Población inicial: 10 individuos aleatorios de 10 bits c/u
    %Cruza monopunto con selección aleatoria del punto de corte y probabilidad de cruza Pc=70%
    %Mutación sobre descendientes, máximo 1 bit por individuo, con probabilidad de mutación Pm=5%
%}

%Genera la matriz en forma aleatoria de 10 individuos con 10 bits c/u
P0 = randbin(10) % Matriz binaria 10x10.

% Solicita al usuario el factor de probabilidad de cruza de Pc=70%
% Factor de Probabilidad de mutacion del Pm=5%
band = 1;
while (band == 1)
    factcruza = input('Ingrese factor de probabilidad de cruza escriba 70%: ');
    if (factcruza < 60)||(factcruza > 90)
        disp('el valor ingresado no es valido');
    else
        band = 0;
    end
end

band2 = 1;
while (band2 == 1)
    factmuta = input('Ingrese factor de probabilidad de mutacion, escriba 5%: ');
    if (factmuta < 1)||(factmuta > 5)
        disp('El valor ingresado no es validolido');
    else
        band2 = 0;
    end
end

%Generar 10 numeros aleatorios y los asigne a los 10 individuos de la poblacion.
Pcruza = rand(10,1);

%Realizar cruza monopunto con las parejas que esten dentro del factor de probabilidad.
Hijos = [];
for i=1:10
    if Pcruza(i)<=(factcruza/100)
        Padre1=P0(i,:)
        j=i+1;
        %Buscando Pareja
        while (j<10)
            if Pcruza(j)<=(factcruza/100)
                %Pareja Encontrada
                Padre2 = P0(j,:)
                [Hijo1,Hijo2] = Cruzar(Padre1,Padre2)
                Hijos = [Hijos; Hijo1; Hijo2];
                break; %Sale del bucle
            else
                j=j+1; %Sigo Buscando
            end
        end
        i=j+1;
    end
end

%Mutacion
m = size(Hijos,1);
Pmut=rand(m,1);
Mutados=[];
for i=1:m
    if Pmut(i)<=(factmuta/100)
        Mutados = [Mutados; Mutar(Hijos(i,:))]
    end
end

%Poblacion Intermedia, formado por la poblacion actual + Hijos + Mutados
PobIntermedia = [P0; Hijos; Mutados];
Rango = bi2de(PobIntermedia);
PobIntermediaOrd = sortrows([PobIntermedia Rango],11);

%Solo quedan los 10 primeros que tengan mayor rango
PobSiguiente=PobIntermediaOrd(1:10,1:10);

% Pcruza
% Pmut
% PobIntermedia
% PobIntermediaOrd



