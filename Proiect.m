function varargout = Proiect(varargin)
% PROIECT MATLAB code for Proiect.fig
%      PROIECT, by itself, creates a new PROIECT or raises the existing
%      singleton*.
%
%      H = PROIECT returns the handle to a new PROIECT or the handle to
%      the existing singleton*.
%
%      PROIECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROIECT.M with the given input arguments.
%
%      PROIECT('Property','Value',...) creates a new PROIECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Proiect_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Proiect_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Proiect

% Last Modified by GUIDE v2.5 07-Jun-2020 15:03:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Proiect_OpeningFcn, ...
                   'gui_OutputFcn',  @Proiect_OutputFcn, ...
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


% --- Executes just before Proiect is made visible.
function Proiect_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Proiect (see VARARGIN)

% Choose default command line output for Proiect
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Proiect wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Proiect_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Insulina.
function Insulina_Callback(hObject, eventdata, handles)
% hObject    handle to Insulina (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Insulina

% --- Executes on button press in Bungee.
function Bungee_Callback(hObject, eventdata, handles)
% hObject    handle to Bungee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Bungee
