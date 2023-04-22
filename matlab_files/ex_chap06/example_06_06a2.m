% example_06_06a2.m
% 例 6.6
% マス・ばね・ダンパ系の PI-D 制御（目標値応答に注目した部分的モデルマッチング法）の
% 目標値応答と外乱応答
% （規範モデル：3 次のバターワース標準形）

close all

clear
format compact

disp(' ')
disp(' ***** 例 6.6（目標値応答に注目した PI-D 制御） ********************')

a0 = 2;
a1 = 2;
b0 = 5;

disp(' ')
disp(' ---- P(s) ---- ')
s = tf('s');
sysP = b0/(s^2 + a1*s + a0)

disp(' ')
disp(' ---- 1/P(s) = delta0 + delta1*s + delta2*s^2 ---- ')
delta0 = a0/b0
delta1 = a1/b0
delta2 =  1/b0

% --------------------
disp(' ')
disp(' ---- Gm3(s)：3 次のバターワース標準形 ---- ')
alpha1 = 2
alpha2 = 2
wm = 6

sysGm3 = wm^3/(s^3 + alpha2*wm*s^2 + alpha1*wm^2*s + wm^3)

gamma_m1 = alpha1/wm;
gamma_m2 = alpha2/wm^2;
gamma_m3 = 1/wm^3;

% --------------------
disp(' ')
disp(' ---- PID パラメータ ---- ')
kI =  delta0/gamma_m1
kP = (delta2*gamma_m1 - delta0*gamma_m3)/(gamma_m1*gamma_m2)
kD = (delta2*gamma_m1^2 - delta1*gamma_m1*gamma_m2 ...
                        + delta0*(gamma_m2^2 - gamma_m1*gamma_m3))/(gamma_m1*gamma_m2)

sysC1 = kP + kI/s + kD*s;
sysC2 = kP + kI/s;

% --------------------
t = 0:0.001:4;

% --------------------
disp(' ')
disp(' ---- Gyr(s) ---- ')
sysGyr = minreal(sysP*sysC2/(1 + sysP*sysC1))
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

title('Fig. 6.21 (a)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${y}_{\rm r}(t)$','Interpreter','latex','FontSize',14)

legend('PI--D control','${G}_{\rm m3}(s)$')
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

ylim([-0.2 0.4])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 6.21 (b)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${y}_{\rm d}(t)$','Interpreter','latex','FontSize',14)

legend('PI--D control')
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on








