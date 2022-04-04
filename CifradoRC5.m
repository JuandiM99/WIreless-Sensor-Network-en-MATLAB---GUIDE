function varargout = CifradoRC5(varargin)
% CIFRADORC5 MATLAB code for CifradoRC5.fig
%      CIFRADORC5, by itself, creates a new CIFRADORC5 or raises the existing
%      singleton*.
%
%      H = CIFRADORC5 returns the handle to a new CIFRADORC5 or the handle to
%      the existing singleton*.
%
%      CIFRADORC5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CIFRADORC5.M with the given input arguments.
%
%      CIFRADORC5('Property','Value',...) creates a new CIFRADORC5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CifradoRC5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CifradoRC5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CifradoRC5

% Last Modified by GUIDE v2.5 24-Mar-2022 17:15:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CifradoRC5_OpeningFcn, ...
                   'gui_OutputFcn',  @CifradoRC5_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before CifradoRC5 is made visible.
function CifradoRC5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CifradoRC5 (see VARARGIN)

% Choose default command line output for CifradoRC5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CifradoRC5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CifradoRC5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% Implementacion de Imagenes

axes(handles.axes1); 
bkgrnd=imread('seg.PNG'); 
imshow(bkgrnd); 




% --- Executes on button press in btncr5.
function btncr5_Callback(hObject, eventdata, handles)
% hObject    handle to btncr5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%%%%% Codigo de Cifrado RC5 %%%%%%

% Parametros del Algoritmo
w = 32;                     % Tamaño en bits
r = 12;                     % Numero de rondas
b = 16;                     % Tamaño de bits KEY 
c = 4;                      % Palabras de la clave
t =26;                      % Tamaño de tabla SubKey
e=2.71828182846566;         % Valor de Euler
gr=1.61803398875;           % Valor d
numal = floor(randi(100));


% RECOLECCION DE DATOS INGRESADOS 
% DE LAS DIRECCIONES MAC 

nA =(get(handles.txt1,'string'));
nB = (get(handles.txt2,'string'));
nA1 = (get(handles.txt3,'string'));
nB1 = (get(handles.txt4,'string'));
nA2 = (get(handles.txt5,'string'));
nB2 = (get(handles.txt6,'string'));
nA3 = (get(handles.txt7,'string'));
nB3 = (get(handles.txt8,'string'));
nA4 = (get(handles.txt9,'string'));
nB4 = (get(handles.txt10,'string'));
nA5 = (get(handles.txt11,'string'));
nB5 = (get(handles.txt12,'string'));

% COMPARACION DE DATOS INGRESADOS
% Y CAMBIO DE LETRAS -> NUMEROS
% CUADRO 1 -> txt1

switch nA
    case '0'
        n1=0;
    case '1'
        n1=1;
    case '2'
        n1=2;
    case '3'
        n1=3;
    case '4'
        n1=4;
    case '5'
        n1=5;
    case '6'
        n1=6;
    case '7'
        n1=7;
    case '8'
        n1=8;
    case '9'
        n1=9;
    case 'A'
        n1=10;
    case 'B'
        n1=11;
    case 'C'
        n1=12;
    case 'D'
        n1=13;
    case 'E'
        n1=14;
    case 'F'
        n1=15;
    otherwise
        n1=00;
end

% COMPARACION DE DATOS INGRESADOS
% Y CAMBIO DE LETRAS -> NUMEROS
% CUADRO 2 -> txt2
switch nB
    case '0'
        n2=0;
    case '1'
        n2=1;
    case '2'
        n2=2;
    case '3'
        n2=3;
    case '4'
        n2=4;
    case '5'
        n2=5;
    case '6'
        n2=6;
    case '7'
        n2=7;
    case '8'
        n2=8;
    case '9'
        n2=9;
    case 'A'
        n2=10;
    case 'B'
        n2=11;
    case 'C'
        n2=12;
    case 'D'
        n2=13;
    case 'E'
        n2=14;
    case 'F'
        n2=15;
    otherwise
       n2=00;
end

% GENERACION DEL PROCESO DE CIFRADO PARA VALOR 
% INGRESADO DE LA DIRECCION MAC 

nk = n1*numal          % Numero concatenar funcion  MAC
nl = n2*numal          % Numero concatenar funcion MAC
nx = dec2bin(n1)       % Numero a enviar funcion  MAC nueva 
ny = dec2bin(n2)       % Numero a enviar funcion  MAC nueva

h = str2num(nx)         % Conversion a valores numericos         
i = str2num(ny)

j = bitshift(h,-1)      % Rotacion de posiciones 
k = bitshift(i,-1)
l = bitshift(j,1)
m = bitshift(k,1)

n = num2str(l)          % Transformacion a numeros y binarios
o = num2str(m)
p = bin2dec(n)
q = p/numal
r1 = bin2dec(o)
s = r1/numal

pseudo1= num2str(nk);    % Cambiar a valores numericos
pseudo2= num2str(nl);    

enviar1=nx;              % CAMBIAR
enviar2=nx;              % CAMBIAR

% Calculos de Valores Para 
% El algoritmo RC5

ModParam=uint64(2^w);               
P=uint64((e-2)*2^w);                % Calculo del valor p 
Q=uint64((gr-2)*2^w+2^w);           % Calculo del valor q
S=uint64(zeros(1,t));               % Vector de Sub llaves
PlainText=uint64(zeros(1,3));       % Variable de texto claro

DecryptedText=uint64(zeros(1,3));   % Decencriptado del algoritmo 
K=uint64(ones(1,b));                % Llave  

