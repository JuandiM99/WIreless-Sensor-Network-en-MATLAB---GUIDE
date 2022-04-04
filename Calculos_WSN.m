function varargout = Calculos_WSN(varargin)
% CALCULOS_WSN MATLAB code for Calculos_WSN.fig
%      CALCULOS_WSN, by itself, creates a new CALCULOS_WSN or raises the existing
%      singleton*.
%
%      H = CALCULOS_WSN returns the handle to a new CALCULOS_WSN or the handle to
%      the existing singleton*.
%
%      CALCULOS_WSN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CALCULOS_WSN.M with the given input arguments.
%
%      CALCULOS_WSN('Property','Value',...) creates a new CALCULOS_WSN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Calculos_WSN_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Calculos_WSN_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Calculos_WSN

% Last Modified by GUIDE v2.5 25-Mar-2022 22:26:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calculos_WSN_OpeningFcn, ...
                   'gui_OutputFcn',  @Calculos_WSN_OutputFcn, ...
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
clc
clear all;

% --- Executes just before Calculos_WSN is made visible.
function Calculos_WSN_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Calculos_WSN (see VARARGIN)

% Choose default command line output for Calculos_WSN
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Calculos_WSN wait for user response (see UIRESUME)
% uiwait(handles.figure1);

%
axes(handles.axesca); 
bkgrnd=imread('zigbee.PNG'); 
imshow(bkgrnd); 



% --- Outputs from this function are returned to the command line.
function varargout = Calculos_WSN_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


clear all
clc
k=5;
%% Nodos Finales
nodo1x=[50];
nodo1y=[80];

%% NodosRouters
C1x=[100];
C1y=[200];
%% GraficcasNodeRoter
while k>1 
plot(nodo1x,nodo1y,'bo')            % Grafica de Nodos
text(nodo1x,nodo1y,'  Node','Color','blue');    % texto al Nodo
hold on
plot(C1x,C1y);                      % Grafica de Router Nodo
axis([0 200 0 300])
text(C1x,C1y,' Router Node','Color','red');     % Texto al Router Node
plot(nodo1x,nodo1y)                 % Grafica de Roter Nodo
hold on
grid on
pause(2)
comet([nodo1x,C1x],[nodo1y,C1y])      % Generacion de simulacion de comunicacion 
text(C1x+10,C1y+20,'Paquere recibido','Color','black'); % Mensaje de envio de pack
axis([0 200 0 300])
k=k-1;                                % Contador de simulacion
clf(figure(1))                        % Reinicio de simulacion
end
plot(nodo1x,nodo1y,'bo')
text(nodo1x,nodo1y,'  Node','Color','blue');
hold on
plot(C1x,C1y);
axis([0 200 0 300])
text(C1x,C1y,' Router Node','Color','red');
plot(nodo1x,nodo1y)
hold on
grid on
pause(2)
comet([nodo1x,C1x],[nodo1y,C1y])
text(C1x+10,C1y+20,'Paquere recibido','Color','black');
axis([0 200 0 300])


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Generacion de Calculos Vtx

tasapulsos=(100e3/16);  % tasa de simbolo
vtx=tasapulsos*4;       % Calculo de Vtx
set(handles.txtvtx,'String',num2str(vtx));
set(handles.txtrtx,'String',num2str(vtx));

% Tasa Efectiva de Datos
csma_ca=2.368e-3; % CSMA/CA tiempo          
dataframeTx=4.256e-3;   % Tiempo de transmision de tramas dedatos
tiemporespTx=0.192e-3;  % Tiempo de respuesta
ackTx=0.352e-3;         % Tiempo acuse de recibo
t=(csma_ca+dataframeTx+tiemporespTx+ackTx); %Tiempo total

%EfectiveDataRare=(CargaMaximaDatos/TiempoTotal)xTasaBaudios

efectivedatarate=(114*8)/t;

set(handles.txtdata,'String',num2str(efectivedatarate));


function txtvtx_Callback(hObject, eventdata, handles)
% hObject    handle to txtvtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtvtx as text
%        str2double(get(hObject,'String')) returns contents of txtvtx as a double


% --- Executes during object creation, after setting all properties.
function txtvtx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtvtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtdata_Callback(hObject, eventdata, handles)
% hObject    handle to txtdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtdata as text
%        str2double(get(hObject,'String')) returns contents of txtdata as a double


% --- Executes during object creation, after setting all properties.
function txtdata_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtdata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Inicio
close(handles.output);
%%


function txtrtx_Callback(hObject, eventdata, handles)
% hObject    handle to txtrtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtrtx as text
%        str2double(get(hObject,'String')) returns contents of txtrtx as a double


% --- Executes during object creation, after setting all properties.
function txtrtx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtrtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
