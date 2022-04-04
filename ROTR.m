function Result=ROTR(x,y,w,ModParam)

% Rotacion de bits de bloque 
% hacia la derecha e 
% implementacion de la operacion or

Result=mod(bitor(bitsra(x,bitand(y,(w-1))),bitshift(x,w-bitand(y,(w-1)))),ModParam);

end
