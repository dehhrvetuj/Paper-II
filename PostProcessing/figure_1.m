% clc
% clear all
% close all
% 
% set(0,'defaultAxesFontName', 'Garamond');
% set(0,'defaultTextFontName', 'Garamond');
% 
% row = 313:909;
% col = 82:2075;
% 
% gap_h = 200;    % horizontal gap
% gap_v = 300;    % vertical gap

% split the figure inot 4X2 subfigures
ii = 4; jj = 2;
A = cell(ii,jj);

% X = imread('./transient/T-A-5-summer-0s.png'); A{1,1} = X(row,col,:);
% X = imread('./transient/T-A-5-winter-0s.png'); A{1,2} = X(row,col,:);
% X = imread('./transient/T-A-5-summer-5s.png'); A{2,1} = X(row,col,:);
% X = imread('./transient/T-A-5-winter-5s.png'); A{2,2} = X(row,col,:);
% X = imread('./transient/T-A-5-summer-15s.png'); A{3,1} = X(row,col,:);
% X = imread('./transient/T-A-5-winter-15s.png'); A{3,2} = X(row,col,:);
% X = imread('./transient/T-A-5-summer-20s.png'); A{4,1} = X(row,col,:);
% X = imread('./transient/T-A-5-winter-20s.png'); A{4,2} = X(row,col,:);

X = imread('./transient/C-A-5-summer-0s.png'); A{1,1} = X(row,col,:);
X = imread('./transient/C-A-5-winter-0s.png'); A{1,2} = X(row,col,:);
X = imread('./transient/C-A-5-summer-5s.png'); A{2,1} = X(row,col,:);
X = imread('./transient/C-A-5-winter-5s.png'); A{2,2} = X(row,col,:);
X = imread('./transient/C-A-5-summer-15s.png'); A{3,1} = X(row,col,:);
X = imread('./transient/C-A-5-winter-15s.png'); A{3,2} = X(row,col,:);
X = imread('./transient/C-A-5-summer-20s.png'); A{4,1} = X(row,col,:);
X = imread('./transient/C-A-5-winter-20s.png'); A{4,2} = X(row,col,:);

% figure
% subplot(4,2,1), imshow(A{1,1});
% subplot(4,2,2), imshow(A{1,2});
% subplot(4,2,3), imshow(A{2,1});
% subplot(4,2,4), imshow(A{2,2});
% subplot(4,2,5), imshow(A{3,1});
% subplot(4,2,6), imshow(A{3,2});
% subplot(4,2,7), imshow(A{4,1});
% subplot(4,2,8), imshow(A{4,2});


M(:,:,1) = ones(length(row),gap_h)*255;
M(:,:,2) = ones(length(row),gap_h)*255;
M(:,:,3) = ones(length(row),gap_h)*255;
N(:,:,1) = ones(gap_v,length(col)*2+3*gap_h)*255;
N(:,:,2) = ones(gap_v,length(col)*2+3*gap_h)*255;
N(:,:,3) = ones(gap_v,length(col)*2+3*gap_h)*255;



B = [N                      ; 
     M A{1,1} M A{1,2} M    ; 
     N                      ;
     M A{2,1} M A{2,2} M    ; 
     N                      ;
     M A{3,1} M A{3,2} M    ; 
     N                      ;
     M A{4,1} M A{4,2} M    ; 
     N;
     N                      ];




B = insertText(B,(pos+[0,0]),                    'a) t=0s','FontSize',fontsize,'BoxOpacity',0);
B = insertText(B,(pos+[0,(gap_v+length(row))*1]),'b) t=5s','FontSize',fontsize,'BoxOpacity',0);
B = insertText(B,(pos+[0,(gap_v+length(row))*2]),'c) t=15s','FontSize',fontsize,'BoxOpacity',0);
B = insertText(B,(pos+[0,(gap_v+length(row))*3]),'d) t=20s','FontSize',fontsize,'BoxOpacity',0);






