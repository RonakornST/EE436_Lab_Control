%%
x = readtable('data_motor_noclutch.txt'); %อ่านค่าข้อมูลจากไฟล์data_motor_step_noclutch.txt
Ts = 0.065; %กำหนดค่า Ts = 0.065

datatrain = iddata(x.Var2(1:800,:),x.Var4(1:800,:),Ts); %แบ่งค่าข้อมูล train เป็น 80% ของข้อมูลทั้งหมด
datatest = iddata(x.Var2(801:1000,:),x.Var4(801:1000,:),Ts); %แบ่งค่าข้อมูล test เป็น 80% ของข้อมูลทั้งหมด
Td = delayest(datatrain); %หาค่า Td โดยใช้คำสั่ง delayest


impulseplot(y1)
A1 = arx(datatrain,[1 1 Td]); % แทนค่า (p,q) เป็น (1,1) สำหรับการจำลอง ARX
A2 = arx(datatrain,[2 1 Td]); % แทนค่า (p,q) เป็น (2,1) สำหรับการจำลอง ARX
A3 = arx(datatrain,[2 2 Td]); % แทนค่า (p,q) เป็น (2,2) สำหรับการจำลอง ARX
A4 = arx(datatrain,[3 2 Td]); % แทนค่า (p,q) เป็น (3,2) สำหรับการจำลอง ARX
A5 = arx(datatrain,[3 3 Td]); % แทนค่า (p,q) เป็น (3,3) สำหรับการจำลอง ARX
compare(datatest,A1,A2,A3,A4,A5); % เปรียบเทียบค่าการจำลอง ARX กับ datatest

S1 = n4sid(datatrain,1); % แทนค่า n เป็น 1 สำหรับการจำลอง state-space
S2 = n4sid(datatrain,2); % แทนค่า n เป็น 2 สำหรับการจำลอง state-space
S3 = n4sid(datatrain,3); % แทนค่า n เป็น 3 สำหรับการจำลอง state-space
S4 = n4sid(datatrain,4); % แทนค่า n เป็น 4 สำหรับการจำลอง state-space
S5 = n4sid(datatrain,5); % แทนค่า n เป็น 5 สำหรับการจำลอง state-space
compare(datatest,S1,S2,S3,S4,S5); %เปรียบเทียบค่าการจำลอง state-space กับ datatest

bic = A5.Report.Fit.BIC; % คำนวณค่า BIC 
aicc = A5.Report.Fit.AICc; % คำนวณค่า AICc 
fpe = A5.Report.Fit.FPE; % คำนวณค่า FPE

resid(datatrain,S3,S2)% พล็อตกราฟ residual analysis
legend('S3','S2')% กำหนดชื่อชุดข้อมูล
h = iopzplot(S3)% พล็อตกราฟ zero-ploe
hold on% เพิ่มข้อมูลกราฟ
y = iopzplot(S2)% พล็อตกราฟ zero-ploe
legend('S3','S2')% กำหนดชื่อชุดข้อมูล

%% Lab 3 - Analysis of Motor Data
% This script analyzes motor data under load and no-load conditions.
% It calculates ARX (AutoRegressive with eXogenous input) models and their DC gains, 
% then compares the step responses of the two models.

% Load the data from text files
% 'data_motor_sine_load.txt' contains motor data under load conditions.
% 'data_motor_noclutch.txt' contains motor data under no-load conditions.
loadData = readtable('data_motor_sine_load.txt'); 
noLoadData = readtable('data_motor_noclutch.txt');

% Define the sampling time for the system
Ts = 0.065; % Sampling time in seconds

% Define the split index for separating training and testing datasets
splitIdx = 800; % Splits data into 80% training and 20% testing

% Split the load data into training (first 80%) and testing (last 20%) datasets
trainLoad = loadData(1:splitIdx, :); % Training data for the load condition
testLoad = loadData(splitIdx+1:1000, :); % Testing data for the load condition

