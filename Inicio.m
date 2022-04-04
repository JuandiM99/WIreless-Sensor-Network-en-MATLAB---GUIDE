function varargout = Inicio(varargin)
% INICIO MATLAB code for Inicio.fig
%      INICIO, by itself, creates a new INICIO or raises the existing
%      singleton*.
%
%      H = INICIO returns the handle to a new INICIO or the handle to
%      the existing singleton*.
%
%      INICIO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INICIO.M with the given input arguments.
%
%      INICIO('Property','Value',...) creates a new INICIO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Inicio_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Inicio_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Inicio

% Last Modified by GUIDE v2.5 24-Mar-2022 07:56:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Inicio_OpeningFcn, ...
                   'gui_OutputFcn',  @Inicio_OutputFcn, ...
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



% --- Executes just before Inicio is made visible.
function Inicio_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Inicio (see VARARGIN)

% Choose default command line output for Inicio
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Inicio wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Inicio_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
% IMPLEMENTACION DE IMAGENES EN LA INTERFAZ
axes(handles.axes1); 
bkgrnd=imread('utn.PNG'); 
imshow(bkgrnd);

axes(handles.axes2); 
bkgrnd=imread('wsn.JPG'); 
imshow(bkgrnd); 

axes(handles.citel); 
bkgrnd=imread('citel.PNG'); 
imshow(bkgrnd); 



