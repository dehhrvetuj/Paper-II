clc
clear all
close all

% [x,z] = meshgrid(0:0.02:10.7,0:0.02:3.2);
[x,z] = meshgrid(0:0.05:10.7,0:0.05:3.2);

sz = size(x);

x = x(:);
z = z(:);
y = ones(length(x),1)*4.875;


% dlmwrite('positions.txt',[x y z],'Delimiter','\t','precision','%.3f');


if true
% ********************************************************************* %
% 
filename = '.\15cm_5cm\output-A5-0s-winter';
% data = importdata('output.txt-A10-summer');
data = importdata(filename);
data = data./8.0e-11*180;
% 
%
data = reshape(data,sz);
data(:,150:157) = 0;
data(:,158:159) = 180;
data = data(:);
% figure
% scatter(x,z,[],data,'.');

data(data>100) = 100;


% % ************ 1st way to plot *********** %
% 
% dx = 1; % amount of blue and red at the beginning & end of the colormap
% n = 181;  % number of entries in the rainbow colormap
% [cmapRainbow, g, f]=rainbow_cmap(n, dx);
% 
% A = data(:);
% A = reshape(A,sz);
% 
% A = A(end:-1:1,:);
% A = imresize(A,sz*10);
% 
% figure
% image(A)
% colormap(cmapRainbow)
% colorbar
% 
% 
% ************ 2nd way to plot *********** %
% 
% dx = 1; % amount of blue and red at the beginning & end of the colormap
% n = 181;  % number of entries in the rainbow colormap
% [cmapRainbow, g, f]=rainbow_cmap(n, dx);
% 
% A = data(:);
% A = A./max(A);
% 
% A = reshape(A,sz);
% A = A(end:-1:1,:);
% 
% A = imresize(A,sz*10);
% 
% figure
% imshow(A)
% colormap(cmapRainbow)
% colorbar



% ************ 3rd way to plot *********** %

dx = 1; % amount of blue and red at the beginning & end of the colormap
n = 181;  % number of entries in the rainbow colormap
[cmapRainbow, g, f]=rainbow_cmap(n, dx);

A = data(:);
A = A./max(A);

A = reshape(A,sz);
A = A(end:-1:1,:);

A = imresize(A,[597 1994]);

A(A>1) = 1;
A(A<0) = 0;


B = 255*interp1(f,cmapRainbow,A(:));
B = uint8(B);

B = reshape(B,[597 1994 3]);

figure
imshow(B, 'Border','tight')

% ********************************** % 
X = imread('./C-A-05-summer.png');
Y = imread('./wireframe.png');

row = 313:909;
col = 82:2075;

X = X(row,col,:);
Y = Y(row,col,:);


% figure
% imshow(X,'Border','tight')
% 
% figure
% imshow(Y,'Border','tight')

%% replicate the pure white that is outside domain 
I = (X(:,:,1)==255 & X(:,:,2)==255 & X(:,:,3)==255);

II(:,:,1)=I;
II(:,:,2)=I;
II(:,:,3)=I;

B(II) = X(II);

%% replicate the wireframe
I = (Y(:,:,1)<255 & X(:,:,2)<255 & X(:,:,3)<255);

II(:,:,1)=I;
II(:,:,2)=I;
II(:,:,3)=I;

B(II) = Y(II);


%% plot and write
figure
imshow(B,'Border','tight')


X = imread('./C-A-05-summer.png');

X(row,col,:) = B;

imwrite(X,[filename '.png']);



end