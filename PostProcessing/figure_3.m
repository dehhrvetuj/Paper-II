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
% gap_v = 250;    % vertical gap

% split the figure inot 4X2 subfigures
ii = 4; jj = 2;
A = cell(ii,jj);


% X = imread('./T-A-05-summer.png'); A{1,1} = X(row,col,:);
% X = imread('./T-A-05-winter.png'); A{1,2} = X(row,col,:);
% X = imread('./T-B-05-summer.png'); A{2,1} = X(row,col,:);
% X = imread('./T-B-05-winter.png'); A{2,2} = X(row,col,:);
% X = imread('./T-C-05-summer.png'); A{3,1} = X(row,col,:);
% X = imread('./T-C-05-winter.png'); A{3,2} = X(row,col,:);
% X = imread('./T-D-05-summer.png'); A{4,1} = X(row,col,:);
% X = imread('./T-D-05-winter.png'); A{4,2} = X(row,col,:);

X = imread('./C-A-05-summer.png'); A{1,1} = X(row,col,:);
X = imread('./C-A-05-winter.png'); A{1,2} = X(row,col,:);
X = imread('./C-B-05-summer.png'); A{2,1} = X(row,col,:);
X = imread('./C-B-05-winter.png'); A{2,2} = X(row,col,:);
X = imread('./C-C-05-summer.png'); A{3,1} = X(row,col,:);
X = imread('./C-C-05-winter.png'); A{3,2} = X(row,col,:);
X = imread('./C-D-05-summer.png'); A{4,1} = X(row,col,:);
X = imread('./C-D-05-winter.png'); A{4,2} = X(row,col,:);

% figure
% subplot(4,2,1), imshow(A{1,1});
% subplot(4,2,2), imshow(A{1,2});
% subplot(4,2,3), imshow(A{2,1});
% subplot(4,2,4), imshow(A{2,2});
% subplot(4,2,5), imshow(A{3,1});
% subplot(4,2,6), imshow(A{3,2});
% subplot(4,2,5), imshow(A{4,1});
% subplot(4,2,6), imshow(A{4,2});


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
     N                      ;
     N                      ];



pos = [gap_h-5, gap_v-100];


B = insertText(B,(pos+[0,0]),'a) A-5 (0%)','FontSize',fontsize,'BoxOpacity',0);
B = insertText(B,(pos+[0,(gap_v+length(row))*1]),'b) B-5 (10%)','FontSize',fontsize,'BoxOpacity',0);
B = insertText(B,(pos+[0,(gap_v+length(row))*2]),'c) C-5 (20%)','FontSize',fontsize,'BoxOpacity',0);
B = insertText(B,(pos+[0,(gap_v+length(row))*3]),'d) D-5 (30%)','FontSize',fontsize,'BoxOpacity',0);