% Split the no-load data into training (first 80%) and testing (last 20%) datasets
trainNoLoad = noLoadData(1:splitIdx, :); % Training data for the no-load condition
testNoLoad = noLoadData(splitIdx+1:1000, :); % Testing data for the no-load condition

% Prepare the training data for system identification
% trainDataLoad: Output is 'Var2', Inputs are 'Var4' and 'Var5', with sampling time Ts
trainDataLoad = iddata(trainLoad.Var2, [trainLoad.Var4 trainLoad.Var5], Ts);

% Create an ARX model for the load condition with specific model orders
% Model orders: Output=1, Inputs=[1 1], Noise=[2 2]
modelLoad = arx(trainDataLoad, [1, [1 1], [2 2]]);

% Prepare the training data for the no-load condition
% trainDataNoLoad: Output is 'Var2', Input is 'Var4', with sampling time Ts
trainDataNoLoad = iddata(trainNoLoad.Var2, trainNoLoad.Var4, Ts);

% Create an ARX model for the no-load condition with specific model orders
% Model orders: Output=1, Input=1, Noise=2
modelNoLoad = arx(trainDataNoLoad, [1, 1, 2]);

% Calculate the DC gain for both models
% The DC gain represents the steady-state response of the system to a step input.
dcGainLoad = dcgain(modelLoad); % DC gain for the load condition model
dcGainNoLoad = dcgain(modelNoLoad); % DC gain for the no-load condition model

% Display the DC gains for both models
disp('DC Gain for Load Model:');
disp(dcGainLoad);
disp('DC Gain for No-Load Model:');
disp(dcGainNoLoad);

% Plot the step responses of the two models for comparison
figure; % Create a new figure
step(modelLoad); % Step response for the load condition model
hold on; % Overlay the next plot on the same figure
step(modelNoLoad); % Step response for the no-load condition model
legend('Load Model', 'No-Load Model'); % Add a legend to distinguish the models

%%

load = readtable('data_motor_sine_load.txt'); % โหลดข้อมูลในกรณีที่มีโหลด
noload = readtable('data_motor_noclutch.txt'); % โหลดข้อมูลในกรณีที่ไม่มีโหลด (ไม่มีคลัทช์)


Ts = 0.065; % Sampling time ของข้อมูลในหน่วยวินาที
idx = 800; % ดัชนีที่ใช้ในการแบ่งข้อมูลออกเป็นชุดสำหรับฝึกและทดสอบ


% แบ่งข้อมูลออกเป็นชุดฝึกและชุดทดสอบ
train = load(1:idx, :); % ข้อมูลฝึกสำหรับชุด "load" 
test = load(idx+1:end, :); % ข้อมูลทดสอบสำหรับชุด "load" 
trainnl = noload(1:idx, :); % ข้อมูลฝึกสำหรับชุด "no load" (ไม่มีโหลด)
testnl = noload(idx+1:end, :); % ข้อมูลทดสอบสำหรับชุด "no load"

% สร้างข้อมูล IDDATA สำหรับการทำ System Identification ในชุด "load"
datatrain = iddata(train.Var2, [train.Var4 train.Var5], Ts); 
% datatrain:
% - Output: train.Var2 (ความเร็ว)
% - Inputs: train.Var4 และ train.Var5 (สัญญาณควบคุม, สัญญาณโหลด)
Td = delayest(datatrain);

% ระบุโมเดล ARX สำหรับชุดข้อมูล "load"
%mload = arx(datatrain, [2, [2 2], Td]);
mload = arx(datatrain, [2, [2 2], [1, 0]]);

% mload: 
% - [1]: ลำดับของตัวแปร Auto-Regressive (AR) สำหรับ Output
% - [1 1]: ลำดับของตัวแปร Exogenous Inputs (อินพุต train.Var4 และ train.Var5)
% - [2 2]: Delay ระหว่างอินพุตและเอาต์พุต (2 ตัวอย่างสำหรับแต่ละอินพุต)

% สร้างข้อมูล IDDATA สำหรับการทำ System Identification ในชุด "no load"
datatrainnl = iddata(trainnl.Var2, trainnl.Var4, Ts);
% datatrainnl:
% - Output: trainnl.Var2 (ความเร็ว)
% - Input: trainnl.Var4 (สัญญาณควบคุม)


