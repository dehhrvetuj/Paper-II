clc
clear all
close all

set(0,'defaultAxesFontName', 'Garamond');
set(0,'defaultTextFontName', 'Garamond');

row = 313:909;
col = 82:2075;

gap_h = 200;    % horizontal gap
gap_v = 300;    % vertical gap


% set start pos for text 
pos = [gap_h-40, gap_v-150];
fontsize = 90;

% PLOT FIGURE 1-3
figure_1;
% figure_2;
% figure_3;

% INSERT LEGEND AND AXIS
legend;


% WRITE FIGURE
writefigure;




