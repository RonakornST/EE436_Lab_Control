%% Plot 
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
plot(setpoint, '-b', 'LineWidth', 2);
xlabel('DataPoints (n)');
ylabel('Voltage (V)');
title('Setpoint Voltage vs DataPoints');
grid on;

% Plot temperature (T1, T2) vs time
subplot(2,1,2); % Second plot
plot(T1, '-r', 'LineWidth', 3, 'DisplayName', 'T1'); hold on;
plot(T2, '-g', 'LineWidth', 3, 'DisplayName', 'T2');
xlabel('DataPoints (n)');
ylabel('Temperature (°C)');
title('Temperature Response (T1, T2) vs DataPoints');
legend;
grid on;
hold off;

% 1V -> 2v at data point number 5377
%% Extract data after 1V -> 2V by slicing
t_ = t(5377:end);
T1_ = T1(5377:end);
T2_ = T2(5377:end);
setpoint_ = setpoint(5377:end);
shutter_ = shutter(5377:end);
%%
% Plot setpoint voltage vs time
t_shift = t_ -t_(0);
figure;
subplot(2,1,1); % First plot in a 2-row, 1-column grid
plot(t_shift, setpoint_, '-b', 'LineWidth', 2);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Setpoint Voltage vs Time');
grid on;

% Plot temperature (T1, T2) vs time
subplot(2,1,2); % Second plot
plot(t_shift, T1_, '-r', 'LineWidth', 3, 'DisplayName', 'T1'); hold on;
plot(t_shift, T2_, '-g', 'LineWidth', 3, 'DisplayName', 'T2');
xlabel('Time (s)');
ylabel('Temperature (°C)');
title('Temperature Response (T1, T2) vs Time');
legend;
grid on;
hold off;