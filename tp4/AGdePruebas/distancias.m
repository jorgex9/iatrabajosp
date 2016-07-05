function [media,max] = distancias(X)
%Calcula distancia media y maxima de un vector columna
    Xsort = sort(X);
    n = size(Xsort,1);
    max = 0;
    
    for i=2:n
        delta(i-1) = Xsort(i)-Xsort(i-1);
        if delta(i-1) > max
            max = delta(i-1);
        end
    end
    
    % distancia media: promedio del vector delta
    media = mean(delta);
end

