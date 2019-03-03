clc
clear all
% close all

data = importdata('./winter/P10/data.dat');

time = data(:,2);
dpm = data(:,14);

max(dpm)

% time = time - 741;
time = time - 601;
% dpm = dpm/8.3e-11*180;
dpm = dpm/8.2e-11*180;

figure(1)
plot(time,dpm)
grid on
hold on
xlabel('time [s]');
ylabel('CFU/m^3');

legend('5  Pa', '10 Pa', '15 Pa', '10%', '20%', '30%')



2.1069 - min(abs(data(:,3)))

max(data(:,14))

figure
plot(time,data(:,8),time,data(:,10),time,data(:,9))