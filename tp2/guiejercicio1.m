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

% Last Modified by GUIDE v2.5 08-May-2016 19:24:57

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
handles.rules = 0;
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
var = handles.var1(part,:);
partname= handles.var1name{part};
set(handles.pt1,'String',int2str(var(1)));
set(handles.pt2,'String',int2str(var(2)));
set(handles.pt3,'String',int2str(var(3)));
set(handles.namePart,'String',partname);

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
paramT1(1) = str2num(get(handles.pt1,'String'));
paramT1(2) = str2num(get(handles.pt2,'String'));
paramT1(3) = str2num(get(handles.pt3,'String'));
hold all

var1 = handles.var1;
var1name= handles.var1name;
numPart1 = get(handles.numpart1,'Value');
x1 = 0:0.1: handles.rmax1;
y1 = triangulo(x1,paramT1);
switch numPart1
    case 1
        plot(handles.axesvar1,x1,y1,'-m')
        var1(1,:) = paramT1;
        var1name{1} = get(handles.namePart,'String');
    case 2
        plot(handles.axesvar1,x1,y1,'-r')
        var1(2,:) = paramT1;
        var1name{2} = get(handles.namePart,'String');
    case 3
        plot(handles.axesvar1,x1,y1,'-g')
        var1(3,:) = paramT1;
        var1name{3} = get(handles.namePart,'String');
    case 4
        plot(handles.axesvar1,x1,y1,'-b')
        var1(4,:) = paramT1;
        var1name{4} = get(handles.namePart,'String');

    case 5
        plot(handles.axesvar1,x1,y1,'-y')
        var1(5,:) = paramT1;
        var1name{5} = get(handles.namePart,'String');

    case 6
        plot(handles.axesvar1,x1,y1,'-c')
        var1(6,:) = paramT1;
        var1name{6} = get(handles.namePart,'String');

    case 7
        plot(handles.axesvar1,x1,y1,'-k')
        var1(7,:) = paramT1;
        var1name{7} = get(handles.namePart,'String');

end

handles.var1 = var1;
handles.var1name = var1name;
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
hold on
axis(handles.axesvar1,[rmin1 rmax1 0 1]);% rango[xmin xmax ymin ymax]

var1= zeros(cantPart,3);
for i = 1:cantPart
    menupart{i}= strcat('particion  ',int2str(i));
end 
set(handles.numpart1,'String',menupart);
set(handles.namePart,'String',menupart{1});
set(handles.pt1,'String','0');
set(handles.pt2,'String','0');
set(handles.pt3,'String','0');
set(handles.listbox3,'String',menupart);
handles.rmin1 = rmin1;
handles.rmax1 = rmax1;
handles.var1 = var1;
handles.var1name = menupart;
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



function var3pt3_Callback(hObject, eventdata, handles)
% hObject    handle to var3pt3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of var3pt3 as text
%        str2double(get(hObject,'String')) returns contents of var3pt3 as a double


% --- Executes during object creation, after setting all properties.
function var3pt3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to var3pt3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function var3pt2_Callback(hObject, eventdata, handles)
% hObject    handle to var3pt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of var3pt2 as text
%        str2double(get(hObject,'String')) returns contents of var3pt2 as a double


% --- Executes during object creation, after setting all properties.
function var3pt2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to var3pt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function var3pt1_Callback(hObject, eventdata, handles)
% hObject    handle to var3pt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of var3pt1 as text
%        str2double(get(hObject,'String')) returns contents of var3pt1 as a double


% --- Executes during object creation, after setting all properties.
function var3pt1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to var3pt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
paramT3(1) = str2num(get(handles.var3pt1,'String'));
paramT3(2) = str2num(get(handles.var3pt2,'String'));
paramT3(3) = str2num(get(handles.var3pt3,'String'));
hold on

