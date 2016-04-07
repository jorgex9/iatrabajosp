%%Datos
%% fo = [8 6]
%% rest = [4 2 60;2 4 48]
%% [zeta,optimo]=simplexfinal (fo,rest,'max',100)
%% fo2=[2 1]
%% rest2=[3 1 3;4 3 6;1 2 3]
%% [zeta,optimo]=simplexfinal(fo2,rest2,'min',10000)

function [zeta,optimo] = simplexfinal(fo,rest,obj,cant)
%%obtener rangos 
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
zeta2=10000000000;
for i=1:cant
  %%calcula solucion vectorX
  for n=1:size(fo,2)
        xtemp=rand()*rango(n)+0.5;
        if xtemp>rango(n)
            X(i,n)=round(xtemp);
        else
            X(i,n)=xtemp;
        end;
  end;      

 if obj =='max'
 	for m=1:size(rest,1)
            recurso(m)=sum(X(i,:).*rest(m,1:size(rest,2)-1));
    end;
        if(recurso <= rest(:,size(rest,2))' )
            if (zeta1 < sum(fo.*X(i,:)))
                zeta1 = sum(fo.*X(i,:));
                optimo= X(i,:);
                hold on;
                plot(X(i,1),X(i,2),'bo') ;          
            end;
            hold on;
            plot(X(i,1),X(i,2),'co') ; 
        else    
            hold on;
            plot(X(i,1),X(i,2),'ro') ;
        end;
    
else
    rest=-rest;
    fo=-fo
    for m=1:size(rest,1)
            recurso(m)=sum(X(i,:).*rest(m,1:size(rest,2)-1));
    end;
        if(recurso >= rest(:,size(rest,2))' )
            if (zeta2 > sum(fo.*X(i,:)))
                zeta2 = sum(fo.*X(i,:));
                optimo= X(i,:);
                
            end;
        end;
 end;            

end;

if obj=='max'
	zeta=zeta1;
else
	zeta=zeta2;
end

hold off;

;