PlainText(1)=n1;                    % Texto claro a cifrar A1
PlainText(2)=n2;                    % Texto claro a cifrar A2

% Llamado de la Funcion "RC5_Initialize" 
% Para el proceso de cifrado RC5
S=RC5_Initialize(w,c,b,K,S,P,Q,t,ModParam);             % Funcion y parametros

% GENERACION DE CIFRADO %
% llamado de funcion "RC5_Encrypt"
CryptedText=RC5_Encrypt(S,r,w,PlainText,ModParam);      % Funcion y parametros

% Mostrar el Texto Cifrado
% disp(['Texto Cifrado: ',num2str(CryptedText(1)),' ',num2str(CryptedText(2))]);

% INGRESO DE DIRECCION MAC %
disp([nA,nB,':',nB,nA]);            % Proceso de Encriptado 
cripto1=num2str(CryptedText(1));
cripto2=num2str(CryptedText(2));

% GENERACION DE CIFRADO %
% llamado de funcion "RC5_Decrypt"
DecryptedText=RC5_Decrypt(S,r,w,CryptedText,ModParam);  % Funcion y parametros

% CAMBIO DE NUMEROSA HEXADECIMALES %
% Implementacion de la funcion "switch"

switch DecryptedText(1)
    case 0
        ltr1 = '0';
    case 1
        ltr1 = '1';
    case 2
        ltr1 = '2';
    case 3
        ltr1 = '3';
    case 4
        ltr1 = '4';
    case 5
        ltr1 = '5';
    case 6
        ltr1 = '6';
    case 7
        ltr1 = '7';
    case 8
        ltr1 = '8';
    case 9
        ltr1 = '9';
    case 10
        ltr1 = 'A';
    case 11
        ltr1 = 'B';
    case 12
        ltr1 = 'C';
    case 13
        ltr1 = 'D';
    case 14
        ltr1 = 'E';
    case 15
        ltr1 = 'F';
    otherwise
        ltr1 = 'X';
end

switch DecryptedText(2)
    case 0
        ltr2='0';
    case 1
        ltr2 = '1';
    case 2
        ltr2 = '2';
    case 3
        ltr2 = '3';
    case 4
        ltr2 = '4';
    case 5
        ltr2 = '5';
    case 6
        ltr2 = '6';
    case 7
        ltr2 = '7';
    case 8
        ltr2 = '8';
    case 9
        ltr2 = '9';
    case 10
        ltr2 = 'A';
    case 11
        ltr2 = 'B';
    case 12
        ltr2 = 'C';
    case 13
        ltr2 = 'D';
    case 14
        ltr2 = 'E';
    case 15
        ltr2 = 'F';
    otherwise
        ltr2 = 'X';
end

% VERIFICACION DE ENCRIPTADO %

if (PlainText(1)==DecryptedText(1))&&(PlainText(2)==DecryptedText(2))
    disp('DESCIFRADO EXITOSO ');
else
    disp('DESCIFRADO FALLIDO '); 
