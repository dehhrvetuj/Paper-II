clc
clear all
% close all

% LOAD SAMPLE-PLANE DATA
data = importdata('plane-1-0110');
data = data.data;
data = data(:,2:end);

% X-Y-Z COORDINATES
x = data(:,1);
y = data(:,2);
z = data(:,3);

% STARTING TIMESTEP: N0
% TOTAL NUM OF TIMESTEPS: N
N0 = 0110;
N = 199 ;

% AREA OF DOOR
A = 0.03^2;


% CONSTRUCT MESH GRID
[yq,zq] = meshgrid(4.125:0.03:5.625,0:0.03:2.1);

% TIME AND X-VELOCITY
u = zeros(length((yq(:))),N);
t = zeros(N,1);

%
for i=1:N
    
    j=i-1;
    
    file = sprintf('plane-1-%04d',(N0+j*10)); 
    
    data = importdata(file);
    data = data.data;
    data = data(:,2:end);
    
    uq = griddata(data(:,2),data(:,3),data(:,4),yq,zq,'nearest');
    
    u(:,i) = uq(:);
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

% figure
plot(t,V_in,'b--')
grid on
hold on
plot(t,V_out,'r--')
plot(t,V_out-V_in,'ok')
