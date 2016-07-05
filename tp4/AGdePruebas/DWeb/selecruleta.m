%% selecci�n 
Ps=0.8;
N=10;               % tama�o de la poblaci�n inicial 
t=10;               % n�mero de bits 

%[X,FO,I]=poblacion(Ps,N,t,i,j)   % se ingresan los datos de los productos y restricci�n 


%% crear la funci�n  de adaptabilidad 
Fadap=(2^j)*b(j)^(I(i));
Fadap=FO-alpha*In;

Ndes=Fadap/(sum(Fadap)/N); % n�mero de descendientes para cada padre  

des=floor(Ndes);    % vector con el n�mero de descendientes (parte entera) 
res=Ndes-des ;      % valores restantes para distribuir en los padres (parte decimal)

%% Selecci�n estocastica del residuo (ruleta)

res=360*res/sum(res); %se reparte en porciones (ruleta) los residuos 
for i=2:1:N           % se suman los espacios de la ruleta y queda distribuido en los 360 grados
    res(i,1)=res(i,1)+res(i-1,1)
end    

while sum(des)<N   % mientras los 20 descendientes no sean asignados 
   ruleta=360*rand;   % gira la ruleta 
   i=2;     % empezar en 2 para evitar problemas con asignaci�n de vector 
   while i < N     % hacer en todas las casillas de la ruleta 
      
       if ruleta>=res(i-1,1) && ruleta<res(i,1)  % si cay� entre las casillas (i-1) y la (i) entonces asignar descendiente a (i-1)
           des(i-1,1)=des(i-1,1)+1; % incrementar descendiente a des en la casilla i-1
           i=N;   % terminar el ciclo while colocando i =N
       end
       i=i+1; % incrementar la variable i (esta variable recorre las casillas de la ruleta)
   end
         
end

des