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

I = 10:10:2100;

t1 = data1_A(I,2);
t2 = data2_A(I,2);

t1 = t1 - 741;
t2 = t2- 601;

% SCALE DPM CONCENTRATION
scale1 = 180/8.3e-11;       % 180 CFU/m^3 / 8.3e-11 kg/m^3
scale2 = 180/8.2e-11;

dpm1_A = data1_A(I,14)*scale1;
dpm1_B = data1_B(I,14)*scale1;
dpm1_C = data1_C(I,14)*scale1;
dpm1_D = data1_D(I,14)*scale1;

dpm2_A = data2_A(I,14)*scale2;
dpm2_B = data2_B(I,14)*scale2;
dpm2_C = data2_C(I,14)*scale2;
dpm2_D = data2_D(I,14)*scale2;

% MEDIAN FILTERING
order = 5;
dpm1_A = medfilt1(dpm1_A,order);
dpm1_B = medfilt1(dpm1_B,order);
dpm1_C = medfilt1(dpm1_C,order);
dpm1_D = medfilt1(dpm1_D,order);

dpm2_A = medfilt1(dpm2_A,order);
dpm2_B = medfilt1(dpm2_B,order);
dpm2_C = medfilt1(dpm2_C,order);
dpm2_D = medfilt1(dpm2_D,order);



% DEFINE PLOT PROPERTIES 
linewidth = 2.5;
fontsize = 16;
markersize = 120;


figure(1)
hold on
box on

plot(t1,dpm1_A,'LineStyle','-','LineWidth',linewidth-1,'Color','r');
plot(t1,dpm1_B,'LineStyle','-','LineWidth',linewidth-1,'Color','b');
plot(t1,dpm1_C,'LineStyle','-','LineWidth',linewidth-1,'Color','g');
plot(t1,dpm1_D,'LineStyle','-','LineWidth',linewidth-1,'Color','c');

plot(t2,dpm2_A,'LineStyle','--','LineWidth',linewidth-1,'Color','r');
plot(t2,dpm2_B,'LineStyle','--','LineWidth',linewidth-1,'Color','b');
plot(t2,dpm2_C,'LineStyle','--','LineWidth',linewidth-1,'Color','g');
plot(t2,dpm2_D,'LineStyle','--','LineWidth',linewidth-1,'Color','c');


% SET PLOT LINE WIDTH AND FONT SIZE
set(gca,'LineWidth',linewidth/2,'FontSize',fontsize);

% SET X AND Y LABELS
xlabel('Time [s]','FontSize',fontsize-1,'FontWeight','bold','Color','k');
ylabel('CFU/m^3','FontSize',fontsize-1,'FontWeight','bold','Color','k');

% SET X AND Y AXIS LIMITS AND MAJOR TICKS
% axis([-1 21 -0.2 5.2])
set(gca,'XLim',[0 20],'XTick',0:5:20);
set(gca,'YLim',[0 2.5001],'YTick',0:0.5:2.5);
% set(gca,'XTickLabel', {'0','1','2','3','4','5'});
set(gca,'YTickLabel', {'0','0.5','1.0','1.5','2.0','2.5'});

% SET X AND Y MINOR TICKS
set(gca,'XMinorTick','on','YMinorTick','on');
axs = gca;
axs.XRuler.MinorTick = 0:1:20; 
axs.YRuler.MinorTick = 0:0.1:2.5; 

% SET LEGEND
[leg,objects] = legend({'A-5 (summer)', 'B-5 (summer)','C-5 (summer)','D-5 (summer)', ... 
    'A-5 (winter)','B-5 (winter)','C-5 (winter)','D-5 (winter)'},'Location','northwest','FontSize',fontsize-5);
set(leg,'LineWidth',(linewidth/2-0.1));
for i=1:8
    objects(i).Position(1) = 0.385;
    objects(i*2+8-1).XData(2) = 0.345;
end

leg.Position(3) = 0.275;

% SET GRID LINE PROPERTIES
grid on
grid minor
set(gca,'GridLineStyle',':','MinorGridLineStyle',':','GridAlpha',0.05,'MinorGridAlpha',0.05);
set(gca,'GridColor',[0.1 0.1 0.1],'MinorGridColor',[0.1 0.1 0.1]);
% grid off


