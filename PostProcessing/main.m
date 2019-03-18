clc
clear all
close all

data1 = importdata('./summer/case5/data.dat');
data2 = importdata('./winter/case5/data.dat');

t1 = data1(:,2);
t2 = data2(:,2);

p1 = data1(:,9);
p2 = data2(:,9);


t1 = t1(10:10:end);
t2 = t2(10:10:end);

p1 = p1(10:10:end);
p2 = p2(10:10:end);

% MEDIAN FILTERING
p1 = medfilt1(p1,3);
p2 = medfilt1(p2,3);

t1 = t1 - 741;
t2 = t2- 601;


% DEFINE PLOT PROPERTIES 
linewidth = 2.5;
fontsize = 16;
markersize = 120;


figure(1)
% grid on
hold on
box on

plot(t1,p1,'LineStyle','-','LineWidth',linewidth-1,'Color','r');
plot(t2,p2,'LineStyle','--','LineWidth',linewidth-1,'Color','b');

% SET PLOT LINE WIDTH AND FONT SIZE
set(gca,'LineWidth',linewidth/2,'FontSize',fontsize);

% SET X AND Y LABELS
xlabel('Time [s]','FontSize',fontsize-1,'FontWeight','bold','Color','k');
ylabel('\DeltaP [Pa]','FontSize',fontsize-1,'FontWeight','bold','Color','k');

% SET X AND Y AXIS LIMITS AND MAJOR TICKS
% axis([-1 21 -0.2 5.2])
set(gca,'XLim',[-1 21],'XTick',0:5:20);
set(gca,'YLim',[-0.2 5.2],'YTick',[0 1 2 3 4 5]);

% SET X AND Y MINOR TICKS
set(gca,'XMinorTick','on','YMinorTick','on');
axs = gca;
axs.XRuler.MinorTick = 0:1:20; 
axs.YRuler.MinorTick = 0:0.2:5; 

% SET LEGEND
[leg,objects] = legend('A-5 (summer)', 'A-5 (winter)','Location','north');
set(leg,'FontSize',fontsize-2);
objects(1).Position(1) = 0.32;
objects(2).Position(1) = 0.32;
objects(3).XData(2) = 0.29;
objects(5).XData(2) = 0.29;
leg.Position(3) = 0.32;
