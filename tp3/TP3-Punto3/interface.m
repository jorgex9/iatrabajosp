% Esta funcion interface es la encargada de desplegar la GUI del ejercicio completo.
function varargout = interface(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_OutputFcn, ...
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

function interface_OpeningFcn(hObject, ~, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
screen=imread('screen.jpg');
axes(handles.axes15);
imshow(screen);

% --- Outputs from this function are returned to the command line.
function varargout = interface_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton2.
function pushbutton11_Callback(hObject, eventdata, handles)
imagen=getimage;
figure(1)
imshow(imagen);
title('INPUT IMAGE WITH NOISE')

%% Convert to gray scale
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end

%% Convert to binary image
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);


%% Remove all object containing fewer than 30 pixels
imagen =bwareaopen(imagen,15);
pause(1)

%% Show image binary image
figure(2)
imshow(imagen);
title('INPUT IMAGE WITHOUT NOISE')

%% Edge detection
Iedge = edge(uint8(imagen));
imshow(~Iedge)

%% Morphology
% * *Image Dilation*
se = strel('square',3);
Iedge2 = imdilate(Iedge, se); 
figure(3)
imshow(~Iedge2);
title('IMAGE DILATION')

% * *Image Filling*
Ifill= imfill(Iedge2,'holes');
figure(4)
imshow(~Ifill)
title('IMAGE FILLING')

Ifill=Ifill & imagen;
figure(5)
imshow(~Ifill);
re=Ifill;

while 1
    %Fcn 'lines' separate lines in text
    [fl re]=lines(re);
    imgn=fl;
    % Label and count connected components
    [L Ne] = bwlabel(imgn);    
    set(handles.text11, 'String',Ne);

%% Objects extraction
axes(handles.axes5);
for n=1:Ne
    [r,c] = find(L==n);
    n1=imgn(min(r):max(r),min(c):max(c));
   %imshow(~n1);
    BW2 = bwmorph(n1,'thin',Inf);
    imrotate(BW2,0);
    imshow(~BW2);
    z=imresize(BW2,[50 50]);
    contents = get(handles.popupmenu5,'String'); 
  popupmenu5value = contents{get(handles.popupmenu5,'Value')};
  switch popupmenu5value
      case 'Salida discreta escalon'
        z=feature_extract(z);
      case 'Salida discreta signo'
        z=feature_extractor(z);
   end
    load ('D:\TP3-Punto3\featureout.mat');
    featureout=z;
    %disp(z);
    save ('D:\TP3-Punto3\featureout.mat','featureout');
    test
    pause(1.5);
end
if isempty(re)  %See variable 're' in Fcn 'lines'
        break
    end    
end
clear all
winopen('D:\TP3-Punto3\output.txt');
close (gcbf)
interface
%set(handles.pushbutton9,'Enable','on')

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function Menu_Callback(hObject, eventdata, handles)
% hObject    handle to Menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in pushbutton6.
function pushbutton12_Callback(hObject, eventdata, handles)
%% reading the image from the user
[filename, pathname] = ...
     uigetfile({'*.jpg';'*.jpeg';'*.png';'*.*'},'Seleccione Imagen de Prueba');
 I=strcat(pathname,filename); 
axes(handles.axes6);
imshow(I);
set(handles.pushbutton13,'Enable','on')
helpdlg('La Imagen fue cargada exitosamente. Proceda a entrenar la Red  ',...
        'Seleccionar Imagen');

% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
axis on
% Hint: place code in OpeningFcn to populate axes3

% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
axis on
% Hint: place code in OpeningFcn to populate axes4

function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
disp(Ne);

% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double

% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes during object creation, after setting all properties.
function text8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes on button press in pushbutton10.
function pushbutton13_Callback(hObject, eventdata, handles)
contents = get(handles.popupmenu5,'String'); 
  popupmenu5value = contents{get(handles.popupmenu5,'Value')};
  switch popupmenu5value
      case 'Salida discreta escalon'
        train
        helpdlg('La Red fue entrenada exitosamente. Click en "Extraer Texto" para procesar la imagen',...
        'Entrenamiento Exitoso');
      case 'Salida discreta signo'
        strain % Pruba de Red
        helpdlg('La Red fue entrenada exitosamente. Click en "Extraer Texto" para procesar la imagen',...
        'Entrenamiento Exitoso');
  end
    set(handles.pushbutton11,'Enable','on')


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4

% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
conf=questdlg('Esta seguro que quiere salir','Exit Image','Si','No','No');
switch conf
    case 'Si'
        close(gcf)
    case 'No'
        return
end

% --------------------------------------------------------------------
function Help_Callback(hObject, eventdata, handles)
% hObject    handle to Help (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open ReadMe.pdf

% --------------------------------------------------------------------
function About_us_Callback(hObject, eventdata, handles)
open aboutus.fig

% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5

% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes when uipanel6 is resized.
function uipanel6_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to uipanel6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
