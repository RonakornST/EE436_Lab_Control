%% Lab1 

% Data for Vin and RPM
vin = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10, 0.31, -0.19];
rpm = [150, 351, 555, 759, 965, 1160, 1358, 1563, 1764, 1965, ...
      -163, -365, -565, -766, -970, -1160, -1362, -1565, -1766, -1966, 0, 0];

% Sort data by Vin
[vin_sorted, sort_idx] = sort(vin);
rpm_sorted = rpm(sort_idx);

% Identify death zone (RPM = 0)
death_zone_idx = rpm_sorted == 0;
vin_death_zone = vin_sorted(death_zone_idx);
rpm_death_zone = rpm_sorted(death_zone_idx);

% Plot data
figure;
plot(vin_sorted, rpm_sorted, 'b-o', 'LineWidth', 1.5, 'MarkerFaceColor', 'blue'); % Blue line with markers
hold on;
plot(vin_death_zone, rpm_death_zone, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'red'); % Highlight death zone
hold off;

% Add labels and title
xlabel('Input Voltage (V)');
ylabel('Motor velocity (RPM)');
title('Motor Characteristics: Motor velocity with respect to input voltage');
grid on;

% Add legend
legend('Motor Data', 'Death Zone (RPM = 0)', 'Location', 'NorthWest');

%% Lab 2

% Data
v = [-9 -8 -7 -6 -5 -4 -3 -2 -1 1 2 3 4 5 6 7 8 9];
rpm = [-1796 -1598 -1398 -1201 -1000 -800 -600 -400 -200 199 397 596 797 997 1198 1397 1596 1798];

% Generate 1000 points
v_fine = linspace(min(v), max(v), 1000);

% Perform spline interpolation
rpm_spline = spline(v, rpm, v_fine);

% Plot the calibration curve
figure;
plot(v, rpm, 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'b'); % Original data points
hold on;
plot(v_fine, rpm_spline, 'r-', 'LineWidth', 1.5); % Interpolated curve
hold off;

% Add labels and title
xlabel('Voltage from velocity sensor (V)');
ylabel('Motor velocity (RPM)');
title('Calibration Curve');
legend('Data Points', 'Spline Interpolation', 'Location', 'Best');
grid on;


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

% Create a figure for the plots
figure;

% Plot position vs time
subplot(3, 1, 1); % Create a subplot with 3 rows, 1 column, position 1
plot(t, p, 'b', 'LineWidth', 1.5); % Blue line with line width 1.5
xlabel('Time (s)');
ylabel('Position');
title('Position with respect to Time');
grid on;

% Plot speed (RPM) vs time
subplot(3, 1, 2); % Subplot position 2
plot(t, rpm, 'r', 'LineWidth', 1.5); % Red line
xlabel('Time (s)');
ylabel('Speed (RPM)');
title('Speed with respect to Time');
grid on;

% Plot gen data vs time
subplot(3, 1, 3); % Subplot position 3
plot(t, gen, 'g', 'LineWidth', 1.5); % Green line
xlabel('Time (s)');
ylabel('Gen Data');
title('Gen Data with respect to Time');
grid on;

sgtitle('Lab3-1: Plots of Position, Speed, and Generator Data with respect to Time'); % Add a super title
%% Lab 3-2

% Define file name
filename = 'data_motor_step_clutch.txt';

% Read the data, skipping 4 header lines
data2 = readtable(filename, 'FileType', 'text', 'HeaderLines', 4);

% Extract variables from the table
t = data2.Time;       % Time data
p = data2.position;   % Position data
rpm = data2.speed;    % Speed data
gen = data2.Func_;    % Generator data but Matlab read Func_ and Gen_ as 2 different column so the data shift by 1 column

% Create a figure for the plots
figure;

% Plot position vs time
subplot(3, 1, 1); % Create a subplot with 3 rows, 1 column, position 1
plot(t, p, 'b', 'LineWidth', 1.5); % Blue line with line width 1.5
xlabel('Time (s)');
ylabel('Position');
title('Position with respect to Time');
grid on;

% Plot speed (RPM) vs time
subplot(3, 1, 2); % Subplot position 2
plot(t, rpm, 'r', 'LineWidth', 1.5); % Red line
xlabel('Time (s)');
ylabel('Speed (RPM)');
title('Speed with respect to Time');
grid on;

% Plot generator data vs time
subplot(3, 1, 3); % Subplot position 3
plot(t, gen, 'g', 'LineWidth', 1.5); % Green line
xlabel('Time (s)');
ylabel('Generator Data');
title('Generator Data with respect to Time');
grid on;

sgtitle('Lab 3-2: Plots of Position, Speed, and Generator Data with respect to Time'); % Add a super title


%% Lab 3-3
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

% Create a figure for the plots
figure;

% Plot position vs time
subplot(4, 1, 1); % Create a subplot with 4 rows, 1 column, position 1
plot(t, p, 'b', 'LineWidth', 1.5); % Blue line with line width 1.5
xlabel('Time (s)');
ylabel('Position');
title('Position with respect to Time');
grid on;

% Plot speed (RPM) vs time
subplot(4, 1, 2); % Subplot position 2
plot(t, rpm, 'r', 'LineWidth', 1.5); % Red line
xlabel('Time (s)');
ylabel('Speed (RPM)');
title('Speed with respect to Time');
grid on;

% Plot generator data vs time
subplot(4, 1, 3); % Subplot position 3
plot(t, gen, 'g', 'LineWidth', 1.5); % Green line
xlabel('Time (s)');
ylabel('Generator Data');
title('Generator Data with respect to Time');
grid on;

% Plot load data vs time
subplot(4, 1, 4); % Subplot position 4
plot(t, load, 'm', 'LineWidth', 1.5); % Magenta line
xlabel('Time (s)');
ylabel('Load');
title('Load with respect to Time');
grid on;

sgtitle('Lab 3-3: Plots of Position, Speed, Generator Data, and Load with respect to Time'); % Add a super title


