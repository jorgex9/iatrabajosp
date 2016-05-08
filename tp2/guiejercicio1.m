function varargout = guiejercicio1(varargin)
%GUIEJERCICIO1 M-file for guiejercicio1.fig
%      GUIEJERCICIO1, by itself, creates a new GUIEJERCICIO1 or raises the existing
%      singleton*.
%
%      H = GUIEJERCICIO1 returns the handle to a new GUIEJERCICIO1 or the handle to
%      the existing singleton*.
%
%      GUIEJERCICIO1('Property','Value',...) creates a new GUIEJERCICIO1 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to guiejercicio1_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUIEJERCICIO1('CALLBACK') and GUIEJERCICIO1('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUIEJERCICIO1.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiejercicio1

% Last Modified by GUIDE v2.5 08-May-2016 12:24:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiejercicio1_OpeningFcn, ...
                   'gui_OutputFcn',  @guiejercicio1_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before guiejercicio1 is made visible.
function guiejercicio1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for guiejercicio1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiejercicio1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiejercicio1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in numpart1.
function numpart1_Callback(hObject, eventdata, handles)
% hObject    handle to numpart1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
part = get(handles.numpart1,'Value');
var1 = handles.var1;
set(handles.pt1,'String',int2str(var1(part,1)));
set(handles.pt2,'String',int2str(var1(part,2)));
set(handles.pt3,'String',int2str(var1(part,3)));

% Hints: contents = cellstr(get(hObject,'String')) returns numpart1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from numpart1


% --- Executes during object creation, after setting all properties.
function numpart1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numpart1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function namePart_Callback(hObject, eventdata, handles)
% hObject    handle to namePart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of namePart as text
%        str2double(get(hObject,'String')) returns contents of namePart as a double


% --- Executes during object creation, after setting all properties.
function namePart_CreateFcn(hObject, eventdata, handles)
% hObject    handle to namePart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
paramT1(1)= str2num(get(handles.pt1,'String'));
paramT1(2) = str2num(get(handles.pt2,'String'));
paramT1(3) = str2num(get(handles.pt3,'String'));
hold on

var1 = handles.var1;
numPart1 = get(handles.numpart1,'Value');
x1 = 0:0.1: handles.rmax1;
y1 = triangulo(x1,paramT1);
switch numPart1
    case 1
        plot(handles.axesvar1,x1,y1,'-m')
        var1(1,:) = paramT1;
    case 2
        plot(handles.axesvar1,x1,y1,'-r')
        var1(2,:) = paramT1;
    case 3
        plot(handles.axesvar1,x1,y1,'-g')
        var1(3,:) = paramT1;
    case 4
        plot(handles.axesvar1,x1,y1,'-b')
        var1(4,:) = paramT1;
    case 5
        plot(handles.axesvar1,x1,y1,'-y')
        var1(5,:) = paramT1;
    case 6
        plot(handles.axesvar1,x1,y1,'-c')
        var1(6,:) = paramT1;
    case 7
        plot(handles.axesvar1,x1,y1,'-k')
        var1(7,:) = paramT1;
end

handles.var1 = var1;
guidata(hObject, handles);


function pt1_Callback(hObject, eventdata, handles)
% hObject    handle to pt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pt1 as text
%        str2double(get(hObject,'String')) returns contents of pt1 as a double


% --- Executes during object creation, after setting all properties.
function pt1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function var1nom_Callback(hObject, eventdata, handles)
% hObject    handle to var1nom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of var1nom as text
%        str2double(get(hObject,'String')) returns contents of var1nom as a double


% --- Executes during object creation, after setting all properties.
function var1nom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to var1nom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


var1name = get(handles.var1nom,'String');
cantPart = get(handles.popupmenu1,'Value');
rmin1 = str2num(get(handles.min1,'String'));
rmax1 = str2num(get(handles.max1,'String'));
axis(handles.axesvar1,[rmin1 rmax1 0 1]);% rango[xmin xmax ymin ymax]

var1= zeros(cantPart,3);
for i = 1:cantPart
    menupart{i}= strcat('particion  ',int2str(i));
end 
set(handles.numpart1,'String',menupart);

handles.rmin1 = rmin1;
handles.rmax1 = rmax1;
handles.var1 = var1;
guidata(hObject, handles);



function min1_Callback(hObject, eventdata, handles)
% hObject    handle to min1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min1 as text
%        str2double(get(hObject,'String')) returns contents of min1 as a double


% --- Executes during object creation, after setting all properties.
function min1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max1_Callback(hObject, eventdata, handles)
% hObject    handle to max1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max1 as text
%        str2double(get(hObject,'String')) returns contents of max1 as a double


% --- Executes during object creation, after setting all properties.
function max1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pt2_Callback(hObject, eventdata, handles)
% hObject    handle to pt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pt2 as text
%        str2double(get(hObject,'String')) returns contents of pt2 as a double


% --- Executes during object creation, after setting all properties.
function pt2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pt3_Callback(hObject, eventdata, handles)
% hObject    handle to pt3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pt3 as text
%        str2double(get(hObject,'String')) returns contents of pt3 as a double


% --- Executes during object creation, after setting all properties.
function pt3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pt3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