var3 = handles.var3;
var3name= handles.var3name;
% partname = array(length(var1));
numPart3 = get(handles.numpart3,'Value');
x1 = 0:0.1: handles.rmax3;
y1 = triangulo(x1,paramT3);
switch numPart3
    case 1
        plot(handles.axesvar3,x1,y1,'-m')
        var3(1,:) = paramT3;
        var3name{1} = get(handles.namePart3,'String');
    case 2
        plot(handles.axesvar3,x1,y1,'-r')
        var3(2,:) = paramT3;
        var3name{2} = get(handles.namePart3,'String');
    case 3
        plot(handles.axesvar3,x1,y1,'-g')
        var3(3,:) = paramT3;
        var3name{3} = get(handles.namePart3,'String');
    case 4
        plot(handles.axesvar3,x1,y1,'-b')
        var3(4,:) = paramT3;
        var3name{4} = get(handles.namePart3,'String');

    case 5
        plot(handles.axesvar3,x1,y1,'-y')
        var3(5,:) = paramT3;
        var3name{5} = get(handles.namePart3,'String');

    case 6
        plot(handles.axesvar3,x1,y1,'-c')
        var3(6,:) = paramT3;
        var3name{6} = get(handles.namePart3,'String');

    case 7
        plot(handles.axesvar3,x1,y1,'-k')
        var3(7,:) = paramT3;
        var3name{7} = get(handles.namePart3,'String');

end

handles.var3 = var3;
handles.var3name = var3name;
guidata(hObject, handles);



function namePart3_Callback(hObject, eventdata, handles)
% hObject    handle to numpart3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numpart3 as text
%        str2double(get(hObject,'String')) returns contents of numpart3 as a double


% --- Executes during object creation, after setting all properties.
function namePart3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numpart3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in numpart3.
function numpart3_Callback(hObject, eventdata, handles)
% hObject    handle to numpart3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
part = get(handles.numpart3,'Value');
var = handles.var3(part,:);
partname= handles.var3name{part};
set(handles.var3pt1,'String',int2str(var(1)));
set(handles.var3pt2,'String',int2str(var(2)));
set(handles.var3pt3,'String',int2str(var(3)));
set(handles.namePart3,'String',partname);

% Hints: contents = cellstr(get(hObject,'String')) returns numpart3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from numpart3


% --- Executes during object creation, after setting all properties.
function numpart3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numpart3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max3_Callback(hObject, eventdata, handles)
% hObject    handle to max3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max3 as text
%        str2double(get(hObject,'String')) returns contents of max3 as a double


% --- Executes during object creation, after setting all properties.
function max3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min3_Callback(hObject, eventdata, handles)
% hObject    handle to min3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min3 as text
%        str2double(get(hObject,'String')) returns contents of min3 as a double


% --- Executes during object creation, after setting all properties.
function min3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
var3name = get(handles.var3nom,'String');
cantPart = get(handles.popupmenu5,'Value');
rmin3 = str2num(get(handles.min3,'String'));
rmax3 = str2num(get(handles.max3,'String'));
axis(handles.axesvar3,[rmin3 rmax3 0 1]);% rango[xmin xmax ymin ymax]

var3= zeros(cantPart,3);
for i = 1:cantPart
    menupart3{i}= strcat('particion  ',int2str(i));
end 
set(handles.numpart3,'String',menupart3);
set(handles.namePart3,'String',menupart3{1});
set(handles.var3pt1,'String','0');
set(handles.var3pt2,'String','0');
set(handles.var3pt3,'String','0');
set(handles.listbox5,'String',menupart3);

handles.rmin3 = rmin3;
handles.rmax3 = rmax3;
handles.var3 = var3;
handles.var3name = menupart3;
guidata(hObject, handles);


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function var3nom_Callback(hObject, eventdata, handles)
% hObject    handle to var3nom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of var3nom as text
%        str2double(get(hObject,'String')) returns contents of var3nom as a double


% --- Executes during object creation, after setting all properties.
function var3nom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to var3nom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function var2pt3_Callback(hObject, eventdata, handles)
% hObject    handle to var2pt3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of var2pt3 as text
%        str2double(get(hObject,'String')) returns contents of var2pt3 as a double


