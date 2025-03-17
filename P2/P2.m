dataP = readtable('data_thermal_labp2_setpoint_P.txt');
dataPI = readtable('data_thermal_labp2_setpoint_PI.txt');

% เตรียมข้อมูลควบคุมแบบ_P
t_P1 = dataP.Time(1:6969);         % Time data
t_P2 = dataP.Time(6969:end-1)-dataP.Time(6969);
T1_P1 = dataP.T1(1:6969);         % Temperature T1
T1_P2 = dataP.T1(6969:end-1);
setpointP = dataP.Setpoint(1:end);  % Setpoint voltage
shutterP = dataP.shutter(1:end);    % Shutter position*
% เตรียมข้อมูลควบคุมแบบ_PI
t_PI1 = dataPI.Time(1:7562);         % Time data
t_PI2 = dataPI.Time(7562:end-1)-dataPI.Time(7562);
T1_PI1 = dataPI.T1(1:7562);         % Temperature T1
T1_PI2 = dataPI.T1(7562:end-1);
setpointPI = dataPI.Setpoint(1:end);  % Setpoint voltage
shutterPI = dataPI.shutter(1:end);    % Shutter position

%%

plot(t_P1, T1_P1, '-r', 'LineWidth', 2, 'DisplayName', 'T1 from P')
hold on;
plot(t_PI1, T1_PI1, '-g', 'LineWidth', 2, 'DisplayName', 'T1 from PI')
xlabel('Time (s)');
ylabel('Temperature (°C)');
title('Temperature Response (0 to 4 V) vs Time');
legend;
grid on;
hold off;

%%

plot(t_P2, T1_P2, '-r', 'LineWidth', 2, 'DisplayName', 'T1 from P')
hold on;
plot(t_PI2, T1_PI2, '-g', 'LineWidth', 2, 'DisplayName', 'T1 from PI')
xlabel('Time (s)');
ylabel('Temperature (°C)');
title('Temperature Response (4 to 5 V) vs Time');
legend;
grid on;

%%

stepinfo_P1 = stepinfo(T1_P1 ,t_P1)
stepinfo_PI1 = stepinfo(T1_PI1 ,t_PI1)
stepinfo_P2 = stepinfo(T1_P2 ,t_P2)
stepinfo_PI2 = stepinfo(T1_PI2 ,t_PI2)

