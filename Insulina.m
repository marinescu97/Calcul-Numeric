function varargout = Insulina(varargin)
% INSULINA MATLAB code for Insulina.fig
%      INSULINA, by itself, creates a new INSULINA or raises the existing
%      singleton*.
%
%      H = INSULINA returns the handle to a new INSULINA or the handle to
%      the existing singleton*.
%
%      INSULINA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INSULINA.M with the given input arguments.
%
%      INSULINA('Property','Value',...) creates a new INSULINA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Insulina_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Insulina_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Insulina

% Last Modified by GUIDE v2.5 07-Jun-2020 14:35:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Insulina_OpeningFcn, ...
                   'gui_OutputFcn',  @Insulina_OutputFcn, ...
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


% --- Executes just before Insulina is made visible.
function Insulina_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Insulina (see VARARGIN)

% Choose default command line output for Insulina
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Insulina wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Insulina_OutputFcn(hObject, eventdata, handles) 
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



function concentratia_Callback(hObject, eventdata, handles)
% hObject    handle to concentratia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of concentratia as text
%        str2double(get(hObject,'String')) returns contents of concentratia as a double


% --- Executes during object creation, after setting all properties.
function concentratia_CreateFcn(hObject, eventdata, handles)
% hObject    handle to concentratia (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in import.
function import_Callback(hObject, eventdata, handles)
% hObject    handle to import (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.txt;*.xlsx');
if isequal(file,0)
   return
else
    selectedfile = fullfile(path,file);
    [filepath,name,ext] = fileparts(selectedfile);
    if strcmp(ext,'.txt')
        fileID = fopen(selectedfile);
        C = textscan(fileID,'%f %f %f');
        fclose(fileID);
        t=C{1};
        c=C{2};
    else if strcmp(ext,'.xlsx')
    	t=xlsread(selectedfile, 'A1:A1')
        c=xlsread(selectedfile, 'B1:B1')
        end
    end
        set(handles.timp,'String',t);
        set(handles.concentratia,'String',c);
end


% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
vt=get(handles.timp,'String');
T=str2num(vt);
vc=get(handles.concentratia,'String');
C=str2num(vc);
if T>0 && C>0
timp=[0 T];
cond_initiale=[0;0;0;C];
[t,x]=ode45('ecdifinsulina',timp,cond_initiale)
plot(t,x(:,1))
xlabel('timp (min)');
ylabel('concentratia de insulina')
else
    errordlg('Introduceti valori pozitive!','Eroare');
end



% --- Executes on button press in sterge.
function sterge_Callback(hObject, eventdata, handles)
% hObject    handle to sterge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of sterge
Confirmare = questdlg('Confirmati stergerea?', ...
                         'Confirmare', ...
                         'Da', 'Nu','Da');
switch Confirmare,
     case 'Da',
      set(handles.timp,'String',' ');
      set(handles.concentratia,'String',' ');
     case 'Nu',
      return
end


% --- Executes on button press in text.
function text_Callback(hObject, eventdata, handles)
% hObject    handle to text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of text


% --- Executes on button press in xlsx.
function xlsx_Callback(hObject, eventdata, handles)
% hObject    handle to xlsx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of xlsx


% --- Executes on button press in salvare.
function salvare_Callback(hObject, eventdata, handles)
% hObject    handle to salvare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
     valt = get(handles.timp,'String');
     valc = get(handles.concentratia,'String');
if get(handles.text,'value') == 1
    file = fopen('insulinadata.txt','w');
    fprintf(file,'%s %s',valt,valc);
    fclose(file);
    msgbox('Datele au fost salvate cu succes in format txt!');
end
if get(handles.xlsx,'value') == 1
     values = {valt, valc};
     xlswrite('insulinadata.xlsx', [values]);
     msgbox('Datele au fost salvate cu succes in format xlsx!');
end
