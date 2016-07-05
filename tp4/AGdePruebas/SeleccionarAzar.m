function Seleccionados = SeleccionarAzar(Po,cant)
    orden = randi(100,100,1);
    aux = sortrows([Po orden], size([Po orden],2));
    Seleccionados = aux(1:cant,1:size(Po,2));
end