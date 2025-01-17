%% Lab2
rpm = [-1796 -1598 -1398 -1201 -1000 -800 -600 -400 -200 199 397 596 797 997 1198 1397 1596 1798];
v = [-9 -8 -7 -6 -5 -4 -3 -2 -1 1 2 3 4 5 6 7 8 9;
yy = spline(v,rpm);
plot(v,yy)

%%



%% lab 3-1

t = m1.time;
p = m1.position;
rpm = m1.speed;
gen = m1.gen;

% Create a figure for the plots
figure;

% Plot position vs time
subplot(3, 1, 1); % Create a subplot with 3 rows, 1 column, position 1
plot(t, p, 'b', 'LineWidth', 1.5); % Blue line with line width 1.5
xlabel('Time (s)');
ylabel('Position');
title('Position vs Time');
grid on;

% Plot speed (RPM) vs time
subplot(3, 1, 2); % Subplot position 2
plot(t, rpm, 'r', 'LineWidth', 1.5); % Red line
xlabel('Time (s)');
ylabel('Speed (RPM)');
title('Speed vs Time');
grid on;

% Plot gen data vs time
subplot(3, 1, 3); % Subplot position 3
plot(t, gen, 'g', 'LineWidth', 1.5); % Green line
xlabel('Time (s)');
ylabel('Gen Data');
title('Gen Data vs Time');
grid on;

% Adjust the layout for better visualization
sgtitle('Lab3-1: Plots of Position, Speed, and Generator Data vs Time'); % Add a super title

%% lab 3-2
% use data_motor_sine_load

% Assuming the variables are loaded from m2
t = m2.time;       % Time data
p = m2.position;   % Position data
rpm = m2.speed;    % Speed data
gen = m2.gen;      % Generator data
load = m2.load;    % Load data

% Create a figure for the plots
figure;

% Plot position vs time
subplot(4, 1, 1); % Create a subplot with 4 rows, 1 column, position 1
plot(t, p, 'b', 'LineWidth', 1.5); % Blue line with line width 1.5
xlabel('Time (s)');
ylabel('Position');
title('Position vs Time');
grid on;

% Plot speed (RPM) vs time
subplot(4, 1, 2); % Subplot position 2
plot(t, rpm, 'r', 'LineWidth', 1.5); % Red line
xlabel('Time (s)');
ylabel('Speed (RPM)');
title('Speed vs Time');
grid on;

% Plot generator data vs time
subplot(4, 1, 3); % Subplot position 3
plot(t, gen, 'g', 'LineWidth', 1.5); % Green line
xlabel('Time (s)');
ylabel('Gen Data');
title('Gen Data vs Time');
grid on;

% Plot load data vs time
subplot(4, 1, 4); % Subplot position 4
plot(t, load, 'm', 'LineWidth', 1.5); % Magenta line
xlabel('Time (s)');
ylabel('Load');
title('Load vs Time');
grid on;

% Adjust the layout for better visualization
sgtitle('Lab3-2: Plots of Position, Speed, Generator Data, and Load vs Time'); % Add a super title


%% lab 3-3

% Assuming the variables are loaded from m3
t = m3.time;       % Time data
p = m3.position;   % Position data
rpm = m3.speed;    % Speed data
gen = m3.gen;      % Generator data

% Create a figure for the plots
figure;

% Plot position vs time
subplot(3, 1, 1); % Create a subplot with 3 rows, 1 column, position 1
plot(t, p, 'b', 'LineWidth', 1.5); % Blue line with line width 1.5
xlabel('Time (s)');
ylabel('Position');
title('Position vs Time');
grid on;

% Plot speed (RPM) vs time
subplot(3, 1, 2); % Subplot position 2
plot(t, rpm, 'r', 'LineWidth', 1.5); % Red line
xlabel('Time (s)');
ylabel('Speed (RPM)');
title('Speed vs Time');
grid on;

% Plot generator data vs time
subplot(3, 1, 3); % Subplot position 3
plot(t, gen, 'g', 'LineWidth', 1.5); % Green line
xlabel('Time (s)');
ylabel('Gen Data');
title('Gen Data vs Time');
grid on;

% Adjust the layout for better visualization
sgtitle('Lab3-3: Plots of Position, Speed, and Generator Data vs Time'); % Add a super title