end
    
    switch nA1
        case '0'
            n1=0;
        case '1'
            n1=1;
        case '2'
            n1=2;
        case '3'
            n1=3;
        case '4'
            n1=4;
        case '5'
            n1=5;
        case '6'
            n1=6;
        case '7'
            n1=7;
        case '8'
            n1=8;
        case '9'
            n1=9;
        case 'A'
            n1=10;
        case 'B'
            n1=11;
        case 'C'
            n1=12;
        case 'D'
            n1=13;
        case 'E'
            n1=14;
        case 'F'
            n1=15;
        otherwise
            n1=00;
    end
    switch nB1
        case '0'
            n2=0;
        case '1'
            n2=1;
        case '2'
            n2=2;
        case '3'
            n2=3;
        case '4'
            n2=4;
        case '5'
            n2=5;
        case '6'
            n2=6;
        case '7'
            n2=7;
        case '8'
            n2=8;
        case '9'
            n2=9;
        case 'A'
            n2=10;
        case 'B'
            n2=11;
        case 'C'
            n2=12;
        case 'D'
            n2=13;
        case 'E'
            n2=14;
        case 'F'
            n2=15;
        otherwise
            n2=00;
    end
    
    nk= n1*numal          % numero concatenar funcion  mac
    nl= n2*numal          %numero concatenar funcion mac
    nx = dec2bin(n1)      %numero a enviar funcion  MAC nueva 
    ny = dec2bin(n2)      %numero a enviar funcion  MAC nueva
    h=str2num(nx)           
    i=str2num(ny)            
    j=bitshift(h,-1)
    k=bitshift(i,-1)
    l=bitshift(j,1)
    m=bitshift(k,1)
    n=num2str(l)
    o=num2str(m)
    p=bin2dec(n)
    q=p/numal
    r1=bin2dec(o)
    s=r1/numal
    pseudo3= num2str(nk);   %CAMBIAR
    pseudo4= num2str(nl);   %CAMBIAR
    enviar3=nx;             %CAMBIAR
    enviar4=nx;             %CAMBIAR
    
    % Formulas del Cifrado RC5
    ModParam=uint64(2^w);

    P=uint64((e-2)*2^w);
    Q=uint64((gr-2)*2^w+2^w); 

    S=uint64(zeros(1,t));  
    PlainText=uint64(zeros(1,3)); 

    DecryptedText=uint64(zeros(1,3));

    K=uint64(ones(1,b));

    PlainText(1)=n1;
    PlainText(2)=n2; 

    S=RC5_Initialize(w,c,b,K,S,P,Q,t,ModParam);

    CryptedText=RC5_Encrypt(S,r,w,PlainText,ModParam);
    disp(['Texto Cifrado: ',num2str(CryptedText(1)),' ',num2str(CryptedText(2))]);


    %MAC ingresada
    disp([nA,nB,nA1,nB1,':']);
    % Cirado
    cripto3=num2str(CryptedText(1));
    cripto4=num2str(CryptedText(2));
    
    %Descifrado
    DecryptedText=RC5_Decrypt(S,r,w,CryptedText,ModParam);
    disp(['Texto Descifrado: ',num2str(DecryptedText(1)),' ',num2str(DecryptedText(2))]);

    % Cambio de Numeros a letras
    switch DecryptedText(1)
        case 0
            ltr3='0';
        case 1
            ltr3 = '1';
        case 2
            ltr3 = '2';
        case 3
            ltr3 = '3';
        case 4
            ltr3 = '4';
        case 5
            ltr3 = '5';
        case 6
            ltr3 = '6';
        case 7
            ltr3 = '7';
        case 8
            ltr3 = '8';
        case 9
            ltr3 = '9';
        case 10
            ltr3 = 'A';
        case 11
            ltr3 = 'B';
        case 12
            ltr3 = 'C';
        case 13
            ltr3 = 'D';
        case 14
            ltr3 = 'E';
        case 15
            ltr3 = 'F';
        otherwise
            ltr3 = 'X';
    end

    switch DecryptedText(2)
        case 0
            ltr4='0';
        case 1
            ltr4 = '1';
        case 2
            ltr4 = '2';
        case 3
            ltr4 = '3';
        case 4
            ltr4 = '4';
        case 5
            ltr4 = '5';
        case 6
            ltr4 = '6';
        case 7
            ltr4 = '7';
        case 8
            ltr4 = '8';
        case 9
            ltr4 = '9';
        case 10
            ltr4 = 'A';
        case 11
            ltr4 = 'B';
        case 12
            ltr4 = 'C';
        case 13
            ltr4 = 'D';
        case 14
            ltr4 = 'E';
        case 15
            ltr4 = 'F';
        otherwise
            ltr4 = 'X';
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    disp('MAC OBTENIDA');
    disp([ltr1,ltr2,ltr3,ltr4]);
    if (PlainText(1)==DecryptedText(1))&&(PlainText(2)==DecryptedText(2))
       disp('Desencriptacion exitosa');

    else
        disp('Desencriptacion fallida'); 
    end
    
    switch nA2
        case '0'
            n1=0;
        case '1'
            n1=1;
        case '2'
            n1=2;
        case '3'
            n1=3;
        case '4'
            n1=4;
        case '5'
            n1=5;
        case '6'
            n1=6;
        case '7'
            n1=7;
        case '8'
            n1=8;
        case '9'
            n1=9;
        case 'A'
            n1=10;
        case 'B'
            n1=11;
        case 'C'
            n1=12;
        case 'D'
            n1=13;
        case 'E'
            n1=14;
        case 'F'
            n1=15;
        otherwise
            n1=00;
    end
    switch nB2
        case '0'
            n2=0;
        case '1'
            n2=1;
        case '2'
            n2=2;
        case '3'
            n2=3;
        case '4'
            n2=4;
        case '5'
            n2=5;
        case '6'
            n2=6;
        case '7'
            n2=7;
        case '8'
            n2=8;
        case '9'
            n2=9;
        case 'A'
            n2=10;
        case 'B'
            n2=11;
        case 'C'
            n2=12;
        case 'D'
            n2=13;
        case 'E'
            n2=14;
        case 'F'
            n2=15;
        otherwise
            n2=00;
    end
    
    nk= n1*numal          % numero concatenar funcion  mac
    nl= n2*numal          %numero concatenar funcion mac
    nx = dec2bin(n1)      %numero a enviar funcion  MAC nueva 
    ny = dec2bin(n2)      %numero a enviar funcion  MAC nueva
    h=str2num(nx)           
    i=str2num(ny)            
    j=bitshift(h,-1)
    k=bitshift(i,-1)
    l=bitshift(j,1)
    m=bitshift(k,1)
    n=num2str(l)
    o=num2str(m)
    p=bin2dec(n)
    q=p/numal
    r1=bin2dec(o)
    s=r1/numal
    pseudo5= num2str(nk);%%CAMBIAR
    pseudo6= num2str(nl);%%CAMBIAR
    enviar5=nx;        %CAMBIAR
    enviar6=nx;        %CAMBIAR

    ModParam=uint64(2^w);

    P=uint64((e-2)*2^w); 
    Q=uint64((gr-2)*2^w+2^w); 

    S=uint64(zeros(1,t)); 
    PlainText=uint64(zeros(1,3));

    DecryptedText=uint64(zeros(1,3)); 

    K=uint64(ones(1,b));

    PlainText(1)=n1; 
    PlainText(2)=n2; 


    S=RC5_Initialize(w,c,b,K,S,P,Q,t,ModParam);

    CryptedText=RC5_Encrypt(S,r,w,PlainText,ModParam);
    disp(['Texto Cifrado: ',num2str(CryptedText(1)),' ',num2str(CryptedText(2))]);
    
    %MAC Ingresada
    disp([nA,nB,nA1,nB1,':']);

    cripto5=num2str(CryptedText(1));
    cripto6=num2str(CryptedText(2));
    
    % Descifrado
    DecryptedText=RC5_Decrypt(S,r,w,CryptedText,ModParam);
    disp(['Texto Descifrado: ',num2str(DecryptedText(1)),' ',num2str(DecryptedText(2))]);
    
    % Cambio de Numeros a letras
    
    switch DecryptedText(1)
        case 0
            ltr5='0';
        case 1
            ltr5 = '1';
        case 2
            ltr5 = '2';
        case 3
            ltr5 = '3';
        case 4
            ltr5 = '4';
        case 5
            ltr5 = '5';
        case 6
            ltr5 = '6';
        case 7
            ltr5 = '7';
        case 8
            ltr5 = '8';
        case 9
            ltr5 = '9';
        case 10
            ltr5 = 'A';
        case 11
            ltr5 = 'B';
        case 12
            ltr5 = 'C';
        case 13
            ltr5 = 'D';
        case 14
            ltr5 = 'E';
        case 15
            ltr5 = 'F';
        otherwise
            ltr5 = 'X';
    end

    switch DecryptedText(2)
        case 0
            ltr6='0';
        case 1
            ltr6 = '1';
        case 2
            ltr6 = '2';
        case 3
            ltr6 = '3';
        case 4
            ltr6 = '4';
        case 5
            ltr6 = '5';
        case 6
            ltr6 = '6';
        case 7
            ltr6 = '7';
        case 8
            ltr6 = '8';
        case 9
            ltr6 = '9';
        case 10
            ltr6 = 'A';
        case 11
            ltr6 = 'B';
        case 12
            ltr6 = 'C';
        case 13
            ltr6 = 'D';
        case 14
            ltr6 = 'E';
        case 15
            ltr6 = 'F';
        otherwise
            ltr6 = 'X';
    end
    
    disp('MAC OBTENIDA');
    disp([ltr1,ltr2,ltr3,ltr4,ltr5,ltr6]);
    if (PlainText(1)==DecryptedText(1))&&(PlainText(2)==DecryptedText(2))
       disp('Desencriptacion exitosa');

    else
        disp('Desencriptacion fallida'); 
    end
    
    switch nA3
        case '0'
            n1=0;
        case '1'
            n1=1;
        case '2'
            n1=2;
        case '3'
            n1=3;
        case '4'
            n1=4;
        case '5'
            n1=5;
        case '6'
            n1=6;
        case '7'
            n1=7;
        case '8'
            n1=8;
        case '9'
            n1=9;
        case 'A'
            n1=10;
        case 'B'
            n1=11;
        case 'C'
            n1=12;
        case 'D'
            n1=13;
        case 'E'
            n1=14;
        case 'F'
            n1=15;
        otherwise
            n1=00;
    end
    switch nB3
        case '0'
            n2=0;
        case '1'
            n2=1;
        case '2'
            n2=2;
        case '3'
            n2=3;
        case '4'
            n2=4;
        case '5'
            n2=5;
        case '6'
            n2=6;
        case '7'
            n2=7;
        case '8'
            n2=8;
        case '9'
            n2=9;
        case 'A'
            n2=10;
        case 'B'
            n2=11;
        case 'C'
            n2=12;
        case 'D'
            n2=13;
        case 'E'
            n2=14;
        case 'F'
            n2=15;
        otherwise
            n2=00;
    end

    nk= n1*numal          % numero concatenar funcion  mac
    nl= n2*numal          %numero concatenar funcion mac
    nx = dec2bin(n1)      %numero a enviar funcion  MAC nueva 
    ny = dec2bin(n2)      %numero a enviar funcion  MAC nueva
    h=str2num(nx)           
    i=str2num(ny)            
    j=bitshift(h,-1)
    k=bitshift(i,-1)
    l=bitshift(j,1)
    m=bitshift(k,1)
    n=num2str(l)
    o=num2str(m)
    p=bin2dec(n)
    q=p/numal
    r1=bin2dec(o)
    s=r1/numal
    pseudo7= num2str(nk);%%CAMBIAR
    pseudo8= num2str(nl);%%CAMBIAR
    enviar7=nx;         %CAMBIAR
    enviar8=nx;         %CAMBIAR


    ModParam=uint64(2^w);

    P=uint64((e-2)*2^w);
    Q=uint64((gr-2)*2^w+2^w);

    S=uint64(zeros(1,t));   
    PlainText=uint64(zeros(1,3));

    DecryptedText=uint64(zeros(1,3)); 

    K=uint64(ones(1,b));

    PlainText(1)=n1;
    PlainText(2)=n2; 


    S=RC5_Initialize(w,c,b,K,S,P,Q,t,ModParam);

    CryptedText=RC5_Encrypt(S,r,w,PlainText,ModParam);
    disp(['Texto Cifrado:  ',num2str(CryptedText(1)),' ',num2str(CryptedText(2))]);
    
    %MAC ingreasda
    disp([nA,nB,nA1,nB1,':']);
    cripto7=num2str(CryptedText(1));
    cripto8=num2str(CryptedText(2));

    

    DecryptedText=RC5_Decrypt(S,r,w,CryptedText,ModParam);
    disp(['Texto Descifrado: ',num2str(DecryptedText(1)),' ',num2str(DecryptedText(2))]);
    
    % Cambo de Numeros a letras
    
    switch DecryptedText(1)
        case 0
            ltr7='0';
        case 1
            ltr7 = '1';
        case 2
            ltr7 = '2';
        case 3
            ltr7 = '3';
        case 4
            ltr7 = '4';
        case 5
            ltr7 = '5';
        case 6
            ltr7 = '6';
        case 7
            ltr7 = '7';
        case 8
            ltr7 = '8';
        case 9
            ltr7 = '9';
        case 10
            ltr7 = 'A';
        case 11
            ltr7 = 'B';
        case 12
            ltr7 = 'C';
        case 13
            ltr7 = 'D';
        case 14
            ltr7 = 'E';
        case 15
            ltr7 = 'F';
        otherwise
            ltr7 = 'X';
    end

    switch DecryptedText(2)
        case 0
            ltr8='0';
        case 1
            ltr8 = '1';
        case 2
            ltr8 = '2';
        case 3
            ltr8 = '3';
        case 4
            ltr8 = '4';
        case 5
            ltr8 = '5';
        case 6
            ltr8 = '6';
        case 7
            ltr8 = '7';
        case 8
            ltr8 = '8';
        case 9
            ltr8 = '9';
        case 10
            ltr8 = 'A';
        case 11
            ltr8 = 'B';
        case 12
            ltr8 = 'C';
        case 13
            ltr8 = 'D';
        case 14
            ltr8 = 'E';
        case 15
            ltr8 = 'F';
        otherwise
            ltr8 = 'X';
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    disp('MAC OBTENIDA');
    disp([ltr7,ltr8]);
    if (PlainText(1)==DecryptedText(1))&&(PlainText(2)==DecryptedText(2))
       disp('Desencriptacion exitosa');

    else
        disp('Desencriptacion fallida'); 
    end
    
    
    switch nA4
        case '0'
            n1=0;
        case '1'
            n1=1;
        case '2'
            n1=2;
        case '3'
            n1=3;
        case '4'
            n1=4;
        case '5'
            n1=5;
        case '6'
            n1=6;
        case '7'
            n1=7;
        case '8'
            n1=8;
        case '9'
            n1=9;
        case 'A'
            n1=10;
        case 'B'
            n1=11;
        case 'C'
            n1=12;
        case 'D'
            n1=13;
        case 'E'
            n1=14;
        case 'F'
            n1=15;
        otherwise
            n1=00;
    end
    switch nB4
        case '0'
            n2=0;
        case '1'
            n2=1;
        case '2'
            n2=2;
        case '3'
            n2=3;
        case '4'
            n2=4;
        case '5'
            n2=5;
        case '6'
            n2=6;
        case '7'
            n2=7;
        case '8'
            n2=8;
        case '9'
            n2=9;
        case 'A'
            n2=10;
        case 'B'
            n2=11;
        case 'C'
            n2=12;
        case 'D'
            n2=13;
        case 'E'
            n2=14;
        case 'F'
            n2=15;
        otherwise
            n2=00;
    end

    nk= n1*numal          % numero concatenar funcion  mac
    nl= n2*numal          %numero concatenar funcion mac
    nx = dec2bin(n1)      %numero a enviar funcion  MAC nueva 
    ny = dec2bin(n2)      %numero a enviar funcion  MAC nueva
    h=str2num(nx)           
    i=str2num(ny)            
    j=bitshift(h,-1)
    k=bitshift(i,-1)
    l=bitshift(j,1)
    m=bitshift(k,1)
    n=num2str(l)
    o=num2str(m)
    p=bin2dec(n)
    q=p/numal
    r1=bin2dec(o)
    s=r1/numal
    pseudo9= num2str(nk);         %CAMBIAR
    pseudo10= num2str(nl);        %CAMBIAR
    enviar9=nx;                   %CAMBIAR
    enviar10=nx;                  %CAMBIAR


    ModParam=uint64(2^w);

    P=uint64((e-2)*2^w); 
    Q=uint64((gr-2)*2^w+2^w); 

    S=uint64(zeros(1,t));  
    PlainText=uint64(zeros(1,3));

    DecryptedText=uint64(zeros(1,3)); 

    K=uint64(ones(1,b));

    PlainText(1)=n1; 
    PlainText(2)=n2; 


    S=RC5_Initialize(w,c,b,K,S,P,Q,t,ModParam);

    CryptedText=RC5_Encrypt(S,r,w,PlainText,ModParam);
    disp(['Texto Cifrado: ',num2str(CryptedText(1)),' ',num2str(CryptedText(2))]);

    %MAC Ingresada 
    disp([nA,nB,nA1,nB1,':']);
    %cIFRADO
    cripto9=num2str(CryptedText(1));
    cripto10=num2str(CryptedText(2));
    
    % Descifrado
    
    DecryptedText=RC5_Decrypt(S,r,w,CryptedText,ModParam);
    disp(['Texto Descifrado: ',num2str(DecryptedText(1)),' ',num2str(DecryptedText(2))]);
    
    % cambio de Numeros a letras 
    
    switch DecryptedText(1)
        case 0
            ltr9='0';
        case 1
            ltr9 = '1';
        case 2
            ltr9 = '2';
        case 3
            ltr9 = '3';
        case 4
            ltr9 = '4';
        case 5
            ltr9 = '5';
        case 6
            ltr9 = '6';
        case 7
            ltr9 = '7';
        case 8
            ltr9 = '8';
        case 9
            ltr9 = '9';
        case 10
            ltr9 = 'A';
        case 11
            ltr9 = 'B';
        case 12
            ltr9 = 'C';
        case 13
            ltr9 = 'D';
        case 14
            ltr9 = 'E';
        case 15
            ltr9 = 'F';
        otherwise
            ltr9 = 'X';
    end

    switch DecryptedText(2)
        case 0
            ltr10='0';
        case 1
            ltr10 = '1';
        case 2
            ltr10 = '2';
        case 3
            ltr10 = '3';
        case 4
            ltr10 = '4';
        case 5
            ltr10 = '5';
        case 6
            ltr10 = '6';
        case 7
            ltr10 = '7';
        case 8
            ltr10 = '8';
        case 9
            ltr10 = '9';
        case 10
            ltr10 = 'A';
        case 11
            ltr10 = 'B';
        case 12
            ltr10 = 'C';
        case 13
            ltr10 = 'D';
        case 14
            ltr10 = 'E';
        case 15
            ltr10 = 'F';
        otherwise
            ltr10 = 'X';
    end
    disp('MAC OBTENIDA');
    disp([ltr7,ltr8,ltr9,ltr10]);
    if (PlainText(1)==DecryptedText(1))&&(PlainText(2)==DecryptedText(2))
       disp('Desencriptacion exitosa');

    else
        disp('Desencriptacion fallida'); 
    end
      switch nA5
        case '0'
            n1=0;
        case '1'
            n1=1;
        case '2'
            n1=2;
        case '3'
            n1=3;
        case '4'
            n1=4;
        case '5'
            n1=5;
        case '6'
            n1=6;
        case '7'
            n1=7;
        case '8'
            n1=8;
        case '9'
            n1=9;
        case 'A'
            n1=10;
        case 'B'
            n1=11;
        case 'C'
            n1=12;
        case 'D'
            n1=13;
        case 'E'
            n1=14;
        case 'F'
            n1=15;
        otherwise
            n1=00;
    end
    switch nB5
        case '0'
            n2=0;
        case '1'
            n2=1;
        case '2'
            n2=2;
        case '3'
            n2=3;
        case '4'
            n2=4;
        case '5'
            n2=5;
        case '6'
            n2=6;
        case '7'
            n2=7;
        case '8'
            n2=8;
        case '9'
            n2=9;
        case 'A'
            n2=10;
        case 'B'
            n2=11;
        case 'C'
            n2=12;
        case 'D'
            n2=13;
        case 'E'
            n2=14;
        case 'F'
            n2=15;
        otherwise
            n2=00;
    end

    nk= n1*numal          % numero concatenar funcion  mac
    nl= n2*numal          %numero concatenar funcion mac
    nx = dec2bin(n1)      %numero a enviar funcion  MAC nueva 
    ny = dec2bin(n2)      %numero a enviar funcion  MAC nueva
    h=str2num(nx)           
    i=str2num(ny)            
    j=bitshift(h,-1)
    k=bitshift(i,-1)
    l=bitshift(j,1)
    m=bitshift(k,1)
    n=num2str(l)
    o=num2str(m)
    p=bin2dec(n)
    q=p/numal
    r1=bin2dec(o)
    s=r1/numal
    pseudo11= num2str(nk);  %CAMBIAR
    pseudo12= num2str(nl);  %CAMBIAR
    enviar11=nx;            %CAMBIAR
    enviar12=nx;            %CAMBIAR

    ModParam=uint64(2^w);

    P=uint64((e-2)*2^w);
    Q=uint64((gr-2)*2^w+2^w); 

    S=uint64(zeros(1,t));   
    PlainText=uint64(zeros(1,3)); 

    DecryptedText=uint64(zeros(1,3)); 

    K=uint64(ones(1,b));

    PlainText(1)=n1; 
    PlainText(2)=n2; 


    S=RC5_Initialize(w,c,b,K,S,P,Q,t,ModParam);

    CryptedText=RC5_Encrypt(S,r,w,PlainText,ModParam);
    disp(['Texto Cifrado: ',num2str(CryptedText(1)),' ',num2str(CryptedText(2))]);
    
    % Cifrado
    cripto11=num2str(CryptedText(1));
    cripto12=num2str(CryptedText(2));

    %MAC Ingresada
    disp([nA,nB,nA1,nB1,':']);
    
    %Descifrado

    DecryptedText=RC5_Decrypt(S,r,w,CryptedText,ModParam);
    disp(['Texto Descifrado: ',num2str(DecryptedText(1)),' ',num2str(DecryptedText(2))]);
    
    % Cambio de Numeros a letras
    
    switch DecryptedText(1)
        case 0
            ltr11='0';
        case 1
            ltr11 = '1';
        case 2
            ltr11 = '2';
        case 3
            ltr11 = '3';
        case 4
            ltr11 = '4';
        case 5
            ltr11 = '5';
        case 6
            ltr11 = '6';
        case 7
            ltr11 = '7';
        case 8
            ltr11 = '8';
        case 9
            ltr11 = '9';
        case 10
            ltr11 = 'A';
        case 11
            ltr11 = 'B';
        case 12
            ltr11 = 'C';
        case 13
            ltr11 = 'D';
        case 14
            ltr11 = 'E';
        case 15
            ltr11 = 'F';
        otherwise
            ltr11 = 'X';
    end

    switch DecryptedText(2)
        case 0
            ltr12='0';
        case 1
            ltr12 = '1';
        case 2
            ltr12 = '2';
        case 3
            ltr12 = '3';
        case 4
            ltr12 = '4';
        case 5
            ltr12 = '5';
        case 6
            ltr12 = '6';
        case 7
            ltr12 = '7';
        case 8
            ltr12 = '8';
        case 9
            ltr12 = '9';
        case 10
            ltr12 = 'A';
        case 11
            ltr12 = 'B';
        case 12
            ltr12 = 'C';
        case 13
            ltr12 = 'D';
        case 14
            ltr12 = 'E';
        case 15
            ltr12 = 'F';
        otherwise
            ltr12 = 'X';
    end

    
    disp('MAC OBTENIDA');
    disp([ltr7,ltr8,ltr9,ltr10,ltr11,ltr12]);
    if (PlainText(1)==DecryptedText(1))&&(PlainText(2)==DecryptedText(2))
       disp('Desencriptacion exitosa');

    else
        disp('Desencriptacion fallida'); 
    end
    
    % Todas las variables del proceso de:
    % Cifrado y Descifrado
    
    letra=strcat(ltr1,ltr2,':',ltr3,ltr4,':',ltr5,ltr6,':',ltr7,ltr8,':',ltr9,ltr10,':',ltr11,ltr12)
    cripto=strcat(cripto1,cripto2,cripto3,cripto4,cripto5,cripto6,cripto7,cripto8,cripto9,cripto10,cripto11,cripto12)
    
