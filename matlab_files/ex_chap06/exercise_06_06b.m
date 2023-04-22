% exercise_06_06b.m
% ��� 6.6
% I-PD ����i�ڕW�l�����ɒ��ڂ��������I���f���}�b�`���O�@�j�̖ڕW�l�����ƊO������

close all

clear
format compact

disp(' ')
disp(' ***** ��� 6.6�i�ڕW�l�����ɒ��ڂ��� I-PD ����j ********************')

disp(' ')
disp(' ---- P(s) ---- ')
s = tf('s');
sysP = (s + 1)/(s^2 - s + 1)

disp(' ')
disp(' ---- 1/P(s) = delta0 + delta1*s + delta2*s^2 ---- ')
delta0 =  1
delta1 = -2
delta2 =  3

% --------------------
disp(' ')
disp(' ---- Gm3(s)�F3 ���� 2 ���W���W���` ---- ')
alpha1 = 2
alpha2 = 2
wm = 2

sysGm3 = wm^3/(s^3 + alpha2*wm*s^2 + alpha1*wm^2*s + wm^3)

gamma_m1 = alpha1/wm;
gamma_m2 = alpha2/wm^2;
gamma_m3 = 1/wm^3;
         
% --------------------
disp(' ')
disp(' ---- PID �p�����[�^ ---- ')
kI =          delta2/gamma_m3
kP = delta2*gamma_m1/gamma_m3 - delta0
kD = delta2*gamma_m2/gamma_m3 - delta1

sysC1 = kP + kI/s + kD*s;
sysC3 = kI/s;

% --------------------
t = 0:0.001:12;

% --------------------
disp(' ')
disp(' ---- Gyr(s) ---- ')
sysGyr = minreal(sysP*sysC3/(1 + sysP*sysC1))
yr = step(sysGyr,t);

ym = step(sysGm3,t);

figure(1)
movegui('north')

plot(t,yr,'LineWidth',1.5)
hold on
plot(t,ym,'--','LineWidth',1.5)
hold off

ylim([0 1.5])

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${y}_{\rm r}(t)$','Interpreter','latex','FontSize',14)

legend('I--PD control','${G}_{\rm m3}(s)$')
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

% --------------------
disp(' ')
disp(' ---- Gyd(s) ---- ')
sysGyd = minreal(      sysP/(1 + sysP*sysC1))

yd = step(sysGyd,t);

figure(2)
movegui('south')

plot(t,yd,'LineWidth',1.5)

ylim([-0.1 0.2])

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${y}_{\rm d}(t)$','Interpreter','latex','FontSize',14)

legend('I--PD control')
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on