% --- Executes during object creation, after setting all properties.
function var2pt3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to var2pt3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function var2pt2_Callback(hObject, eventdata, handles)
% hObject    handle to var2pt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of var2pt2 as text
%        str2double(get(hObject,'String')) returns contents of var2pt2 as a double


% --- Executes during object creation, after setting all properties.
function var2pt2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to var2pt2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function var2pt1_Callback(hObject, eventdata, handles)
% hObject    handle to var2pt1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of var2pt1 as text
%        str2double(get(hObject,'String')) returns contents of var2pt1 as a double


% --- Executes during object creation, after setting all properties.
function var2pt1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to var2pt1 (see GCBO)
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
paramT2(1) = str2num(get(handles.var2pt1,'String'));
paramT2(2) = str2num(get(handles.var2pt2,'String'));
paramT2(3) = str2num(get(handles.var2pt3,'String'));
hold on

var2 = handles.var2;
var2name= handles.var2nom;
% partname = array(length(var1));
numPart2 = get(handles.numpart2,'Value');
x1 = 0:0.1: handles.rmax2;
y1 = triangulo(x1,paramT2);
switch numPart2
    case 1
        plot(handles.axesvar2,x1,y1,'-m')
        var2(1,:) = paramT2;
        var2name{1} = get(handles.namePart2,'String');
    case 2
        plot(handles.axesvar2,x1,y1,'-r')
        var2(2,:) = paramT2;
        var2name{2} = get(handles.namePart2,'String');
    case 3
        plot(handles.axesvar2,x1,y1,'-g')
        var2(3,:) = paramT2;
        var2name{3} = get(handles.namePart2,'String');
    case 4
        plot(handles.axesvar2,x1,y1,'-b')
        var2(4,:) = paramT2;
        var2name{4} = get(handles.namePart2,'String');

    case 5
        plot(handles.axesvar2,x1,y1,'-y')
        var2(5,:) = paramT2;
        var2name{5} = get(handles.namePart2,'String');

    case 6
        plot(handles.axesvar2,x1,y1,'-c')
        var2(6,:) = paramT2;
        var2name{6} = get(handles.namePart2,'String');

    case 7
        plot(handles.axesvar2,x1,y1,'-k')
        var2(7,:) = paramT2;
        var2name{7} = get(handles.namePart2,'String');

end

handles.var2 = var2;
handles.var2nom = var2name;
guidata(hObject, handles);




function namePart2_Callback(hObject, eventdata, handles)
% hObject    handle to namePart2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of namePart2 as text
%        str2double(get(hObject,'String')) returns contents of namePart2 as a double


% --- Executes during object creation, after setting all properties.
function namePart2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to namePart2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in numpart2.
function numpart2_Callback(hObject, eventdata, handles)
% hObject    handle to numpart2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
part = get(handles.numpart2,'Value');
var = handles.var2(part,:);
partname= handles.var2nom{part};
set(handles.var2pt1,'String',int2str(var(1)));
set(handles.var2pt2,'String',int2str(var(2)));
set(handles.var2pt3,'String',int2str(var(3)));
set(handles.namePart2,'String',partname);





% --- Executes during object creation, after setting all properties.
function numpart2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numpart2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max2_Callback(hObject, eventdata, handles)
% hObject    handle to max2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max2 as text
%        str2double(get(hObject,'String')) returns contents of max2 as a double


% --- Executes during object creation, after setting all properties.
function max2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function min2_Callback(hObject, eventdata, handles)
% hObject    handle to min2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min2 as text
%        str2double(get(hObject,'String')) returns contents of min2 as a double


% --- Executes during object creation, after setting all properties.
function min2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
var2name = get(handles.var2nom,'String');
cantPart = get(handles.popupmenu3,'Value');
rmin2 = str2num(get(handles.min2,'String'));
rmax2 = str2num(get(handles.max2,'String'));
axis(handles.axesvar2,[rmin2 rmax2 0 1]);% rango[xmin xmax ymin ymax]

