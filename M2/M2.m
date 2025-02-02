%% lab 1

% Read the data from the file
filename = 'M2_G3_1.txt';
% Read the data, skipping 4 header lines
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 4);

% Extract variables from the table
t = data.Time;       % Time data
sq = data.Squar;   % Square signal
p = data.P;    % P controller signal
i = data.I;    % I controller signal


% Plot the data
figure;
plot(t, sq, '-o', 'LineWidth', 2, 'Color', 'r', 'DisplayName', 'Square wave'); hold on;
plot(t, p, '-', 'LineWidth', 3, 'Color', 'g', 'DisplayName', 'P');
plot(t, i, '--', 'LineWidth', 2, 'Color', 'b', 'DisplayName', 'I');

% Labels and legend
xlabel('Time (s)');
ylabel('Voltage (V)');
title('TecQuipment CE2000 Data');
grid on;
legend;
hold off;
%%%%%%%%%%%%%%%%%%%%%% below this is just for testing, it has no used

% Find indices for the time interval 23-30 seconds
idx_p = (t >= 13) & (t <= 21);

% Compute the average of P values in the selected interval
avg_p = mean(p(idx_p));

% Display the result
fprintf('Average P value from 13s to 21s: %.4f\n', avg_p);

% Find indices for the time interval 22-32 seconds
idx = (t >= 22) & (t <= 32);

% Extract relevant time and I values
t_selected = t(idx);
I_selected = i(idx);

% Perform linear regression (fit a line y = mx + c)
coeffs = polyfit(t_selected, I_selected, 1); % First-order polynomial fit

% Extract slope (m)
slope_I = coeffs(1);

% Display the result
fprintf('Slope of I with respect to time from 22s to 32s: %.4f\n', slope_I);


%% Lab 2.1 open loop with no clutch (plot input and output only)

% Read the data from the file
filename = 'M2_G3_2(noclutch) open.txt';
% Read the data, skipping 4 header lines
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 4);

% Extract variables from the table
t = data.Time;       % Time data
sq = data.Squar;   % Square signal (input)
veloc = data.veloc;   % Velocity (output)
Vmoto = data.Vmoto;   % Motor voltage
error = data.error;   % Error signal

% Plot the data
figure;
plot(t, sq, '--o', 'LineWidth', 2, 'Color', 'r', 'DisplayName', 'Square wave'); hold on; 
plot(t, veloc, '-.s', 'LineWidth', 2, 'Color', 'g', 'DisplayName', 'Velocity');
plot(t, Vmoto, ':d', 'LineWidth', 2, 'Color', 'b', 'DisplayName', 'Motor Voltage');
plot(t, error, '-^', 'LineWidth', 2, 'Color', 'm', 'DisplayName', 'Error');

% Labels and legend
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Open Loop with no clutch');
grid on;
legend;
hold off;

%% Lab 2.2 open loop with clutch

% Read the data from the file
filename = 'M2_G3_2(clutch) open.txt';
% Read the data, skipping 4 header lines
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 4);

% Extract variables from the table
t = data.Time;       % Time data
sq = data.Squar;   % Square signal (input)
veloc = data.veloc;   % Velocity (output)
Vmoto = data.Vmoto;   % Motor voltage
error = data.error;   % Error signal

% Plot the data
figure;
plot(t, sq, '--o', 'LineWidth', 2, 'Color', 'r', 'DisplayName', 'Square wave'); hold on; 
plot(t, veloc, '-.s', 'LineWidth', 2, 'Color', 'g', 'DisplayName', 'Velocity');
plot(t, Vmoto, ':d', 'LineWidth', 2, 'Color', 'b', 'DisplayName', 'Motor Voltage');
plot(t, error, '-^', 'LineWidth', 2, 'Color', 'm', 'DisplayName', 'Error');

% Labels and legend
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Open Loop with clutch');
grid on;
legend;
hold off;

%% Lab 2.3 close loop with no clutch

% Read the data from the file
filename = 'M2_G3_2(noclutch) close.txt';
% Read the data, skipping 4 header lines
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 4);

% Extract variables from the table
t = data.Time;       % Time data
sq = data.Squar;   % Square signal (input)
veloc = data.veloc;   % Velocity (output)
Vmoto = data.V_mot;   % Motor voltage
error = data.error;   % Error signal 

% Plot the data
figure;
plot(t, sq, '--o', 'LineWidth', 2, 'Color', 'r', 'DisplayName', 'Square wave'); hold on; 
plot(t, veloc, '-.s', 'LineWidth', 2, 'Color', 'g', 'DisplayName', 'Velocity');
plot(t, Vmoto, ':d', 'LineWidth', 2, 'Color', 'b', 'DisplayName', 'Motor Voltage');
plot(t, error, '-^', 'LineWidth', 2, 'Color', 'm', 'DisplayName', 'Error');

% Labels and legend
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Open Loop with no clutch');
grid on;
legend;
hold off;

%% Lab 2.4 close loop with clutch

% Read the data from the file
filename = 'M2_G3_2(clutch) close.txt';
% Read the data, skipping 4 header lines
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 4);

% Extract variables from the table
t = data.Time;       % Time data
sq = data.Squar;   % Square signal (input)
veloc = data.veloc;   % Velocity (output)
Vmoto = data.Vmoto;   % Motor voltage
error = data.error;   % Error signal 

% Plot the data
figure;
plot(t, sq, '--o', 'LineWidth', 2, 'Color', 'r', 'DisplayName', 'Square wave'); hold on; 
plot(t, veloc, '-.s', 'LineWidth', 2, 'Color', 'g', 'DisplayName', 'Velocity');
plot(t, Vmoto, ':d', 'LineWidth', 2, 'Color', 'b', 'DisplayName', 'Motor Voltage');
plot(t, error, '-^', 'LineWidth', 2, 'Color', 'm', 'DisplayName', 'Error');

% Labels and legend
xlabel('Time (s)');
ylabel('Amplitude (V)');
title('Open Loop with clutch');
grid on;
legend;
hold off;