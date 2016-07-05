%Generar una población inicial que contenga 100 individuos de
%8 dígitos octales aleatorios cada uno (ej. Ii = 0 2 6 3 4 2 5 7)
P0 = randi(8,100,8)-1;
%Aplicar el operador de cruza a la mitad de la población 
%seleccionados al azar, con una probabilidad del 80%.
Seleccionados = SeleccionarAzar(P0,50);
Pcruza=rand(50,1);
Hijos=[];

%Cruza
for i=1:size(Seleccionados,1)
    if Pcruza(i)<=0.8
        Padre1=Seleccionados(i,:);
        j=i+1; 
        %Buscando Pareja
        while (j<size(Seleccionados,1))
            if Pcruza(j)<=0.8
                %Pareja Encontrada
                Padre2=Seleccionados(j,:);
                [Hijo1,Hijo2]=Cruzar2(Padre1,Padre2);
                Hijos = [Hijos; Hijo1; Hijo2];
                break; %Sale del bucle
            else
                j=j+1; %Buscando Pareja
            end
        end
        i=j+1;
    end
end

%Mutacion
Pmut=rand(size(Hijos,1),1);
Mutados=[];
for i=1:size(Hijos,1)
    if Pmut(i)<=0.1
        Mutados=[Mutados;Mutar(Hijos(i,:))];
    end
end

%Generar P1
Faltan = 100-(size(Hijos,1)+size(Mutados,1));
P1 = [Seleccionados(1:Faltan,:);Hijos;Mutados];
