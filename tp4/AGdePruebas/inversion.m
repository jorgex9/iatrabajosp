%Generar Poblacion Inicial; 25 individuos de 5 bits cada uno
P0 = randi(2,25,5)-1;
PInicial = P0;
%las probabilidades asociadas a cada individuo para inversion
P = rand(25,1);
%generamos en forma aleatoria los puntos de inversion
j=randi(5);
k=randi(5);
while j==k %nos aseguramos de que no sea el mismo punto
    k=randi(5);
end

for i=1:size(P0,1)
    if P(i)<=0.02
        aux=P0(i,j);
        P0(i,j)=P0(i,k);
        P0(i,k)=aux;
    end
end