%     pseudo=strcat(pseudo1,pseudo2,pseudo3,pseudo4,pseudo5,pseudo6,pseudo7,pseudo8,pseudo9,pseudo10,pseudo11,pseudo12)
%     enviar= strcat(enviar1,enviar2,enviar3,enviar4,enviar5,enviar6,enviar7,enviar8,enviar9,enviar10,enviar11,enviar12)
%     nocripto=strcat(cripto1,cripto2,cripto3,cripto4,cripto5,cripto6,cripto7,cripto8,cripto9,cripto10,cripto11,cripto12)
%     nopseudo=strcat(pseudo1,pseudo2,pseudo3,pseudo4,pseudo5,pseudo6,pseudo7,pseudo8,pseudo9,pseudo10,pseudo11,pseudo12)
    
    % Impreso de valores en los cuadros
    % de texto de la interfaz grafica
    
    set(handles.txtciframac,'string',cripto);
    set(handles.txtdesmac,'string',letra);
    



% GENERACION DE TIEMPOS DE CIFRADO Y DESCIFRADO
tic;
RC5_Encrypt(S,r,w,PlainText,ModParam)
tiempo = toc;

set(handles.timecif,'string',tiempo);

tic;
RC5_Decrypt(S,r,w,CryptedText,ModParam)
tiempo2 = toc;

