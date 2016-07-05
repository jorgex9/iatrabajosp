function mutado = Mutar(Padre);
    aux=Padre;
    pos=randi(size(Padre,2));
    aux(pos)=1-Padre(pos);
    mutado=aux;
end
