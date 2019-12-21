%% PLOT OVERALL OR CONTAMINATION 0-5 MIN FOR CASE A5 (SUMMER AND WINTER)
%%

clc
clear all
close all

t = (0:1:3)*0.1;


overall_mean = [0.72 0.34 0.05 0.01; 0.53 0.30 0.16 0.02];
overall_max = [2.12 1.05 0.29 0.09; 2.09 1.16 0.47 0.13];

local_mean = [0.21 0.12 0.02 0.00; 1.06 0.62 0.29 0.01];
local_max = [0.78 1.04 0.30 0.00; 12.45 5.10 2.46 0.22;];


% DEFINE PLOT PROPERTIES 
linewidth = 2.5;
fontsize = 16;
markersize = 120;


% PLOT FIGURES
figure(1)
hold on
box on


h1 = scatter(t,overall_mean(1,:), markersize,'r','filled','s'); %,'LineWidth',6);
h2 = scatter(t,overall_mean(2,:), markersize,'b','filled','d'); %,'LineWidth',6);

plot(t,overall_mean(1,:),'LineStyle','--','LineWidth',linewidth-1,'Color','r');
plot(t,overall_mean(2,:),'LineStyle','--','LineWidth',linewidth-1,'Color','b');



% SET PLOT LINE WIDTH AND FONT SIZE
set(gca,'LineWidth',linewidth/2,'FontSize',fontsize);

% SET X AND Y LABELS
xlabel('Flow Rate Reduction','FontSize',fontsize-2,'FontWeight','bold','Color','k');
ylabel('CFU/m^3','FontSize',fontsize-1,'FontWeight','bold','Color','k');

% SET X AND Y AXIS LIMITS AND MAJOR TICKS
set(gca,'XLim',[-0.02 0.32],'XTick',0:0.1:0.4);
set(gca,'YLim',[0 1],'YTick',0:0.2:1);
set(gca,'XTickLabel', {'0%','10%','20%','30%'});
% set(gca,'YTickLabel', {'0','5','10','15'});
 

% SET LEGEND
[leg,objects] = legend([h1 h2],{' summer', ' winter'},'Location','best','FontSize',fontsize-4);

objects(3).Children.MarkerSize = 9;
objects(4).Children.MarkerSize = 9;



figure(2)
hold on
box on

h1 = scatter(t,overall_max(1,:), markersize,'r','filled','s'); %,'LineWidth',6);
h2 = scatter(t,overall_max(2,:), markersize,'b','filled','d'); %,'LineWidth',6);

plot(t,overall_max(1,:),'LineStyle','--','LineWidth',linewidth-1,'Color','r');
plot(t,overall_max(2,:),'LineStyle','--','LineWidth',linewidth-1,'Color','b');



% SET PLOT LINE WIDTH AND FONT SIZE
set(gca,'LineWidth',linewidth/2,'FontSize',fontsize);

% SET X AND Y LABELS
xlabel('Flow Rate Reduction','FontSize',fontsize-2,'FontWeight','bold','Color','k');
ylabel('CFU/m^3','FontSize',fontsize-1,'FontWeight','bold','Color','k');

% SET X AND Y AXIS LIMITS AND MAJOR TICKS
% axis([-1 21 -0.2 5.2])
set(gca,'XLim',[-0.02 0.32],'XTick',0:0.1:0.4);
set(gca,'YLim',[0 2.5],'YTick',0:0.5:2.5);
set(gca,'XTickLabel', {'0%','10%','20%','30%'});
% set(gca,'YTickLabel', {'0','5','10','15'});

% SET LEGEND
[leg,objects] = legend([h1 h2],{' summer', ' winter'},'Location','best','FontSize',fontsize-4);

objects(3).Children.MarkerSize = 9;
objects(4).Children.MarkerSize = 9;



figure(3)
hold on
box on


h1 = scatter(t,local_mean(1,:), markersize,'r','filled','s'); %,'LineWidth',6);
h2 = scatter(t,local_mean(2,:), markersize,'b','filled','d'); %,'LineWidth',6);

plot(t,local_mean(1,:),'LineStyle','--','LineWidth',linewidth-1,'Color','r');
plot(t,local_mean(2,:),'LineStyle','--','LineWidth',linewidth-1,'Color','b');



% SET PLOT LINE WIDTH AND FONT SIZE
set(gca,'LineWidth',linewidth/2,'FontSize',fontsize);

% SET X AND Y LABELS
xlabel('Flow Rate Reduction','FontSize',fontsize-2,'FontWeight','bold','Color','k');
ylabel('CFU/m^3','FontSize',fontsize-1,'FontWeight','bold','Color','k');

% SET X AND Y AXIS LIMITS AND MAJOR TICKS
set(gca,'XLim',[-0.02 0.32],'XTick',0:0.1:0.4);
set(gca,'YLim',[0 1.2],'YTick',0:0.4:1.2);
set(gca,'XTickLabel', {'0%','10%','20%','30%'});
% set(gca,'YTickLabel', {'0','5','10','15'});
 

% SET LEGEND
[leg,objects] = legend([h1 h2],{' summer', ' winter'},'Location','best','FontSize',fontsize-4);

objects(3).Children.MarkerSize = 9;
objects(4).Children.MarkerSize = 9;



figure(4)
hold on
box on

h1 = scatter(t,local_max(1,:), markersize,'r','filled','s'); %,'LineWidth',6);
h2 = scatter(t,local_max(2,:), markersize,'b','filled','d'); %,'LineWidth',6);

plot(t,local_max(1,:),'LineStyle','--','LineWidth',linewidth-1,'Color','r');
plot(t,local_max(2,:),'LineStyle','--','LineWidth',linewidth-1,'Color','b');



% SET PLOT LINE WIDTH AND FONT SIZE
set(gca,'LineWidth',linewidth/2,'FontSize',fontsize);

% SET X AND Y LABELS
xlabel('Flow Rate Reduction','FontSize',fontsize-2,'FontWeight','bold','Color','k');
ylabel('CFU/m^3','FontSize',fontsize-1,'FontWeight','bold','Color','k');

% SET X AND Y AXIS LIMITS AND MAJOR TICKS
% axis([-1 21 -0.2 5.2])
set(gca,'XLim',[-0.02 0.32],'XTick',0:0.1:0.4);
set(gca,'YLim',[0 15],'YTick',0:5:15);
set(gca,'XTickLabel', {'0%','10%','20%','30%'});
% set(gca,'YTickLabel', {'0','5','10','15'});

% SET LEGEND
[leg,objects] = legend([h1 h2],{' summer', ' winter'},'Location','best','FontSize',fontsize-4);

objects(3).Children.MarkerSize = 9;
objects(4).Children.MarkerSize = 9;