% ระบุโมเดล ARX สำหรับชุดข้อมูล "no load"
mnoload = arx(datatrainnl, [2, 2, 1]);
% mnoload:
% - [1]: ลำดับของตัวแปร AR สำหรับ Output
% - [1]: ลำดับของตัวแปร Exogenous Input


% คำนวณและแสดงค่า DC Gain ของโมเดลทั้งสอง
dcgain(mload); % คำนวณและแสดงค่า DC Gain ของโมเดล "load"
dcgain(mnoload); % คำนวณและแสดงค่า DC Gain ของโมเดล "no load"

% วาดกราฟ Step Response ของโมเดลทั้งสองเพื่อเปรียบเทียบพฤติกรรมของระบบ
step(mload); % วาดกราฟ Step Response ของโมเดล "load"
hold on; % คงกราฟเดิมไว้เพื่อซ้อนกราฟใหม่
step(mnoload); % วาดกราฟ Step Response ของโมเดล "no load"


%% Lab 3

loadData = readtable('data_motor_sine_load.txt');
noLoadData = readtable('data_motor_noclutch.txt');


Ts = 0.065; % set sampling
splitIdx = 800; % set split index for 80:20 train 

% Split the load data into training and testing sets with ratio 80:20
trainLoad = loadData(1:splitIdx, :);
testLoad = loadData(splitIdx+1:1000, :);
trainNoLoad = noLoadData(1:splitIdx, :);
testNoLoad = noLoadData(splitIdx+1:1000, :);


trainDataLoad = iddata(trainLoad.Var2, [trainLoad.Var4 trainLoad.Var5], Ts);
modelLoad = arx(trainDataLoad, [2, [2 2], [1 0]]);
trainDataNoLoad = iddata(trainNoLoad.Var2, trainNoLoad.Var4, Ts);
modelNoLoad = arx(trainDataNoLoad, [2, 2, 1]);
dcGainLoad = dcgain(modelLoad);
dcGainNoLoad = dcgain(modelNoLoad);
disp('DC Gain for Load Model:');
disp(dcGainLoad);
disp('DC Gain for No-Load Model:');
disp(dcGainNoLoad);

% แปลงโมเดลที่มีโหลดเป็นแบบจำลองเวลาต่อเนื่อง
continuousModelLoad = d2c(modelLoad);

% แปลงโมเดลที่ไม่มีโหลดเป็นแบบจำลองเวลาต่อเนื่อง
continuousModelNoLoad = d2c(modelNoLoad);


figure;
step(continuousModelLoad); 
hold on;
step(continuousModelNoLoad); 
legend('Load Model', 'No-Load Model');
%%
% สร้างเมทริกซ์ A จากข้อมูล
A = [trainLoad.Var2(1:end-2), trainLoad.Var2(2:end-1), trainLoad.Var4(1:end-1), trainLoad.Var5(1:end-1), trainLoad.Var4(2:end), trainLoad.Var5(2:end)];

% สร้างเวกเตอร์ omega จากข้อมูล
omega = trainLoad.Var2(3:end); 

% ประมาณค่า theta ด้วยวิธี Least Squares
theta = (A' * A) \ (A' * omega);

% แสดงผลค่าพารามิเตอร์ theta
disp('Estimated Parameters (theta):');
disp(theta);


%% 
loadData = readtable('data_motor_sine_load.txt'); % โหลดข้อมูลสำหรับกรณีที่มีโหลด
noLoadData = readtable('data_motor_noclutch.txt'); % โหลดข้อมูลสำหรับกรณีที่ไม่มีโหลด (ไม่มีคลัทช์)

Ts = 0.065; % ตั้งค่า Sampling Time ของข้อมูลในหน่วยวินาที
splitIdx = 800; % กำหนดดัชนีสำหรับแบ่งข้อมูลเป็นชุดฝึกและทดสอบในสัดส่วน 80:20

