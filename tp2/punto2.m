%{
Sistema FIS genérico (3 ptos.)
Diseñar un script que configure un sistema de inferencia fuzzy para un problema genérico que contiene tres variables, dos de entrada (x, y) y una de salida (z). 
Las variables (x, y, z) toman valores en el intervalo [0,10]. El script debe utilizar las funciones del toolbox fuzzy y responder a los requerimientos que se indican:
•	Debe solicitar el tipo de función de pertenencia a utilizar, la misma para todas las variables. Se recomienda trabajar con triángulos y gaussianas.
•	Debe solicitar la cantidad de particiones, entre tres, cinco y siete.
•	Debe solicitar el porcentaje de solapamiento (ej. 20%, 50% y 80%).
•	Las funciones se dispondrán igualmente espaciadas sobre el universo de cada variable, solapadas según el porcentaje indicado. 
    Los vértices de la primera y última función deben coincidir con los extremos del universo de cada variable.
•	Utilizar como base de reglas, las mostradas en el paper DERIVACIÓN DE REGLAS DE CONTROL MIMO PARA UN CONTROLADOR FUZZY SIN CONOCIMIENTO EXPERTO, para tres, cinco y siete particiones.
•	Debe graficarse la función de transferencia z = f(x,y).
A partir de la función de transferencia z = f(x,y) establecer conclusiones de cómo afecta el grado de solapamiento, la cantidad de particiones y el tipo de función de pertenencia sobre la salida del sistema.
%}

%Seleccione la Funcion de Pertenenciacon la cual desea Trabajar (opcion = 1)TRIANGULAR  O (opcion = 2) GAUSSIANA 
opcion = 1

%Seleccione la cantidad de Particiones con la cual desea Trabajar, (op = 1) 3 Particiones, (op = 2) 5 Particiones  o (op =3)7 Particiones 
op = 3

