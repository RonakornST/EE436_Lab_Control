%% Lab 3-1

% Define file name
filename = 'data_motor_step_noclutch.txt';

% Read the data, skipping header lines that is 4 lines  in total
data1 = readtable(filename, 'FileType', 'text', 'HeaderLines', 4);

% Display the data
%disp(data);

% Extract variables from the table
t = data1.Time;
p = data1.position;
rpm = data1.speed;
gen = data1.Func_;


%% Lab 3-2
% Define file name
filename = 'data_motor_sine_load.txt';

% Read the data, skipping 4 header lines
data3 = readtable(filename, 'FileType', 'text', 'HeaderLines', 4);

% Extract variables from the table
t = data3.Time;       % Time data
p = data3.position;   % Position data
rpm = data3.speed;    % Speed data
gen = data3.Func_;    % Generator data
load = data3.Gen_;    % Load data but Matlab read Func_ and Gen_ as 2 different column so the data shift by 1 column

%% Lab 3-3

% Define file name
filename = 'data_motor_step_clutch.txt';

% Read the data, skipping 4 header lines
data2 = readtable(filename, 'FileType', 'text', 'HeaderLines', 4);

% Extract variables from the table
t = data2.Time;       % Time data
p = data2.position;   % Position data
rpm = data2.speed;    % Speed data
gen = data2.Func_;    % Generator data but Matlab read Func_ and Gen_ as 2 different column so the data shift by 1 column