% แบ่งข้อมูลในกรณีที่มีโหลด (Load) ออกเป็นชุดฝึกและชุดทดสอบ
trainLoad = loadData(1:splitIdx, :); % ชุดข้อมูลฝึก (Train) 
testLoad = loadData(splitIdx+1:1000, :); % ชุดข้อมูลทดสอบ (Test)

% แบ่งข้อมูลในกรณีที่ไม่มีโหลด (No-Load) ออกเป็นชุดฝึกและชุดทดสอบ
trainNoLoad = noLoadData(1:splitIdx, :); % ชุดข้อมูลฝึก (Train)
testNoLoad = noLoadData(splitIdx+1:1000, :); % ชุดข้อมูลทดสอบ (Test)

% สร้างข้อมูล IDDATA สำหรับการทำ System Identification ในกรณีที่มีโหลด
trainDataLoad = iddata(trainLoad.Var2, [trainLoad.Var4 trainLoad.Var5], Ts); 


% ระบุโมเดล ARX สำหรับข้อมูลในกรณีที่มีโหลด
modelLoad = arx(trainDataLoad, [2, [2 2], [1 0]]);


% สร้างข้อมูล IDDATA สำหรับการทำ System Identification ในกรณีที่ไม่มีโหลด
trainDataNoLoad = iddata(trainNoLoad.Var2, trainNoLoad.Var4, Ts); 


% ระบุโมเดล ARX สำหรับข้อมูลในกรณีที่ไม่มีโหลด
modelNoLoad = arx(trainDataNoLoad, [2, 2, 1]);


% คำนวณค่า DC Gain ของโมเดลสำหรับกรณีที่มีโหลดและไม่มีโหลด
dcGainLoad = dcgain(modelLoad); % คำนวณ DC Gain ของโมเดลที่มีโหลด
dcGainNoLoad = dcgain(modelNoLoad); % คำนวณ DC Gain ของโมเดลที่ไม่มีโหลด

% แสดงค่า DC Gain ของแต่ละโมเดลใน Command Window
disp('DC Gain for Load Model:'); 
disp(dcGainLoad); % แสดงค่า DC Gain ของโมเดลที่มีโหลด
disp('DC Gain for No-Load Model:');
disp(dcGainNoLoad); % แสดงค่า DC Gain ของโมเดลที่ไม่มีโหลด

% แปลงโมเดลที่มีโหลดเป็นแบบจำลองเวลาต่อเนื่อง
continuousModelLoad = d2c(modelLoad);

% แปลงโมเดลที่ไม่มีโหลดเป็นแบบจำลองเวลาต่อเนื่อง
continuousModelNoLoad = d2c(modelNoLoad);

% วาดกราฟ Step Response ของทั้งสองโมเดลเพื่อเปรียบเทียบพฤติกรรมของระบบ
figure; % สร้าง Figure ใหม่
step(continuousModelLoad); % วาดกราฟ Step Response ของโมเดลที่มีโหลด
hold on; % ซ้อนกราฟใหม่ในกราฟเดิม
step(continuousModelNoLoad); % วาดกราฟ Step Response ของโมเดลที่ไม่มีโหลด
legend('Load Model', 'No-Load Model'); % เพิ่มคำอธิบายกราฟ


%%
x = readtable('data_motor_step_noclutch.txt');   % อ่านค่าข้อมูลจากไฟล์data_motor_step_noclutch.txt
Ts = 0.065;                                 % กำหนดค่า Ts = 0.065
datatrain = iddata(x.Var2(1:800,:),x.Var4(1:800,:),Ts);         % แบ่งค่าข้อมูล train เป็น 80% ของข้อมูลทั้งหมด
datatest = iddata(x.Var2(801:1000,:),x.Var4(801:1000,:),Ts);    % แบ่งค่าข้อมูล test เป็น 80% ของข้อมูลทั้งหมด
Td = delayest(datatrain);                                       % หาค่า Td โดยใช้คำสั่ง delayest
%impulseplot(y1)