set(handles.timedesc,'string',tiempo2);
% Creacion de Figura
figure(3)
time=[tiempo,0
      0,tiempo2];
bar(time)
hold on
grid on
legend('Cifrado','Decifrado')
xlabel('Cifrado vs Decifrado')
ylabel('Tiempo (segundos)')
axis([0 3 0 0.1])


% GENERACION DEL TIEMPO DE CPU - CIFRADO Y DESCIFRADO

% Calculo de tiempo CPU - Proceso de Cifrado
% Funcion -> coutime
tStart = cputime;                           % Inicio de funcion cputime
RC5_Encrypt(S,r,w,PlainText,ModParam)       % Llamado a la funcion cifrado
tEnd = cputime - tStart                     % Final de funcion cputime
figure(6)
plot(tEnd,'bo')                             % Grafico de valor
text(1+0.05,tEnd,num2str(tEnd))             % Impresion de valor en el grafico
title('Tiempo de CPU','FontSize',12)  %Titulos a la grafica
ylabel('Tiempo (s)','FontSize',12)
grid on
hold on

% Calculo de tiempo CPU - Proceso de Cifrado
t2Start = cputime;                          % Inicio de funcion cputime
DecryptedText = RC5_Decrypt(S,r,w,CryptedText,ModParam) % Llamado a la funcion descifrado
t2End = cputime - tStart                    % Final de funcion cputime
figure(6)
plot(t2End,'ro')                            % Grafico de valor
text(1+0.05,t2End,num2str(t2End))           % Impresion de valor en el grafico
legend('Tiempo CPU-Cifrado','Tiempo CPU-Decifrado') % Titulos de la grafica
xlabel('Cifrado/Decifrado')
axis([0 2 -1 2])
%Ter

    % VERIFICACION DE DIRECCIONES MAC

    switch letra
    case '00:1A:FF:26:AC:33'
        set(handles.txtalerta,'string','MAC AUTENTICADA');
    case 'AA:08:12:44:AB:41'
        set(handles.txtalerta,'string','MAC AUTENTICADA');
    case '00:1E:C2:28:6B:CC'
        set(handles.txtalerta,'string','MAC AUTENTICADA');
    case 'CC:EC:FA:32:11:01'
        set(handles.txtalerta,'string','MAC AUTENTICADA');
    case'12:01:54:63:AA:BF'
        set(handles.txtalerta,'string','MAC AUTENTICADA');
    case 'EC:B3:1C:20:15:50'
        set(handles.txtalerta,'string','MAC AUTENTICADA');
    case '00:AA:A8:54:E8:A9'
        set(handles.txtalerta,'string','MAC AUTENTICADA');
    case 'FD:12:55:50:AC:BB'
        set(handles.txtalerta,'string','MAC AUTENTICADA');  
    case 'FE:A1:0F:D4:43:00'
        set(handles.txtalerta,'string','MAC AUTENTICADA');
    case '5A:0A:00:39:AE:BA'
        set(handles.txtalerta,'string','MAC AUTENTICADA');
    otherwise
        set(handles.txtalerta,'string',' !! MAC ERRONEA !!');

