function y0 = interpola_lineal(x,y,x0)
    y0=zeros(length(x0),1);
    for j=1:length(x0)
        indice=find(x>x0(j));
        k=indice(1)-1;
        y0(j)=((x0(j)-x(k))*y(k+1)-(x0(j)-x(k+1))*y(k))/(x(k+1)-x(k));
    end
end