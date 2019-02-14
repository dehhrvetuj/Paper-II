%
clc
clear all
close all

cdata1 = importdata('./CINLET/data-0-20s.txt');
cdata2 = importdata('./CINLET/data-20-33s.txt');
cdata3 = importdata('./CINLET/data-33-500s.log');

tdata1 = importdata('./TINLET/data-0-19s.log');
tdata2 = importdata('./TINLET/data-19-25s.log');
tdata3 = importdata('./TINLET/post-door-25-350s.log');

pdata1 = importdata('./POUTLET/data-0-16s.log');
pdata2 = importdata('./POUTLET/data-16-25s.log');

cpdata = importdata('./CINLETPOUTLET/data.log');

tpdata = importdata('./TINLETPOUTLET2/data.log');


c_t1 = cdata1(:,2);
c_t2 = cdata2(:,2);
c_t3 = cdata3(:,2);
c_t = [c_t1; c_t2; c_t3] - 4;
t_t = [tdata1(:,2); tdata2(:,2); tdata3(:,2)];
p_t = [pdata1(:,2); pdata2(:,2)];
cp_t = cpdata(:,2);
tp_t = tpdata(:,2);

c_c1 = cdata1(:,13);
c_c2 = cdata2(:,21);
c_c3 = cdata3(:,12);
c_c = [c_c1; c_c2; c_c3];
t_c = [tdata1(:,12); tdata2(:,12); tdata3(:,12)];
p_c = [pdata1(:,12); pdata2(:,12)];
cp_c = cpdata(:,12);
tp_c = tpdata(:,12);

figure
hold on
plot(t_t,t_c,'r')
plot(p_t,p_c,'r:')
plot(c_t,c_c,'k')
plot(cp_t,cp_c,'k-')
plot(tp_t,tp_c,'r--')

axis([0 25 0 2.5e-5]);
grid on
box on