% tcifrado = @()RC5_Encrypt(S,r,w,PlainText,ModParam);
% tiempo=tcifrado;
% disp('El tiempo cifrado fue: ');
% timeit(tcifrado);

f = @()RC5_Encrypt(S,r,w,PlainText,ModParam);
disp('Tiempo 1')
timeit(f)
% set(handles.txtre,'String',f);  

% tdesci = @()RC5_Decrypt(S,r,w,CryptedText,ModParam);
% disp('El tiempo descifrado fue: ');
% timeit(tdesci)
% set(handles.timecif,'string',tdesci);







end

function txt1_Callback(hObject, eventdata, handles)
% hObject    handle to txt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt1 as text
%        str2double(get(hObject,'String')) returns contents of txt1 as a double


% --- Executes during object creation, after setting all properties.
function txt1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt2_Callback(hObject, eventdata, handles)
% hObject    handle to txt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt2 as text
%        str2double(get(hObject,'String')) returns contents of txt2 as a double


% --- Executes during object creation, after setting all properties.
function txt2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt3_Callback(hObject, eventdata, handles)
% hObject    handle to txt3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt3 as text
%        str2double(get(hObject,'String')) returns contents of txt3 as a double


% --- Executes during object creation, after setting all properties.
function txt3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt4_Callback(hObject, eventdata, handles)
% hObject    handle to txt4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt4 as text
%        str2double(get(hObject,'String')) returns contents of txt4 as a double


