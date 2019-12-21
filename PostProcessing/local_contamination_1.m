%% PLOT OVERALL OR CONTAMINATION 0-5 MIN FOR CASE A5 (SUMMER AND WINTER)
%%

clc
clear all
close all


% ------ SUMMER ------------ %
data = importdata('./summer/case5-1/postdpmdata.dat');
data = [zeros(125,1); data];
data = data(1:1500);

% median filter
data = medfilt1(data,10);

% moving average
N = 50; b = (1/N)*ones(1,N); a = 1;
data = filter(b,a,data);

% Gaussian filter
sigma = 5; sz = 20;    % length of gaussFilter vector
x = linspace(-sz / 2, sz / 2, sz);
gaussFilter = exp(-x .^ 2 / (2 * sigma ^ 2));
gaussFilter = gaussFilter / sum (gaussFilter); % normalize

% data = filter(gaussFilter,a, data);
data = conv(data,gaussFilter,'same');

data1 = data;



% ------ SUMMER ------------ %
data = importdata('./winter/case5-1/postdpmdata.dat');
data_ = filter(ones(20,1)/20,1,data(1:2600));
data = [data_(1:20:2600); data(2601:end)];
data = data(1:1500);

% median filter
data = medfilt1(data,10);

% moving average
N = 50; b = (1/N)*ones(1,N); a = 1;
data = filter(b,a,data);

% Gaussian filter
sigma = 5; sz = 20;    % length of gaussFilter vector
x = linspace(-sz / 2, sz / 2, sz);
gaussFilter = exp(-x .^ 2 / (2 * sigma ^ 2));
gaussFilter = gaussFilter / sum (gaussFilter); % normalize

% data = filter(gaussFilter,a, data);
data = conv(data,gaussFilter,'same');

data2 = data;

% construct time
t = (1:1500)*0.2;

% SCALE DPM CONCENTRATION
scale1 = 180/8.3e-11;       % 180 CFU/m^3 / 8.3e-11 kg/m^3
scale2 = 180/8.2e-11;
dpm1 = data1*scale1;
dpm2 = data2*scale2;


% DEFINE PLOT PROPERTIES 
linewidth = 2.5;
fontsize = 16;
markersize = 120;


figure(1)
hold on
box on


plot(t,dpm1,'LineStyle','-','LineWidth',linewidth-1,'Color','r');
plot(t,dpm2,'LineStyle','--','LineWidth',linewidth-1,'Color','b');


% SET PLOT LINE WIDTH AND FONT SIZE
set(gca,'LineWidth',linewidth/2,'FontSize',fontsize);

% SET X AND Y LABELS
xlabel('Time [min]','FontSize',fontsize-1,'FontWeight','bold','Color','k');
ylabel('CFU/m^3','FontSize',fontsize-1,'FontWeight','bold','Color','k');

% SET X AND Y AXIS LIMITS AND MAJOR TICKS
% axis([-1 21 -0.2 5.2])
set(gca,'XLim',[0 300],'XTick',0:60:300);
set(gca,'YLim',[0 15.001],'YTick',0:5:15);
set(gca,'XTickLabel', {'0','1','2','3','4','5'});
set(gca,'YTickLabel', {'0','5','10','15'});

% SET X AND Y MINOR TICKS
set(gca,'XMinorTick','on','YMinorTick','on');
axs = gca;
axs.XRuler.MinorTick = 0:10:300; 
axs.YRuler.MinorTick = 0:1:15; 

% SET LEGEND
[leg,objects] = legend({' summer', ' winter'},'Location','best','FontSize',fontsize-4);
set(leg,'LineWidth',(linewidth/2-0.1));
% objects(1).Position(1) = 0.36;
% objects(2).Position(1) = 0.36;
% objects(3).XData(2) = 0.33;
% objects(5).XData(2) = 0.33;
leg.Position(3) = 0.23;


% SET GRID LINE PROPERTIES
grid on
grid minor
set(gca,'GridLineStyle',':','MinorGridLineStyle',':','GridAlpha',0.05,'MinorGridAlpha',0.05);
set(gca,'GridColor',[0.1 0.1 0.1],'MinorGridColor',[0.1 0.1 0.1]);
% grid off


