function varargout = Bungee(varargin)
% BUNGEE MATLAB code for Bungee.fig
%      BUNGEE, by itself, creates a new BUNGEE or raises the existing
%      singleton*.
%
%      H = BUNGEE returns the handle to a new BUNGEE or the handle to
%      the existing singleton*.
%
%      BUNGEE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BUNGEE.M with the given input arguments.
%
%      BUNGEE('Property','Value',...) creates a new BUNGEE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Bungee_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Bungee_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Bungee

% Last Modified by GUIDE v2.5 07-Jun-2020 10:57:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Bungee_OpeningFcn, ...
                   'gui_OutputFcn',  @Bungee_OutputFcn, ...
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


% --- Executes just before Bungee is made visible.
function Bungee_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Bungee (see VARARGIN)

% Choose default command line output for Bungee
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Bungee wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Bungee_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function timp_Callback(hObject, eventdata, handles)
% hObject    handle to timp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timp as text
%        str2double(get(hObject,'String')) returns contents of timp as a double


% --- Executes during object creation, after setting all properties.
function timp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function masa_Callback(hObject, eventdata, handles)
% hObject    handle to masa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of masa as text
%        str2double(get(hObject,'String')) returns contents of masa as a double


% --- Executes during object creation, after setting all properties.
function masa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to masa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function constanta_Callback(hObject, eventdata, handles)
% hObject    handle to constanta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of constanta as text
%        str2double(get(hObject,'String')) returns contents of constanta as a double


% --- Executes during object creation, after setting all properties.
function constanta_CreateFcn(hObject, eventdata, handles)
% hObject    handle to constanta (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in txt.
function txt_Callback(hObject, eventdata, handles)
% hObject    handle to txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.txt;*.xlsx');
if isequal(file,0)
   return
else
    selectedfile = fullfile(path,file);
    [filepath,name,ext] = fileparts(selectedfile);
    if strcmp(ext,'.txt')
        file = fopen(selectedfile);
        C = textscan(file,'%f %f %f');
        fclose(file);
        t=C{1};
        m=C{2};
        k=C{3};
    else if strcmp(ext,'.xlsx')
    	t=xlsread(selectedfile, 'A1:A1')
        m=xlsread(selectedfile, 'B1:B1')
        k=xlsread(selectedfile, 'C1:C1')
        end
    end
    set(handles.timp,'String',t);
    set(handles.masa,'String',m);
    set(handles.constanta,'String',k);
end

% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vt = get(handles.timp,'String');
T = str2num(vt);

vm = get(handles.masa,'String');
m=str2num(vm);

f=fopen('masa.txt','w');
fprintf(f,'%d',m);
fclose(f);

vk = get(handles.constanta,'String');
k=str2num(vk);

if T>0 && m>0 && k>0
[t,xsol]=ode45(@ecdifbungee,[0,T],[-30,0],[],k);
plot(t,50-xsol(:,1))
xlabel('timpul (minute)');
ylabel('inaltimea');
else 
    errordlg('Introduceti valori pozitive!','Eroare');
end


% --- Executes on button press in sterge.
function sterge_Callback(hObject, eventdata, handles)
% hObject    handle to sterge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Confirmare = questdlg('Confirmati stergerea?', ...
                         'Confirmare', ...
                         'Da', 'Nu','Da');
switch Confirmare,
     case 'Da',
     set(handles.timp,'String',' ');
     set(handles.masa,'String',' ');
     set(handles.constanta,'String',' ');
     case 'Nu',
      return
end


% --- Executes on button press in xlsx.
function xlsx_Callback(hObject, eventdata, handles)
% hObject    handle to xlsx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of xlsx


% --- Executes on button press in text.
function text_Callback(hObject, eventdata, handles)
% hObject    handle to text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of text

% --- Executes on button press in salveaza.
function salveaza_Callback(hObject, eventdata, handles)
% hObject    handle to salveaza (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
     valt = get(handles.timp,'String');
     valm = get(handles.masa,'String');
     valk = get(handles.constanta,'String');
if get(handles.text,'value') == 1
    file = fopen('bungeedata.txt','w');
    fprintf(file,'%s %s %s',valt,valm,valk);
    fclose(file);
    msgbox('Datele au fost salvate cu succes in format txt!');
end
if get(handles.xlsx,'value') == 1
     values = {valt, valm, valk};
     xlswrite('bungeedata.xlsx', [values]);
     msgbox('Datele au fost salvate cu succes in format xlsx!');
end
