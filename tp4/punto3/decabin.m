function bin = decabin( a )
%DECABIN Summary of this function goes here
%   Detailed explanation goes here

if (a<0)
    signo = 1;
    a = abs(a);
else
    signo = 0;
    
end

entera = dec2bin(fix(a));
fracc = dec2bin(fix(mod(a,fix(a))*1000));
nv = [];  
nv = [signo entera fracc];
bin = nv(:,2:end);
end