% --- Executes during object creation, after setting all properties.
function txt4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt5_Callback(hObject, eventdata, handles)
% hObject    handle to txt5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt5 as text
%        str2double(get(hObject,'String')) returns contents of txt5 as a double


% --- Executes during object creation, after setting all properties.
function txt5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt6_Callback(hObject, eventdata, handles)
% hObject    handle to txt6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt6 as text
%        str2double(get(hObject,'String')) returns contents of txt6 as a double


% --- Executes during object creation, after setting all properties.
function txt6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt7_Callback(hObject, eventdata, handles)
% hObject    handle to txt7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt7 as text
%        str2double(get(hObject,'String')) returns contents of txt7 as a double


% --- Executes during object creation, after setting all properties.
function txt7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt8_Callback(hObject, eventdata, handles)
% hObject    handle to txt8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt8 as text
%        str2double(get(hObject,'String')) returns contents of txt8 as a double


% --- Executes during object creation, after setting all properties.
function txt8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt9_Callback(hObject, eventdata, handles)
% hObject    handle to txt9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt9 as text
%        str2double(get(hObject,'String')) returns contents of txt9 as a double


% --- Executes during object creation, after setting all properties.
function txt9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt10_Callback(hObject, eventdata, handles)
% hObject    handle to txt10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt10 as text
%        str2double(get(hObject,'String')) returns contents of txt10 as a double