A1 = arx(datatrain,[1 1 Td]);           % แทนค่า (p,q) เป็น (1,1) สำหรับการจำลอง ARX
A2 = arx(datatrain,[2 1 Td]);           % แทนค่า (p,q) เป็น (2,1) สำหรับการจำลอง ARX
A3 = arx(datatrain,[2 2 Td]);           % แทนค่า (p,q) เป็น (2,2) สำหรับการจำลอง ARX
A4 = arx(datatrain,[3 2 Td]);           % แทนค่า (p,q) เป็น (3,2) สำหรับการจำลอง ARX
A5 = arx(datatrain,[3 3 Td]);           % แทนค่า (p,q) เป็น (3,3) สำหรับการจำลอง ARX
% compare(datatest,A1,A2,A3,A4,A5)      % เปรียบเทียบค่าการจำลอง ARX กับ datatest

S1 = n4sid(datatrain,1);                % แทนค่า n เป็น 1 สำหรับการจำลอง state-space
S2 = n4sid(datatrain,2);                % แทนค่า n เป็น 2 สำหรับการจำลอง state-space
S3 = n4sid(datatrain,3);                % แทนค่า n เป็น 3 สำหรับการจำลอง state-space
S4 = n4sid(datatrain,4);                % แทนค่า n เป็น 4 สำหรับการจำลอง state-space
S5 = n4sid(datatrain,5);                % แทนค่า n เป็น 5 สำหรับการจำลอง state-space
% compare(datatest,S1,S2,S3,S4,S5)      % เปรียบเทียบค่าการจำลอง state-space กับ datatest

bic = A5.Report.Fit.BIC;    % คำนวณค่า BIC 
aicc = A5.Report.Fit.AICc;  % คำนวณค่า AICc 
fpe = A5.Report.Fit.FPE;    % คำนวณค่า FPE


% resid(datatrain,A4,A3)    % พล็อตกราฟ residual analysis ของ 2 แบบจำลอง ARX ที่เลือกพิจารณา
% h = iopzplot(A4)          % พล็อตกราฟ zero-ploe แบบจำลอง ARX ที่เลือกพิจารณา
% hold on                   % เพิ่มข้อมูลกราฟ
% y = iopzplot(A3)          % พล็อตกราฟ zero-ploe แบบจำลอง ARX ที่เลือกพิจารณา
% legend('A4','A3')         % กำหนดชื่อชุดข้อมูล

% resid(datatrain,S3,S2)    % พล็อตกราฟ residual analysis ของ 2 แบบจำลอง state-space ที่เลือกพิจารณา
% h = iopzplot(S3)          % พล็อตกราฟ zero-ploe บบจำลอง state-space ที่เลือกพิจารณา
% hold on                   % เพิ่มข้อมูลกราฟ
% y = iopzplot(S2)          % พล็อตกราฟ zero-ploe บบจำลอง state-space ที่เลือกพิจารณา
% legend('S3','S2')         % กำหนดชื่อชุดข้อมูล


% step(A3, d2c(A3,'foh'))                   % พล็อตกราฟ Step Response เทียบ Discrete-Time กับ Continuous-Time 
% title('Step Response (ARX: A3)');         % ชื่อกราฟ Step Response ของแบบจำลอง ARX ที่เลือก

step(S2, d2c(S2,'foh'))                     % พล็อตกราฟ Step Response เทียบ Discrete-Time กับ Continuous-Time
title('Step Response (state-space: S2)');   % ชื่อกราฟ Step Response ของแบบจำลอง state-space ที่เลือก

xlim([0 5]);                                % กำหนดช่วงเวลาที่พิจารณาในกราฟ Step Response เพื่อดูการลู่เข้า
legend('Discrete-Time','Continuous-Time');  % กำหนดชื่อชุดข้อมูล
%compare(datatest,A3,A4)% พล็อตกราฟ fitting กับชุดข้อมูล validaton ของชุด A3 และ A4
%compare(datatest,S2,S3)% พล็อตกราฟ fitting กับชุดข้อมูล validaton ของชุด S2 และ S3