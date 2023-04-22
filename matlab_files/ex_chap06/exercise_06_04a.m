% exercise_06_04a.m
% 問題 6.4
% PI 制御

close all

clear
format compact

% -----------------------------------------------
disp(' ')
disp(' ***** 問題 6.4 (2) ********************')

kP = 4
kI = 2

s = tf('s');
sysP = 1/(s - 1)
sysC = kP + kI/s

sysGyr = minreal(sysP*sysC/(1 + sysP*sysC))

disp(' ')
disp(' ---- Gyr(s) の極 ---- ')
pole(sysGyr)

disp(' ')
disp(' ---- Gyr(s) の零点 ---- ')
zero(sysGyr)

% -----------------------------------------------
disp(' ')
disp(' ***** 問題 6.4 (3) ********************')

t = 0:0.001:5;
y = step(sysGyr,t);

disp(' ')
disp(' ---- 定常値 yinf ---- ')

[numGyr denGyr] = tfdata(sysGyr,'v');
yinf = numGyr(end)/denGyr(end)

disp(' ')
disp(' ---- 行き過ぎ時間 Tp，オーバーシュート Amax ---- ')

S = stepinfo(y,t,yinf);

Tp = S.PeakTime
Amax = S.Overshoot/100

ymax = yinf + Amax;

% ------------
figure(1)
plot([Tp Tp],[0 ymax],'k')
hold on
plot([0 Tp],[ymax ymax],'k')

plot(t,y,'LineWidth',1.5,'Color',[0 0.4470 0.7410])

plot(Tp,ymax,'.','MarkerSize',30,'Color',[0.8500 0.3250 0.0980])
hold off

set(gca,'FontSize',12,'FontName','Arial')

ylim([0 1.5])

title('${k}_{\rm P} = 4$, ${k}_{\rm I} = 2$ ($r(t) = 1$, $d(t) = 0$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

grid on