% --- Executes on button press in btnred.
function btnred_Callback(hObject, eventdata, handles)
% hObject    handle to btnred (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clc ;
clear all ;

%% ParametrosEnergia
packs=0;            % numero de packs
tampacks=200;       % Tamaño de packs
Enodo=30*10e-3;     % Energia x nodo
Eronda=[];
Etotal=0;           % Energia total

%% NodosFinales
nodo1x=[50 75 50 25 150];
nodo1y=[80 250 400 200 150];
tam=length(nodo1x);
nodo2x=[120 200 180 260 260];
nodo2y=[320 360 450 360 300];

nodo3x=[150 240 275 160 300];
nodo3y=[50 220 60 200 140];

%% NodosRouters
C1x=[100];
C1y=[200];
C2x=[180];
C2y=[280];
C3x=[230];
C3y=[120];


%% NodosGateway
Gx=[300];
Gy=[250];

%% Grafica
plot(Gx,Gy,'go');
k=5;
figure(1)
%% IncioDeGrafica
while k>1 
    
title('Redes de Sensores Inalambricos - Topologia Arbol','FontSize',14)
xlabel('Distancia (m)','FontSize',14);
ylabel('Distancia (m)','FontSize',14);
grid on
text(Gx,Gy,' Gateway', 'Color','blue','FontSize',13);
hold on
%% GraficcasNodeRoter
plot(C1x,C1y);
text(C1x,C1y,' Router Node','Color','red');
hold on
plot(C2x,C2y);
text(C2x,C2y,' Router Node','Color','red');
plot(C3x,C3y);
text(C3x,C3y,' Router Node','Color','red');
%% GraficarTodosLosNodos
for i=1:5
   plot(nodo1x(i),nodo1y(i),'ro')
   text(nodo1x(i),nodo1y(i),' Nodo ')
   plot(nodo2x(i),nodo2y(i),'ro')
   text(nodo2x(i),nodo2y(i),' Nodo')
   plot(nodo3x(i),nodo3y(i),'ro')
   text(nodo3x(i),nodo3y(i),' Nodo')
   hold on
   axis([0 350 0 500])
end
%% GraficarNodos-NodosRouters
for i=1:5
   plot(nodo1x(i),nodo1y(i))
   plot(nodo2x(i),nodo2y(i));
   plot(nodo3x(i),nodo3y(i));
   hold on
   axis([0 350 0 500])
   pause(0.1)
   comet([nodo1x(i),C1x],[nodo1y(i),C1y])
   comet([nodo2x(i),C2x],[nodo2y(i),C2y])
   comet([nodo3x(i),C3x],[nodo3y(i),C3y])
   Etotal(i)=i*3*Enodo;
   axis([0 350 0 500])
end
%% NodoRouter-NodoRouter
for i=1:1
   line([C1x(i),C2x(i)],[C1y(i),C2y(i)],'Color','red','LineStyle','-')
   line([C2x(i),C3x(i)],[C2y(i),C3y(i)],'Color','red','LineStyle','-')
end

%% NodoRouter-Gateway
for i=1:1
   line([C2x(i),Gx(i)],[C2y(i),Gy(i)],'Color','blue','LineStyle','-')
   line([C3x(i),Gx(i)],[C3y(i),Gy(i)],'Color','blue','LineStyle','-')
end
axis([0 350 0 500])
% line(x,y,'Color','red','LineStyle','--')

%% ContadorDeRepeticiones
k=k-1;
clf(figure(1))
end
%% Generacion de Nueva grafica Final
title('Redes de Sensores Inalambricos - Topologia Arbol','FontSize',14)
xlabel('Distancia (m)','FontSize',14);
ylabel('Distancia (m)','FontSize',14);
grid on
text(Gx,Gy,' Gateway', 'Color','blue','FontSize',13);
% text(2,8,'A Simple Plot','Color','red','FontSize',14)
hold on
% GraficcasNodeRoter
plot(C1x,C1y);
text(C1x,C1y,' Router Node','Color','red');
hold on
plot(C2x,C2y);
text(C2x,C2y,' Router Node','Color','red');
plot(C3x,C3y);
text(C3x,C3y,' Router Node','Color','red');
% GraficarTodosLosNodos
for i=1:5
   plot(nodo1x(i),nodo1y(i),'ro')
   text(nodo1x(i),nodo1y(i),' Nodo')
   plot(nodo2x(i),nodo2y(i),'ro')
   text(nodo2x(i),nodo2y(i),' Nodo')
   plot(nodo3x(i),nodo3y(i),'ro')
   text(nodo3x(i),nodo3y(i),' Nodo')
   hold on
   axis([0 350 0 500])
end
% GraficarNodos-NodosRouters
for i=1:5
   plot(nodo1x(i),nodo1y(i))
   plot(nodo2x(i),nodo2y(i));
   plot(nodo3x(i),nodo3y(i));
   hold on
   axis([0 350 0 500])
   pause(0.1)
   comet([nodo1x(i),C1x],[nodo1y(i),C1y])
   comet([nodo2x(i),C2x],[nodo2y(i),C2y])
   comet([nodo3x(i),C3x],[nodo3y(i),C3y])
   Etotal(i)=i*3*Enodo;
   axis([0 350 0 500])
end
% NodoRouter-NodoRouter
for i=1:1
   line([C1x(i),C2x(i)],[C1y(i),C2y(i)],'Color','red','LineStyle','-')
   line([C2x(i),C3x(i)],[C2y(i),C3y(i)],'Color','red','LineStyle','-')
end

% NodoRouter-Gateway
for i=1:1
   line([C2x(i),Gx(i)],[C2y(i),Gy(i)],'Color','blue','LineStyle','-')
   line([C3x(i),Gx(i)],[C3y(i),Gy(i)],'Color','blue','LineStyle','-')
end
axis([0 350 0 500])


%% ConsumodeEnergia
for i=0:tam
    T=i*Etotal
end
figure(2)
t=[1:1:5];
plot(t,T,'ro--')
title('Consumo de Energia de la Red')
xlabel('Numero de rondas')
ylabel('Energia W')
grid on
axis([0 10 0 40])


% --- Executes on button press in btncifrado.
function btncifrado_Callback(hObject, eventdata, handles)
% hObject    handle to btncifrado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% FUNCION CIFRADO
CifradoRC5


% --- Executes on button press in btncalculos.
function btncalculos_Callback(hObject, eventdata, handles)
% hObject    handle to btncalculos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Calculos_WSN
