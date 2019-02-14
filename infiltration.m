clc
clear all
close all

% LOAD SAMPLE-PLANE DATA
data = importdata('plane-1-3800');
data = data.data;
data = data(:,2:end);

% X-Y-Z COORDINATES
x = data(:,1);
y = data(:,2);
z = data(:,3);

% STARTING TIMESTEP: N0
% TOTAL NUM OF TIMESTEPS: N
N0 = 3800;
N = 103 ;

% TIME INTERVAL
dt = 0.1;           % sampling frequency - every 0.1 s

% AREA OF DOOR
A = 1.5*2.1;              % A = area of door 

% SPACE INTERVAL
dL = 0.01;
dA = dL^2;         % dA = (space between sampling points)^2

% CONSTRUCT MESH GRID
[yq,zq] = meshgrid(4.125:dL:5.625,0:dL:2.1);

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
    
    %% x y z magV u v w
    uq = griddata(data(:,2),data(:,3),data(:,5),yq,zq,'nearest');
    
    u(:,i) = uq(:);
    t(i) = i*0.1;
end

u_in = u;
u_out = u;

u_in(u>=0)=0;       % set air outgoing to be 0
u_out(u<=0)=0;      % set air ingoing to be 0

V_in = sum(u_in,1)*dA;
% V_in = mean(u_in,1)*A
V_in = V_in';

V_out = sum(u_out,1)*dA;
% V_out = mean(u_out,1)*A;
V_out = V_out';

sum(V_in)*dt
sum(V_out)*dt
sum(V_out+V_in)*dt

% figure
plot(t,V_in,'b--')
grid on
hold on
plot(t,V_out,'r--')
plot(t,V_out+V_in,'ok')
