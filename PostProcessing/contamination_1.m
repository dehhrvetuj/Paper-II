%% PLOT OVERALL OR CONTAMINATION 0-5 MIN FOR CASE A5 (SUMMER AND WINTER)
%%

clc
clear all
close all

data1 = importdata('./summer/case5-1/data.dat');
data2 = importdata('./winter/case5-1/data.dat');

t1 = data1(:,2);
t2 = data2(:,2);

t1 = t1 - 741;
t2 = t2- 601;

p1 = data1(:,9);
p2 = data2(:,9);


% SCALE DPM CONCENTRATION
scale1 = 180/8.3e-11;       % 180 CFU/m^3 / 8.3e-11 kg/m^3
scale2 = 180/8.2e-11;
dpm1 = data1(:,14)*scale1;
dpm2 = data2(:,14)*scale2;


% DEFINE PLOT PROPERTIES 
linewidth = 2.5;
fontsize = 16;
markersize = 120;


figure(1)
hold on
box on

plot(t1,dpm1,'LineStyle','-','LineWidth',linewidth-1,'Color','r');
plot(t2,dpm2,'LineStyle','--','LineWidth',linewidth-1,'Color','b');


% SET PLOT LINE WIDTH AND FONT SIZE
set(gca,'LineWidth',linewidth/2,'FontSize',fontsize);

% SET X AND Y LABELS
xlabel('Time [min]','FontSize',fontsize-1,'FontWeight','bold','Color','k');
ylabel('CFU/m^3','FontSize',fontsize-1,'FontWeight','bold','Color','k');

% SET X AND Y AXIS LIMITS AND MAJOR TICKS
% axis([-1 21 -0.2 5.2])
set(gca,'XLim',[0 300],'XTick',0:60:300);
set(gca,'YLim',[0 2.5001],'YTick',0:0.5:2.5);
set(gca,'XTickLabel', {'0','1','2','3','4','5'});
set(gca,'YTickLabel', {'0','0.5','1.0','1.5','2.0','2.5'});

% SET X AND Y MINOR TICKS
set(gca,'XMinorTick','on','YMinorTick','on');
axs = gca;
axs.XRuler.MinorTick = 0:10:300; 
axs.YRuler.MinorTick = 0:0.1:2.5; 

% SET LEGEND
[leg,objects] = legend({'A-5 (summer)', 'A-5 (winter)'},'Location','best','FontSize',fontsize-4);
set(leg,'LineWidth',(linewidth/2-0.1));
objects(1).Position(1) = 0.36;
objects(2).Position(1) = 0.36;
objects(3).XData(2) = 0.33;
objects(5).XData(2) = 0.33;
leg.Position(3) = 0.29;

% SET GRID LINE PROPERTIES
grid on
grid minor
set(gca,'GridLineStyle',':','MinorGridLineStyle',':','GridAlpha',0.05,'MinorGridAlpha',0.05);
set(gca,'GridColor',[0.1 0.1 0.1],'MinorGridColor',[0.1 0.1 0.1]);
% grid off


