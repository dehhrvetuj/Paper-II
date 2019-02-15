clc
clear all
close all

data=importdata('Inlet.csv');
data=data.data;

% SWITCH Y AND Z
x = data(:,1); 
z = data(:,2); 
y = data(:,3);

u = data(:,4); 
w = data(:,5); 
v = data(:,6);

% SET UPWARD VELOCITY TO ZERO
w(w>0) = -0.001;

mag = sqrt(u.^2 + v.^2 + w.^2);

% figure
% scatter(x,y,[],mag,'.');


% -------------
I = abs(x)>1.5 & abs(y)>1.5;

x(I) = NaN;
y(I) = NaN;

u(I) = NaN;
v(I) = NaN;
w(I) = NaN;

x = x(~isnan(x));
y = y(~isnan(y));
u = u(~isnan(u));
v = v(~isnan(v));
w = w(~isnan(w));


x = [x+3.6; x-3.6; x; x];
y = [y; y; y+3.6; y-3.6];

u = [u; u; u; u];
v = [v; v; v; v];
w = [w; w; w; w];

% -----
I = abs(x)>2.1 | abs(y)>2.1;

x(I) = NaN;
y(I) = NaN;

u(I) = NaN;
v(I) = NaN;
w(I) = NaN;

x = x(~isnan(x));
y = y(~isnan(y));
u = u(~isnan(u));
v = v(~isnan(v));
w = w(~isnan(w));


% GENERATE RECTANGULAR GRID (-2.1 2.1)
[xq,yq] = meshgrid(-2.1:0.005:2.1);

% INTERPOLATE ON GIRD
uq = griddata(x,y,u,xq,yq,'nearest');
vq = griddata(x,y,v,xq,yq,'nearest');
wq = griddata(x,y,w,xq,yq,'nearest');

% mesh(xq,yq,wq);

% save inlet_profile

% ELIMINATE NaN
uq(isnan(uq)) = 0;
vq(isnan(vq)) = 0;
wq(isnan(wq)) = 0;

% MARK POINTS WITHIN (-1.5 1.5) WITH NaN
I = abs(xq)<1.5 & abs(yq)<1.5;

xq(I) = NaN;
yq(I) = NaN;
uq(I) = NaN;
vq(I) = NaN;
wq(I) = NaN;

% RESHAPE GRID MATRIX INTO VECTOR
xq = xq(:);
yq = yq(:);
uq = uq(:);
vq = vq(:);
wq = wq(:);

% ELIMINATE POINTS MARKED BY NaN
xq = xq(~isnan(xq));
yq = yq(~isnan(yq));
uq = uq(~isnan(uq));
vq = vq(~isnan(vq));
wq = wq(~isnan(wq));

zq = ones(length(xq),1)*3.2;

% ----------
I = abs(xq)>1.5 & abs(yq)>1.5;

uq(I) = 0;
vq(I) = 0;
wq(I) = -0.243;


% PLOT FIGURE
magq = sqrt(uq.^2 + vq.^2 + wq.^2);

figure
scatter(xq,yq,[],magq,'.');

% TRANSLATE THE COORDINATE
xq = xq + 3.50;
yq = yq + 4.46;

% EXPORT DATA IN SCHEME FORMAT FOR FLUENT USE
nrow = length(xq);

fileID = fopen('or-inlet-alt','w');

fprintf(fileID,'%s %d %s\n','((or-inlet-profile-alt point', nrow,')');

fprintf(fileID,'%s\n','(x');
for i=1:nrow
    fprintf(fileID,'%f\n',xq(i));
end
fprintf(fileID,'%s\n',')');

fprintf(fileID,'%s\n','(y');
for i=1:nrow    
    fprintf(fileID,'%f\n',yq(i));    
end
fprintf(fileID,'%s\n',')');

fprintf(fileID,'%s\n','(z');
for i=1:nrow
    
    fprintf(fileID,'%f\n',zq(i));  
end
fprintf(fileID,'%s\n',')');

fprintf(fileID,'%s\n','(u');
for i=1:nrow   
    fprintf(fileID,'%f\n',uq(i));  
end
fprintf(fileID,'%s\n',')');

fprintf(fileID,'%s\n','(v');
for i=1:nrow
    fprintf(fileID,'%f\n',vq(i));   
end
fprintf(fileID,'%s\n',')');

fprintf(fileID,'%s\n','(w');
for i=1:nrow  
    fprintf(fileID,'%f\n',wq(i));
end
fprintf(fileID,'%s\n',')');

fclose(fileID);
