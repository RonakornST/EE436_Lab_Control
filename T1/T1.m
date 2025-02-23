%%
clf
filename = 'coupletank_labt1__exp1K4.txt';
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 4);
% Extract variables from the table, excluding the last data point
t = data.Time(1:end-1);        % Time data
refinp = data.ref_inp(1:end-1);         % Temperature T1
level2 = data.lev2(1:end-1);         % Temperature T2
plot(t,refinp,'-r', 'LineWidth', 2 )
hold on
plot(t,level2,'-g', 'LineWidth', 2 )
hold off
% Shutter position
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Reference input signal and liquid level in second tanks (Kp=4)');
legend('reference input','tank2 liquid level')

ess_k4 = refinp(end) - level2(end);
disp('The value of ess_K4 is:');
disp(ess_k4);


%% 
filename = 'coupletank_labt1__exp1K7.txt';
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 2);
% Extract variables from the table, excluding the last data point
t = data.Time(1:end-1);        % Time data
refinp = data.ref_inp(1:end-1);         % Temperature T1
level2 = data.lev2(1:end-1);         % Temperature T2
hold on
plot(t,refinp,'-r', 'LineWidth', 2 )
plot(t,level2,'-g', 'LineWidth', 2)
% Shutter position
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Reference input signal and liquid level in second tanks (Kp=7)');
legend('reference input','tank2 liquid level')
hold off
ess_k7 = refinp(end) - level2(end);
disp('The value of ess_K7 is:');
disp(ess_k7);

%% 
filename = 'coupletank_labt1__exp1K10.txt';
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 4);
% Extract variables from the table, excluding the last data point
t = data.Time(1:end-1);        % Time data
refinp = data.ref_inp(1:end-1);         % Temperature T1
level2 = data.lev2(1:end-1);         % Temperature T2
hold on
plot(t,refinp,'-r', 'LineWidth', 2 )
plot(t,level2,'-g', 'LineWidth', 2)
% Shutter position
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Reference input signal and liquid level in second tanks (Kp=10)');
legend('reference input','tank2 liquid level')
hold off

ess_k10 = refinp(end) - level2(end);
disp('The value of ess_K10 is:');
disp(ess_k10);

%%
filename = 'coupletank_labt1__exp1_Ki0.05_K4.txt';
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 2);
% Extract variables from the table, excluding the last data point
t = data.Time(1:end-1);        % Time data
refinp = data.ref_inp(1:end-1);         % Temperature T1
level2 = data.lev2(1:end-1);         % Temperature T2
hold on
plot(t,refinp,'-r', 'LineWidth', 2 )
plot(t,level2,'-g', 'LineWidth', 2)
% Shutter position
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Reference input signal and liquid level in second tanks (Kp=4, Ki=0.05)');
legend('reference input','tank2 liquid level')
hold off

ess_Ki005_K4 = refinp(end) - level2(end);
disp('The value of ess_Ki0.05_K4 is:');
disp(ess_Ki005_K4);
%%
filename = 'coupletank_labt1__exp1_Ki0.1_K4.txt';
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 2);
% Extract variables from the table, excluding the last data point
t = data.Time(1:end-1);        % Time data
refinp = data.ref_inp(1:end-1);         % Temperature T1
level2 = data.lev2(1:end-1);         % Temperature T2
hold on
plot(t,refinp,'-r', 'LineWidth', 2 )
plot(t,level2,'-g', 'LineWidth', 2)
% Shutter position
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Reference input signal and liquid level in second tanks (Kp=4, Ki=0.1)');
legend('reference input','tank2 liquid level')
hold off

ess_Ki01_K4 = refinp(end) - level2(end);
disp('The value of ess_Ki0.1_K4 is:');
disp(ess_Ki01_K4);


%%
filename = 'coupletank_labt1__exp1_Ki0.3_K4.txt';
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 1);
% Extract variables from the table, excluding the last data point
t = data.Time(1:end-1);        % Time data
refinp = data.ref_inp(1:end-1);         % Temperature T1
level2 = data.lev2(1:end-1);         % Temperature T2
hold on
plot(t,refinp,'-r', 'LineWidth', 2 )
plot(t,level2,'-g', 'LineWidth', 2)
% Shutter position
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Reference input signal and liquid level in second tanks (Kp=4, Ki=0.3)');
legend('reference input','tank2 liquid level')
hold off

ess_Ki03_K4 = refinp(end) - level2(end);
disp('The value of ess_Ki.03_K4 is:');
disp(ess_Ki03_K4);

%%
filename = 'T1_lab2_openloop.txt';
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 3);
% Extract variables from the table, excluding the last data point
t = data.Time(1:10000);        % Time data
refinp = data.ref_inp(1:10000);         % Temperature T1
level2 = data.lev2(1:10000);         % Temperature T2
hold on
plot(t,refinp,'-r', 'LineWidth', 2 )
plot(t,level2,'-g', 'LineWidth', 2)
% Shutter position
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Reference input signal and liquid level in second tank of open loop system');
legend('reference input','tank2 liquid level')
hold off

%%

%%
filename = 'T1_lab2_closeloop.txt';
data = readtable(filename, 'FileType', 'text', 'HeaderLines', 2);
% Extract variables from the table, excluding the last data point
t = data.Time(1:end-1);        % Time data
refinp = data.ref_inp(1:end-1);         % Temperature T1
level2 = data.lev2(1:end-1);         % Temperature T2
hold on
plot(t,refinp,'-r', 'LineWidth', 2 )
plot(t,level2,'-g', 'LineWidth', 2)
% Shutter position
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Reference input signal and liquid level in second tank of closed loop system');
legend('reference input','tank2 liquid level')
hold off
