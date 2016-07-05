function [X,FO,In]=sustucionprog( des, X, FO, In, N, t, c, v, b, pr)

[des,X,FO,In,N,t,c,v,b]=seleccionruleta;  %funcion que llama a los valores anteriores
N
Xh=zeros(N,t);  

%% proceso de ordenamiento de hijos (mayor a menor n�mero de hijos)

 j=0;   % se define un contador que buscar� en el vector de descendientes (des) creado en la selecci�n 
 o=0;   % contador de n�mero de hijos definidos casilla a casilla por la selecci�n (vector des)
 Datos=[]; %matriz que guardar� los �ndices de los hijos (antigua posici�n y los clasifica de mejor a peor) 
 [y z]=max(des);  % se define el m�ximo numero de hijos en des y lo guarda como (y- n�mero de hijos, z- posici�n en el vector inicial)
     while j< N   % mientras la variable que repita al padre sea menor que el n�mero de descendientes
        j=j+1; 
        
       if max(des)==0  % si se encuentra que el maximo es cero es debido a que todos los hijos ya estan asignados
           break   %terminar bucle
       else    %si no 
       if o==y    % si la cuenta del n�mero de descendientes asignado a un padre es igual al contador (debido a que ya se asignaron los hijos en la matriz)
          o=0;   % reiniciar el contador 
          des(z,1)=0;   % hacer el numero asignado de descendiente a cero (para poder llamar al siguente n�mero mayor en ese vector)
       end
       end 
       o=o+1;    %incrementar el contador de hijos asignados 
       [y z]=max(des);   %extraer los datos del m�ximo descendiente 
       Datos(j,:)=[y z];   % se guarda en la matriz Datos (todos los valores de los descendientes asignados)
      
      Xh(j,:)=X(z,:);   % se copia al hijo determinado en la matriz Xh
  end
     
     [Xh Datos]
     
  %% proceso de recombinaci�n   
  x=[];
  i=0;
 while size(Xh,1)~=0  % hasta que la matriz de padres se vuelva cero 
      
      padre1=Xh(1,:);   % se escoje el primer hijo 
      
      a=floor((size(Xh,1)-1)*rand+2);  % se escoje el segundo padre aleatoriamente (lo ideal seria que se escoja un padre diferente)
      
      padre2=Xh(a,:);  % se escoje un padre aleatoriamente
      
      Xh(a,:)=[];  % se borran los cromosomas de los padres 
      Xh(1,:)=[];  % se borran los cromosomas de los padres 
      
      if pr>=rand   % se coloca a la suerte si los padres entran en recombinaci�n o no 
  % escojer un punto aleatorio de recombinaci�n para los padres 1 y 2 
  i=i+1;
  a=floor((t-1)*rand+1);
  x(i,:)=[padre1(1,1:a) padre2(1,a+1:t)];
  i=i+1;
  x(i,:)=[padre2(1,1:a) padre1(1,a+1:t)];
      else     
%           msgbox('No hubo una recombinaci�n')
  i=i+1;
  x(i,:)=padre1;
  i=i+1;
  x(i,:)=padre2; 
      end
  
  end
     X=x;
   
%% crear el vector de funcion
for i=1:1:N
  
   FO(i,1)=X(i,:)*c';  % vector que representa el valor de la funci�n objetivo
   In(i,1)=X(i,:)*v'-b;  % vector que representa el valor de la infactibilidad del punto 
   a=In<0;      % extrae los puntos que no son infactibles 
   In(a)=0;    % vuelve cero los puntos que no son infactibles
end