var2= zeros(cantPart,3);
for i = 1:cantPart
    menupart2{i}= strcat('particion  ',int2str(i));
end 
set(handles.numpart2,'String',menupart2);
set(handles.namePart2,'String',menupart2{1});
set(handles.var2pt1,'String','0');
set(handles.var2pt2,'String','0');
set(handles.var2pt3,'String','0');
set(handles.listbox4,'String',menupart2);
handles.rmin2 = rmin2;
handles.rmax2 = rmax2;
handles.var2 = var2;
handles.var2nom = menupart2;
guidata(hObject, handles);



% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function var2nom_Callback(hObject, eventdata, handles)
% hObject    handle to var2nom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of var2nom as text
%        str2double(get(hObject,'String')) returns contents of var2nom as a double


% --- Executes during object creation, after setting all properties.
function var2nom_CreateFcn(hObject, eventdata, handles)
% hObject    handle to var2nom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
var1partnum = get(handles.listbox3,'Value');
list1 = get(handles.listbox3,'String');
iselected1 = list1(var1partnum:var1partnum,1:end);

var2partnum = get(handles.listbox4,'Value');
list2= get(handles.listbox4,'String');
iselected2 = list2(var2partnum:var2partnum,1:end);


var3partnum = get(handles.listbox5,'Value');
list3 = get(handles.listbox5,'String');
iselected3 = list3(var3partnum:var3partnum,1:end);


sizeOld = size(get(handles.listbox1,'String'),1);
% if sizeold ==0
%     new =  strcat('if (',iselected1,') and (',iselected2,') then (',iselected3,')');
% end
old =  get(handles.listbox1,'String');
new = strcat('if (',iselected1,') and (',iselected2,') then (',iselected3,')');
new = vertcat(old , new);
set(handles.listbox1,'String',new);

rules =  [var1partnum var2partnum var3partnum];
if handles.rules == 0
    handles.rules = rules;
else
    handles.rules = vertcat(handles.rules, rules);
end

guidata(hObject, handles);




% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox5.
function listbox5_Callback(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox5


% --- Executes during object creation, after setting all properties.
function listbox5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function entrada1_Callback(hObject, eventdata, handles)
% hObject    handle to entrada1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of entrada1 as text
%        str2double(get(hObject,'String')) returns contents of entrada1 as a double


% --- Executes during object creation, after setting all properties.
function entrada1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to entrada1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function entrada2_Callback(hObject, eventdata, handles)
% hObject    handle to entrada2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of entrada2 as text
%        str2double(get(hObject,'String')) returns contents of entrada2 as a double


% --- Executes during object creation, after setting all properties.
function entrada2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to entrada2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
entrada1 = get(handles.entrada1,'String');
entrada2 = get(handles.entrada2,'String');
mreglas = handles.rules;
temp = handles.var1;
vel = handles.var2;
acel = handles.var3;
x= 0:0.1:handles.max1;

for i = 1:size(mreglas,1)
    p1=mreglas(i,1);
    mu1=triangulo(entrada1,temp(p1,:));
    p2=mreglas(i,2);
    mu2=triangulo(entrada2,vel(p2,:));
    
    p3=mreglas(i,3);
    mu3= min (mu1,mu2);
    salida(i,:)= cortef(x,triangulo(x,acel(p3,:)),mu3); 
end

% Se debe  realizar ahora la composicion del la salida total fuzzy por AND
yfuzzy = min(salida);
plot(x,yfuzzy);
% Se calcula el centro de masa, para obtener el valor de variable crisp de
% salida.
xCrisp= centroMasa(x,yfuzzy);
set(handles.salida,'String',xCrisp);
guidata(hObject, handles);





function salida_Callback(hObject, eventdata, handles)
% hObject    handle to salida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of salida as text
%        str2double(get(hObject,'String')) returns contents of salida as a double


% --- Executes during object creation, after setting all properties.
function salida_CreateFcn(hObject, eventdata, handles)
% hObject    handle to salida (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
