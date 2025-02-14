%% lab1

% Read the data from the file
filename = 'data_thermal_labp1_setpoint.txt';

% Read the data, skipping 4 header lines
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 4);

% Extract variables from the table, excluding the last data point
t = data.Time(1:end-1);        % Time data
T1 = data.T1(1:end-1);         % Temperature T1
T2 = data.T2(1:end-1);         % Temperature T2
setpoint = data.setpoint(1:end-1);  % Setpoint voltage
shutter = data.shutter(1:end-1);    % Shutter position

% Plot setpoint voltage vs time
figure;
subplot(2,1,1); % First plot in a 2-row, 1-column grid
plot(t, setpoint, '-b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Setpoint Voltage vs Time');
grid on;

% Plot temperature (T1, T2) vs time
subplot(2,1,2); % Second plot
plot(t, T1, '-r', 'LineWidth', 3, 'DisplayName', 'T1'); hold on;
plot(t, T2, '-g', 'LineWidth', 3, 'DisplayName', 'T2');
xlabel('Time (s)');
ylabel('Temperature (°C)');
title('Temperature Response (T1, T2) vs Time');
legend;
grid on;
hold off;

%% lab1 note

%537.50    2.915    2.820    1.000   10.000    2.915
%537.60    2.915    2.820    2.000   10.000    2.915