switch opcion
    case 1
        switch op
            case 1 %3 Particiones
                a=newfis('FIS - 3 Particiones');
                a=addvar(a,'input','EntradaX',[0 10]);
                a=addmf(a,'input',1,'N','trimf',[0 0 5]);
                a=addmf(a,'input',1,'Z','trimf',[0 5 10]);
                a=addmf(a,'input',1,'P','trimf',[5 10 10]);
                a=addvar(a,'input','EntradaY',[0 10]);
                a=addmf(a,'input',2,'N','trimf',[0 0 5]);
                a=addmf(a,'input',2,'Z','trimf',[0 5 10]);
                a=addmf(a,'input',2,'P','trimf',[5 10 10]);
                a=addvar(a,'output','SalidaZ',[0 10]);
                a=addmf(a,'output',1,'N','trimf', [0 0 5]);
                a=addmf(a,'output',1,'Z','trimf', [0 5 10]);
                a=addmf(a,'output',1,'P','trimf', [5 10 10]);
                ruleList=[1 1 1 1 1; 1 2 1 1 1; 1 3 2 1 1; 2 1 1 1 1; 2 2 2 1 1; 2 3 3 1 1; 3 1 2 1 1; 3 2 3 1 1; 3 3 3 1 1];
                a=addrule(a,ruleList);
                a
                fuzzy(a);
            case 2 %5 Particiones
                a=newfis('FIS - 5 Particiones');
                a=addvar(a,'input','EntradaX',[0 10]);
                a=addmf(a,'input',1,'NG','trimf',[0 0 2.5]);
                a=addmf(a,'input',1,'NP','trimf',[0 2.5 5]);
                a=addmf(a,'input',1,'Z','trimf',[2.5 5 7.5]);
                a=addmf(a,'input',1,'PP','trimf',[5 7.5 10]);
                a=addmf(a,'input',1,'PG','trimf',[7.5 10 12.5]);
                a=addvar(a,'input','EntradaY',[0 10]);
                a=addmf(a,'input',2,'NG','trimf',[0 0 2.5]);
                a=addmf(a,'input',2,'NP','trimf',[0 2.5 5]);
                a=addmf(a,'input',2,'Z','trimf',[2.5 5 7.5]);
                a=addmf(a,'input',2,'PP','trimf',[5 7.5 10]);
                a=addmf(a,'input',2,'PG','trimf',[7.5 10 12.5]);
                a=addvar(a,'output','SalidaZ',[0 10]);
                a=addmf(a,'output',1,'N','trimf', [0 0 2.5]);
                a=addmf(a,'output',1,'N','trimf', [0 2.5 5]);
                a=addmf(a,'output',1,'Z','trimf', [2.5 5 7.5]);
                a=addmf(a,'output',1,'N','trimf', [5 7.5 10]);
                a=addmf(a,'output',1,'P','trimf', [7.5 10 12.5]);
                ruleList=[1 1 1 1 1;1 2 1 1 1;1 3 1 1 1;1 4 2 1 1;1 4 3 1 1;2 1 1 1 1;2 2 2 1 1;2 3 2 1 1;2 4 3 1 1;2 5 4 1 1;3 1 1 1 1;3 2 2 1 1;3 3 3 1 1;3 4 4 1 1;3 5 5 1 1;4 1 2 1 1;4 2 3 1 1;4 3 4 1 1;4 4 4 1 1;4 5 5 1 1;5 1 3 1 1;5 2 4 1 1;5 3 5 1 1;5 4 5 1 1;5 5 5 1 1];
                a=addrule(a,ruleList);
                a
                fuzzy(a);
            case 3 %7 Particiones
                a=newfis('FIS - 7 Particiones');
                a=addvar(a,'input','EntradaX',[0 10]);
                a=addmf(a,'input',1,'NG','trimf',[0 0 1.667]);
                a=addmf(a,'input',1,'NP','trimf',[0 1.667 3.333]);
                a=addmf(a,'input',1,'ZN','trimf',[1.667 3.333 5]);
                a=addmf(a,'input',1,'Z','trimf',[3.333 5 6.667]);
                a=addmf(a,'input',1,'ZP','trimf',[5 6.667 8.333]);
                a=addmf(a,'input',1,'PP','trimf',[6.667 8.333 10]);
                a=addmf(a,'input',1,'PG','trimf',[8.333 10 10]);
                a=addvar(a,'input','EntradaY',[0 10]);
                a=addmf(a,'input',2,'NG','trimf',[0 0 1.667]);
                a=addmf(a,'input',2,'NP','trimf',[0 1.667 3.333]);
                a=addmf(a,'input',2,'ZN','trimf',[1.667 3.333 5]);
                a=addmf(a,'input',2,'Z','trimf',[3.333 5 6.667]);
                a=addmf(a,'input',2,'ZP','trimf',[5 6.667 8.333]);
                a=addmf(a,'input',2,'PP','trimf',[6.667 8.333 10]);
                a=addmf(a,'input',2,'PG','trimf',[8.333 10 10]);
                a=addvar(a,'output','SalidaZ',[0 10]);
                a=addmf(a,'output',1,'NG','trimf',[0 0 1.667]);
                a=addmf(a,'output',1,'NP','trimf',[0 1.667 3.333]);
                a=addmf(a,'output',1,'ZN','trimf',[1.667 3.333 5]);
                a=addmf(a,'output',1,'Z','trimf',[3.333 5 6.667]);
                a=addmf(a,'output',1,'ZP','trimf',[5 6.667 8.333]);
                a=addmf(a,'output',1,'PP','trimf',[6.667 8.333 10]);
                a=addmf(a,'output',1,'PG','trimf',[8.333 10 10]);
                ruleList=[1 1 1 1 1;1 2 1 1 1;1 3 1 1 1;1 4 1 1 1;1 5 2 1 1;1 6 3 1 1;1 7 5 1 1;2 1 1 1 1;2 2 2 1 1;2 3 2 1 1;2 4 2 1 1;2 5 3 1 1;2 6 4 1 1;2 7 5 1 1;3 1 1 1 1;3 2 2 1 1;3 3 3 1 1;3 4 3 1 1;3 5 4 1 1;3 6 5 1 1;3 7 6 1 1;4 1 1 1 1;4 2 2 1 1;4 3 3 1 1;4 4 4 1 1;4 5 5 1 1;4 6 6 1 1;4 7 7 1 1;5 1 2 1 1;5 2 3 1 1;5 3 4 1 1;5 4 5 1 1;5 5 5 1 1;5 6 6 1 1;5 7 7 1 1;6 1 3 1 1;6 2 4 1 1;6 3 5 1 1;6 4 6 1 1;6 5 6 1 1;6 6 6 1 1;6 7 7 1 1;7 1 4 1 1;7 2 5 1 1;7 3 6 1 1;7 4 7 1 1;7 5 7 1 1;7 6 7 1 1;7 7 7 1 1];
                a=addrule(a,ruleList);
                a
                fuzzy(a);
        end;
    case 2
        switch op
            case 1 %3 Particiones
                a=newfis('FIS - 3 Particiones');
                a=addvar(a,'input','EntradaX',[0 10]);
                a=addmf(a,'input',1,'N','gaussmf',[2.123 0]);
                a=addmf(a,'input',1,'Z','gaussmf',[2.123 5]);
                a=addmf(a,'input',1,'P','gaussmf',[2.123 10]);
                a=addvar(a,'input','EntradaY',[0 10]);
                a=addmf(a,'input',2,'N','gaussmf',[2.123 0]);
                a=addmf(a,'input',2,'Z','gaussmf',[2.123 5]);
                a=addmf(a,'input',2,'P','gaussmf',[2.123 10]);
                a=addvar(a,'output','SalidaZ',[0 10]);
                a=addmf(a,'output',1,'N','gaussmf',[2.123 0]);
                a=addmf(a,'output',1,'Z','gaussmf',[2.123 5]);
                a=addmf(a,'output',1,'P','gaussmf',[2.123 10]);
                ruleList=[1 1 1 1 1; 1 2 1 1 1; 1 3 2 1 1; 2 1 1 1 1; 2 2 2 1 1; 2 3 3 1 1; 3 1 2 1 1; 3 2 3 1 1; 3 3 3 1 1];
                a=addrule(a,ruleList);
                a
                fuzzy(a);
            case 2 %5 Particiones
                a=newfis('FIS - 5 Particiones');
                a=addvar(a,'input','EntradaX',[0 10]);
                a=addmf(a,'input',1,'NG','gaussmf',[1.06 -2.78e-17]);
                a=addmf(a,'input',1,'NP','gaussmf',[1.06 2.425]);
                a=addmf(a,'input',1,'Z','gaussmf',[1.06 5.106]);
                a=addmf(a,'input',1,'PP','gaussmf',[1.06 7.53]);
                a=addmf(a,'input',1,'PG','gaussmf',[1.062 10]);
                a=addvar(a,'input','EntradaY',[0 10]);
                a=addmf(a,'input',2,'NG','gaussmf',[1.06 -2.78e-17]);
                a=addmf(a,'input',2,'NP','gaussmf',[1.06 2.425]);
                a=addmf(a,'input',2,'Z','gaussmf',[1.06 5.106]);
                a=addmf(a,'input',2,'PP','gaussmf',[1.06 7.53]);
                a=addmf(a,'input',2,'PG','gaussmf',[1.062 10]);
                a=addvar(a,'output','SalidaZ',[0 10]);
                a=addmf(a,'output',1,'NG','gaussmf',[1.06 -2.78e-17]);
                a=addmf(a,'output',1,'NP','gaussmf',[1.06 2.425]);
                a=addmf(a,'output',1,'Z','gaussmf',[1.06 5.106]);
                a=addmf(a,'output',1,'PP','gaussmf',[1.06 7.53]);
                a=addmf(a,'output',1,'PG','gaussmf',[1.062 10]);
                ruleList=[1 1 1 1 1;1 2 1 1 1;1 3 1 1 1;1 4 2 1 1;1 4 3 1 1;2 1 1 1 1;2 2 2 1 1;2 3 2 1 1;2 4 3 1 1;2 5 4 1 1;3 1 1 1 1;3 2 2 1 1;3 3 3 1 1;3 4 4 1 1;3 5 5 1 1;4 1 2 1 1;4 2 3 1 1;4 3 4 1 1;4 4 4 1 1;4 5 5 1 1;5 1 3 1 1;5 2 4 1 1;5 3 5 1 1;5 4 5 1 1;5 5 5 1 1];
                a=addrule(a,ruleList);
                a
                fuzzy(a);
            case 3 %7 Particiones
                a=newfis('FIS - 7 Particiones');
                a=addvar(a,'input','EntradaX',[0 10]);
                a=addmf(a,'input',1,'NG','gaussmf',[0.7078 -5.551e-17]);
                a=addmf(a,'input',1,'NP','gaussmf',[0.7078 1.667]);
                a=addmf(a,'input',1,'ZN','gaussmf', [0.7078 3.333]);
                a=addmf(a,'input',1,'Z','gaussmf',[0.708 5.03]);
                a=addmf(a,'input',1,'ZP','gaussmf', [0.7078 6.667]);
                a=addmf(a,'input',1,'PP','gaussmf', [0.7078 8.333]);
                a=addmf(a,'input',1,'PG','gaussmf',[8.333 10 10]);
                a=addvar(a,'input','EntradaY',[0 10]);
                a=addmf(a,'input',2,'NG','gaussmf',[0.7078 -5.551e-17]);
                a=addmf(a,'input',2,'NP','gaussmf',[0.7078 1.667]);
                a=addmf(a,'input',2,'ZN','gaussmf', [0.7078 3.333]);
                a=addmf(a,'input',2,'Z','gaussmf',[0.708 5.03]);
                a=addmf(a,'input',2,'ZP','gaussmf', [0.7078 6.667]);
                a=addmf(a,'input',2,'PP','gaussmf', [0.7078 8.333]);
                a=addmf(a,'input',2,'PG','gaussmf',[8.333 10 10]);
                a=addvar(a,'output','SalidaZ',[0 10]);
                a=addmf(a,'output',1,'NG','gaussmf',[0.7078 -5.551e-17]);
                a=addmf(a,'output',1,'NP','gaussmf',[0.7078 1.667]);
                a=addmf(a,'output',1,'ZN','gaussmf', [0.7078 3.333]);
                a=addmf(a,'output',1,'Z','gaussmf',[0.708 5.03]);
                a=addmf(a,'output',1,'ZP','gaussmf', [0.7078 6.667]);
                a=addmf(a,'output',1,'PP','gaussmf', [0.7078 8.333]);
                a=addmf(a,'output',1,'PG','gaussmf',[8.333 10 10]);
                ruleList=[1 1 1 1 1;1 2 1 1 1;1 3 1 1 1;1 4 1 1 1;1 5 2 1 1;1 6 3 1 1;1 7 5 1 1;2 1 1 1 1;2 2 2 1 1;2 3 2 1 1;2 4 2 1 1;2 5 3 1 1;2 6 4 1 1;2 7 5 1 1;3 1 1 1 1;3 2 2 1 1;3 3 3 1 1;3 4 3 1 1;3 5 4 1 1;3 6 5 1 1;3 7 6 1 1;4 1 1 1 1;4 2 2 1 1;4 3 3 1 1;4 4 4 1 1;4 5 5 1 1;4 6 6 1 1;4 7 7 1 1;5 1 2 1 1;5 2 3 1 1;5 3 4 1 1;5 4 5 1 1;5 5 5 1 1;5 6 6 1 1;5 7 7 1 1;6 1 3 1 1;6 2 4 1 1;6 3 5 1 1;6 4 6 1 1;6 5 6 1 1;6 6 6 1 1;6 7 7 1 1;7 1 4 1 1;7 2 5 1 1;7 3 6 1 1;7 4 7 1 1;7 5 7 1 1;7 6 7 1 1;7 7 7 1 1];
                a=addrule(a,ruleList);
                a
                fuzzy(a);
        end;
end;