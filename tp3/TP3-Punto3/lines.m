function [fl re]=lines(im_texto)
% Funcion que divide el texto en lineas
im_texto=clip(im_texto);
num_filas=size(im_texto,1);
for s=1:num_filas
    if sum(im_texto(s,:))==0
        nm=im_texto(1:s-1, :); % Primera línea de la matris
        rm=im_texto(s:end, :);% Remanente de linas en la matris
        fl = clip(nm);
        re=clip(rm);
        break
    else
        fl=im_texto; %Solo una linea
        re=[ ];
    end
end

function img_out=clip(img_in)
[f c]=find(img_in);
img_out=img_in(min(f):max(f),min(c):max(c)); % Imagenes de cosechas