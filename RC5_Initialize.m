function S=RC5_Initialize(w,c,b,K,S,P,Q,t,ModParam)
% Parametros 
u=w/8;                  % Division del tamaño de bit
A=uint64(0);            % Creacion da matrices de ceros
B=uint64(0);
L=uint64(zeros(1,c)); 


% Proceso de rransformado la clave K de bytes a palabras
for i=(b-1):-1:0
    L(fix(i/u)+1)= bitshift(L(fix(i/u)+1),8) + K(i+1);
end

%Creacion de subclaves con ayuda de P y Q

S(1)=P;

% Generacion de ciclo for
for i=1:t-1
    S(i+1)=mod(S(i)+Q,ModParam);         % 32 bits
end

i=0;            % Contadores
j=0;            % Contadores

for k=0:3*t-1
   X=mod(S(i+1)+A+B,ModParam);
   S(i+1)= ROTL(X,3,w,ModParam);
   A=S(i+1);
   X=mod(L(j+1)+A+B,ModParam);
   L(j+1)=ROTL(X,(A+B),w,ModParam);
   B=L(j+1);
   i=mod((i+1),t);
   j=mod((j+1),c);
end
end

