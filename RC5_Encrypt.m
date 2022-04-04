function CryptedText=RC5_Encrypt(S,r,w,PlainText,ModParam)

A=uint64(0);
B=uint64(0);

% Summa de Sub-Keys
% Valores para realizar las 12 rondas 

A = PlainText(1) + S(1);
B = PlainText(2) + S(2);

% Generacion de las Rondas
% para el cifrado RC5

for i=1:r
    A=mod(ROTL(bitxor(A,B),B,w,ModParam)+S(2*i+1),ModParam);
    B=mod(ROTL(bitxor(B,A),A,w,ModParam)+S(2*i+2),ModParam);
end

CryptedText(1)=A;
CryptedText(2)=B;

end
