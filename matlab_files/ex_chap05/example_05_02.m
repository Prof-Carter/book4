% example_05_02.m
% �� 5.2
% �t�B�[�h�t�H���[�h����

close all

clear
format compact

% ----------------------
T = 2;
K = 1;

sysP = tf(K,[T 1])
% ----------------------
T_d = 3;
K_d = 0.75;

sysP_d = tf(K_d,[T_d 1])
% ----------------------
Tm = 1

sysC = tf([T 1],K*[Tm 1])
% ----------------------
sysGyr = sysP*sysC;
sysGyd = sysP;
sysGyr = minreal(sysGyr)
sysGyd = minreal(sysGyd)

sysGyr_d = sysP_d*sysC;
sysGyd_d = sysP_d;
sysGyr_d = minreal(sysGyr_d)
sysGyd_d = minreal(sysGyd_d)

t = 0:0.01:20;
% ----------------------
y    = step(sysGyr,t);
ydis = step(sysGyd,t);

k = 1;
for i = 1:length(y)
    if t(i) >= 10
        yd(i) = ydis(k) ;
        k = k + 1;
    else
        yd(i) = 0;
    end
end
yd = yd';

figure(1)
plot(t,y,t,y+yd,'LineWidth',1.5)
ylim([0 2])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 5.7 (a)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend({'�p�����[�^�ϓ��Ȃ��C�O���Ȃ�','�p�����[�^�ϓ��Ȃ��C�O������'})
set(legend,'Location','NorthWest')
set(legend,'FontSize',12,'FontName','MS UI Gothic')

grid on

movegui('north')

% ----------------------
y   = step(sysGyr,t);
y_d = step(sysGyr_d,t);

ym  = step(1,[1 1],t);

figure(2)
plot(t,y,t,y_d,'LineWidth',1.5)
ylim([0 2])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 5.7 (b)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend({'�p�����[�^�ϓ��Ȃ��C�O���Ȃ�','�p�����[�^�ϓ�����C�O���Ȃ�'})
set(legend,'Location','NorthWest')
set(legend,'FontSize',12,'FontName','MS UI Gothic')

grid on

movegui('south')


