function matrixbinsorted = ordenarMatrizBinaria(matrixbin)
    decimales = bi2de(matrixbin);
    
    %añadir decimales como ultima columna de la Matriz Binaria
    
    matrixbindec=[matrixbin decimales];
    ncol = size(matrixbindec,2);
    
    % Ordenar la matriz compuesta en funcion de los valores decimales
    matrixbindecsorted=sortrows(matrixbindec, ncol);
    
    % Quitar la columna de decimales. Ya no se necesitan
    matrixbinsorted=matrixbindecsorted(:,1:ncol-1);
end

