%% 

clc
clear all
close all

data1_A = importdata('./summer/case5/data.dat');
data1_B = importdata('./summer/P10/data.dat');
data1_C = importdata('./summer/P20/data.dat');
data1_D = importdata('./summer/P30/data.dat');

data2_A = importdata('./winter/case5/data.dat');
data2_B = importdata('./winter/P10/data.dat');
data2_C = importdata('./winter/P20/data.dat');
data2_D = importdata('./winter/P30/data.dat');

I = 10:10:2200;

t1 = data1_A(I,2);
t2 = data2_A(I,2);

t1 = t1 - 741;
t2 = t2 - 601;


% p1_A = data1_A(I,3)*-1-0.1069;
% p1_B = data1_B(I,3)*-1-0.1069;
% p1_C = data1_C(I,3)*-1-0.1069;
% p1_D = data1_D(I,3)*-1-0.1069;
% 
% p2_A = data2_A(I,3)*-1-0.1069;
% p2_B = data2_B(I,3)*-1-0.1069;
% p2_C = data2_C(I,3)*-1-0.1069;
% p2_D = data2_D(I,3)*-1-0.1069;

p1_A = data1_A(I,9);
p1_B = data1_B(I,9);
p1_C = data1_C(I,9);
p1_D = data1_D(I,9);

p2_A = data2_A(I,9);
p2_B = data2_B(I,9);
p2_C = data2_C(I,9);
p2_D = data2_D(I,9);

% MEDIAN FILTERING
order = 3;
p1_A = medfilt1(p1_A,order);
p1_B = medfilt1(p1_B,order);
p1_C = medfilt1(p1_C,order);
p1_D = medfilt1(p1_D,order);

p2_A = medfilt1(p2_A,order);
p2_B = medfilt1(p2_B,order);
p2_C = medfilt1(p2_C,order);
p2_D = medfilt1(p2_D,order);



% DEFINE PLOT PROPERTIES 
linewidth = 2.5;
fontsize = 16;
markersize = 120;


figure(1)
hold on
box on

% plot(t1,p1_A,'LineStyle','-','LineWidth',linewidth-1,'Color','r');
plot(t1,p1_B,'LineStyle','-','LineWidth',linewidth-1,'Color','b');
plot(t1,p1_C,'LineStyle','-','LineWidth',linewidth-1,'Color','g');
plot(t1,p1_D,'LineStyle','-','LineWidth',linewidth-1,'Color','c');

% plot(t2,p2_A,'LineStyle','--','LineWidth',linewidth-1,'Color','r');
% plot(t2,p2_B,'LineStyle','--','LineWidth',linewidth-1,'Color','b');
% plot(t2,p2_C,'LineStyle','--','LineWidth',linewidth-1,'Color','g');
% plot(t2,p2_D,'LineStyle','--','LineWidth',linewidth-1,'Color','c');


% SET PLOT LINE WIDTH AND FONT SIZE
set(gca,'LineWidth',linewidth/2,'FontSize',fontsize);

% SET X AND Y LABELS
xlabel('Time [s]','FontSize',fontsize-1,'FontWeight','bold','Color','k');
ylabel('\DeltaP [Pa]','FontSize',fontsize-1,'FontWeight','bold','Color','k');

% SET X AND Y AXIS LIMITS AND MAJOR TICKS
% axis([-1 21 -0.2 5.2])
% set(gca,'XLim',[-1 21],'XTick',0:5:20);
set(gca,'XLim',[0 20],'XTick',0:5:20);
set(gca,'YLim',[-0.2 5.2],'YTick',[0 1 2 3 4 5]);
% set(gca,'XTickLabel', {'0','1','2','3','4','5'});
% set(gca,'YTickLabel', {'0','0.5','1.0','1.5','2.0','2.5'});

% SET X AND Y MINOR TICKS
set(gca,'XMinorTick','on','YMinorTick','on');
axs = gca;
axs.XRuler.MinorTick = 0:1:20; 
% axs.YRuler.MinorTick = 0:0.2:5; 

% SET LEGEND
[leg,objects] = legend({'Case B (summer)','Case C (summer)','Case D (summer)', ... 
    'A-5 (winter)','B-5 (winter)','C-5 (winter)','D-5 (winter)'},'Location','north','FontSize',fontsize-5);
set(leg,'LineWidth',(linewidth/2-0.1));

% for i=1:8
%     objects(i).Position(1) = 0.385;
%     objects(i*2+8-1).XData(2) = 0.345;
% end

for i=1:3
    objects(i).Position(1) = 0.385;
    objects(i*2+3-1).XData(2) = 0.345;
end

leg.Position(3) = 0.35;

% SET GRID LINE PROPERTIES
grid on
grid minor
set(gca,'GridLineStyle',':','MinorGridLineStyle',':','GridAlpha',0.05,'MinorGridAlpha',0.05);
set(gca,'GridColor',[0.1 0.1 0.1],'MinorGridColor',[0.1 0.1 0.1]);
grid off


