function mutado=Mutacion(Po,prob)

    aux=Po;
    Pm=prob;
    [m,n]=size(Po);
    for i=1:m
        Pi=rand(1);
        if Pi<=Pm
            pos=round(rand(1)*(n-1))+1;
            aux(i,pos)=1-Po(i,pos);
        end
    end
    mutado=aux;
end
