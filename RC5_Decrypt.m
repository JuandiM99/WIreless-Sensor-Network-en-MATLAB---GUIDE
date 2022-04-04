function DecryptedText = RC5_Decrypt(S,r,w,CryptedText,ModParam)

A = CryptedText(1);
B = CryptedText(2);

% Agregacion subclaves en las n rondas 
% y logica XOR para descifrar

for i=r:-1:1
    B=bitxor(ROTR(mod(ModParam+B-S(2*i+2),ModParam),A,w,ModParam),A);
    A=bitxor(ROTR(mod(ModParam+A-S(2*i+1),ModParam),B,w,ModParam),B);  
end

% Se acaba las 12 rondas y 
% resta de subclaves a valores

DecryptedText(2)=mod(ModParam+B-S(2),ModParam);
DecryptedText(1)=mod(ModParam+A-S(1),ModParam);

end