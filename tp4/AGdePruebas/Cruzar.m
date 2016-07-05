function [Hijo1,Hijo2] = Cruzar(Padre1,Padre2);
%Cruza dos padres, con punto de corte aleatorio
%posicion de punto de cruza entre 1 y n-1
    N = size(Padre1,2);
    PtoCruza = randi(N-1);
    Hijo1 = zeros(1,N);
    Hijo2 = zeros(1,N);
    for i=1:N
        if (i<PtoCruza)
            Hijo1(i)=Padre1(i);
            Hijo2(i)=Padre2(i);
        else
            Hijo1(i)=Padre2(i);
            Hijo2(i)=Padre1(i);
        end
    end
end

%{
function [H1,H2] = Cruzar(P1,P2,PC,Poblacion)
%CRUZAR aplica el operador cruza entre 2 individuos de la poblacion.
    n = size(Poblacion,2)
    if ((PC < 2) || (PC > (n-1)))
        error('ERROR: Punto de corte inadecuando');
    end
    H1=zeros(1,n);
    H2=zeros(1,n);
    for i=1:n
        if (i<PC)
            H1(i) = P1(i);
            H2(i) = P2(i);
        else
            H1(i) = P2(i);
            H2(i) = P1(i);
        end
    end
end
%}
