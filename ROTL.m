function Result=ROTL(x,y,w,ModParam)
% Rotacion de bits de bloque 
% hacia la izquierda e 
% implementacion de la operacion or

Result=mod(bitor(bitshift(x,bitand(y,(w-1))),bitsra(x,w-bitand(y,(w-1)))),ModParam);

end


