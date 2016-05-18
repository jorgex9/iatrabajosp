%%Datos
%% fo = [8 6]
%% rest = [4 2 60;2 4 48]
%% [rango,X,zeta,optimo]=simplex1 (fo,rest,'max',100)
%% fo2=[2 1]
%% rest2=[3 1 3;4 3 6;1 2 3]
%% [rango,X,zeta,optimo]=simplex1(fo2,rest2,'min',10000)

function [rango,X,zeta,optimo] = simplex1(fo,rest,obj,cant)
 for n = 1:size(fo,2)
     rango(n)=1000000000000;
     for m=1: size(rest,1)
        rtemp= rest(m,size(rest,2))/rest(m,n) ;
        if rtemp < rango(n)
            rango(n)=rtemp;
        end;
     end;    
 end;
 
zeta1=0;
zetamin=10000000000000000;
for i=1:cant
    for n=1:size(fo,2)
        xtemp=rand()*rango(n)+0.5;
        if xtemp>rango(n)
            X(i,n)=round(xtemp);
        else
            X(i,n)=xtemp;
    end;
    
    
    
    if obj=='max'
        for m=1:size(rest,1)
            recurso(m)=sum(X(i,:).*rest(m,1:size(rest,2)-1));
        end;
        if(recurso <= rest(:,size(rest,2))' )
            if (zeta1 < sum(fo.*X(i,:)))
                zeta1 = sum(fo.*X(i,:));
                optimo= X(i,:);
            end;
        end; 
    else
        for m=1:size(rest,1)
            recurso(m)=sum(X(i,:).*-rest(m,1:size(rest,2)-1));
        end;
        if(recurso >= (-rest(:,size(rest,2))') )
            if (zetamin > sum(-fo.*X(i,:)))
                zetamin = sum(-fo.*X(i,:));
                optimo= X(i,:);
            end;
        end;   
    end;
end;

if (obj=='max')
    zeta=sum(fo.*optimo);
else
    zeta=sum(-fo.*optimo);
end;
end
