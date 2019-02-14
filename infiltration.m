clc
clear all
% close all

data = importdata('plane-1-9500');
data = data.data;
data = data(:,2:end);

x = data(:,1);
y = data(:,2);
z = data(:,3);

N = (0+(5+6+5)+0)/0.01/10 - 0;
N0 = 9500;

A = 0.03^2;

u = zeros(length(z),N);
t = zeros(N,1);

for i=1:N

    file = sprintf('plane-1-%d',(N0+i*10)); 
    
    data = importdata(file);
    data = data.data;
    data = data(:,2:end);
    
    u(:,i) = data(:,4);
    t(i) = i*0.1;
end


u_in = u;
u_out = u;

u_in(u_in>=0)=0;
u_out(u_out<=0)=0;

V_in = -1*sum(u_in,1)*A;
V_in = V_in';

V_out = +1*sum(u_out,1)*A;
V_out = V_out';

sum(V_in)*0.1
sum(V_out)*0.1
sum(V_out-V_in)*0.1

figure
plot(t,V_in,'b')
grid on
hold on
plot(t,V_out,'r')
plot(t,V_out-V_in,'sk')