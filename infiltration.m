clc
clear all
close all

data = importdata('plane-1-9410');
data = data.data;
data = data(:,2:end);

x = data(:,1);
y = data(:,2);
z = data(:,3);

N = (1+(5+6+5)+0)/0.01/10 - 1;
N0 = 9410;

u = zeros(length(z),N);

for i=1:N

    file = sprintf('plane-1-%d',(N0+i*10)); 
    data = importdata(file);
    data = data.data;
    data = data(:,2:end);
    u(:,i) = data(:,4);
end