% --- Executes during object creation, after setting all properties.
function txt10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt11_Callback(hObject, eventdata, handles)
% hObject    handle to txt11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt11 as text
%        str2double(get(hObject,'String')) returns contents of txt11 as a double


% --- Executes during object creation, after setting all properties.
function txt11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txt12_Callback(hObject, eventdata, handles)
% hObject    handle to txt12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txt12 as text
%        str2double(get(hObject,'String')) returns contents of txt12 as a double


% --- Executes during object creation, after setting all properties.
function txt12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txt12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtciframac_Callback(hObject, eventdata, handles)
% hObject    handle to txtciframac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtciframac as text
%        str2double(get(hObject,'String')) returns contents of txtciframac as a double


% --- Executes during object creation, after setting all properties.
function txtciframac_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtciframac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtdesmac_Callback(hObject, eventdata, handles)
% hObject    handle to txtdesmac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtdesmac as text
%        str2double(get(hObject,'String')) returns contents of txtdesmac as a double


% --- Executes during object creation, after setting all properties.
function txtdesmac_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtdesmac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtalerta_Callback(hObject, eventdata, handles)
% hObject    handle to txtalerta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtalerta as text
%        str2double(get(hObject,'String')) returns contents of txtalerta as a double


% --- Executes during object creation, after setting all properties.
function txtalerta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtalerta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on uitable2 and none of its controls.
function uitable2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when entered data in editable cell(s) in tablamac.
function tablamac_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to tablamac (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in vermac.
function vermac_Callback(hObject, eventdata, handles)
% hObject    handle to vermac (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Creacion de Vectores para Tabla de Direcciones MACs

dispo={'Nodo' 'Nodo' 'Nodo' 'Nodo' 'Nodo' 'Nodo' 'Router Nodo' 'Router Nodo' 'Router Nodo' 'Gateway'};
valor={'00:1A:FF:26:AC:33' 'AA:08:12:44:AB:41' '00:1E:C2:28:6B:CC' 'CC:EC:FA:32:11:01' '12:01:54:63:AA:BF' 'EC:B3:1C:20:15:50' '00:AA:A8:54:E8:A9' 'FD:12:55:50:AC:BB' 'FE:A1:0F:D4:43:00' '5A:0A:00:39:AE:BA'};
datos=[dispo' valor'];

% Mostrar Valores en la tabla
set(handles.tablamac,'data',datos);



function timecif_Callback(hObject, eventdata, handles)
% hObject    handle to timecif (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timecif as text
%        str2double(get(hObject,'String')) returns contents of timecif as a double


% --- Executes during object creation, after setting all properties.
function timecif_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timecif (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timedesc_Callback(hObject, eventdata, handles)
% hObject    handle to timedesc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timedesc as text
%        str2double(get(hObject,'String')) returns contents of timedesc as a double


% --- Executes during object creation, after setting all properties.
function timedesc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timedesc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtre_Callback(hObject, eventdata, handles)
% hObject    handle to txtre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtre as text
%        str2double(get(hObject,'String')) returns contents of txtre as a double


% --- Executes during object creation, after setting all properties.
function txtre_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnti.


% hObject    handle to btnti (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f = @()RC5_Encrypt(S,r,w,PlainText,ModParam); 
timeit(f)
set(handles.txtre,'String',f);  


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Inicio
close(handles.output);
