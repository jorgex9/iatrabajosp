disp('testing')
 load ('D:\TP3-Punto3\featureout.mat');
 p=featureout;
 net.inputs{1}.processFcns = {'removeconstantrows','mapminmax'};
 load d:\TP3-Punto3\net.mat;
 load net;
 y5=sim(net,p);
 disp(y5);
 [C I]=max(y5);
 disp(I)
 disp(C)
 fid = fopen('D:\TP3-Punto3\output.txt','a');
if (I==1)
    fprintf(fid,'1');
fclose(fid);
elseif (I==2)
    fprintf(fid,'error');
fclose(fid);     
elseif (I==3)
    fprintf(fid,'6');
fclose(fid);     
elseif (I==4)
    fprintf(fid,'error');
fclose(fid);     
elseif (I==5)
    fprintf(fid,'5');
fclose(fid);     
elseif (I==6)
    fprintf(fid,'error');
fclose(fid);     
elseif (I==7)
    fprintf(fid,'8');
fclose(fid);     
elseif (I==8)
    fprintf(fid,'4');
fclose(fid);     
elseif (I==9)
    fprintf(fid,'error');
fclose(fid);     
elseif (I==10)
    fprintf(fid,'0');
fclose(fid);     
elseif (I==11)
    fprintf(fid,'error');
fclose(fid);     
elseif (I==12)
    fprintf(fid,'error');
fclose(fid);     
elseif (I==13)
    fprintf(fid,'error');
fclose(fid);     
elseif (I==14)
    fprintf(fid,'error');
fclose(fid);     
elseif (I==15)
    fprintf(fid,'0');
fclose(fid);     
elseif (I==16)
    fprintf(fid,'2');
fclose(fid);     
elseif (I==17)
    fprintf(fid,'error');
fclose(fid);     
elseif (I==18)
    fprintf(fid,'error');
fclose(fid);     
elseif (I==19)
    fprintf(fid,'3');
fclose(fid);     
elseif (I==20)
    fprintf(fid,'7');
fclose(fid);     
elseif (I==21)
    fprintf(fid,'3');
fclose(fid);     
elseif (I==22)
    fprintf(fid,'9');
fclose(fid);     
elseif (I==23)
    fprintf(fid,'0');
fclose(fid);     
elseif (I==24)
    fprintf(fid,'error');
fclose(fid);
elseif (I==25)
    fprintf(fid,'2');
fclose(fid);     
elseif (I==26)
    fprintf(fid,'7');
fclose(fid);     
else
     disp('not Found');
clear
end
 
 
 