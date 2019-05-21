%% 

clc
clear all
close all

data1_05 = importdata('./summer/case5/data.dat');
data1_10 = importdata('./summer/case10/data.dat');
data1_15 = importdata('./summer/case15/data.dat');

data2_05 = importdata('./winter/case5/data.dat');
data2_10 = importdata('./winter/case10/data.dat');
data2_15 = importdata('./winter/case15/data.dat');

t1 = data1_05(10:10:end,2);
t2 = data2_05(10:10:end,2);

t1 = t1 - 741;
t2 = t2- 601;

% SCALE DPM CONCENTRATION
scale1 = 180/8.3e-11;       % 180 CFU/m^3 / 8.3e-11 kg/m^3
scale2 = 180/8.2e-11;

dpm1_05 = data1_05(10:10:end,14)*scale1 * 1;
dpm1_10 = data1_10(10:10:end,14)*scale1 * 1.05;
dpm1_15 = data1_15(10:10:end,14)*scale1 * 1.1 ;

dpm2_05 = data2_05(10:10:end,14)*scale2 * 1;
dpm2_10 = data2_10(10:10:end,14)*scale2 * 1.05;
dpm2_15 = data2_15(10:10:end,14)*scale2 * 1.1;

% MEDIAN FILTERING
order = 5;
dpm1_05 = medfilt1(dpm1_05,order);
dpm1_10 = medfilt1(dpm1_10,order);
dpm1_15 = medfilt1(dpm1_15,order);

dpm2_05 = medfilt1(dpm2_05,order);
dpm2_10 = medfilt1(dpm2_10,order);
dpm2_15 = medfilt1(dpm2_15,order);



% DEFINE PLOT PROPERTIES 
linewidth = 2.5;
fontsize = 16;
markersize = 120;


figure(1)
hold on
box on

plot(t1,dpm1_05,'LineStyle','-','LineWidth',linewidth-1,'Color','r');
plot(t1,dpm1_10,'LineStyle','-','LineWidth',linewidth-1,'Color','b');
plot(t1,dpm1_15,'LineStyle','-','LineWidth',linewidth-1,'Color','g');

plot(t2,dpm2_05,'LineStyle','--','LineWidth',linewidth-1,'Color','r');
plot(t2,dpm2_10,'LineStyle','--','LineWidth',linewidth-1,'Color','b');
plot(t2,dpm2_15,'LineStyle','--','LineWidth',linewidth-1,'Color','g');


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
[leg,objects] = legend({'A-5   (summer)', 'A-10 (summer)','A-15 (summer)','A-5   (winter)', 'A-10 (winter)','A-15 (winter)'}, ... 
    'Location','northwest','FontSize',fontsize-5);
set(leg,'LineWidth',(linewidth/2-0.1));
for i=1:6
    objects(i).Position(1) = 0.37;
    objects(i*2+6-1).XData(2) = 0.33;
end

leg.Position(3) = 0.29;

% SET GRID LINE PROPERTIES
grid on
grid minor
set(gca,'GridLineStyle',':','MinorGridLineStyle',':','GridAlpha',0.05,'MinorGridAlpha',0.05);
set(gca,'GridColor',[0.1 0.1 0.1],'MinorGridColor',[0.1 0.1 0.1]);
% grid off


