% example_03_03.m
% 例 3.3
% 2 次遅れ系の単位ステップ応答の過渡特性

close all

clear
format compact

disp(' ')
disp(' ***** 例 3.3 ********************')

t = linspace(0,5*pi/3,100000);

s = tf('s');
sysP = 10/(s^2 + 2*s + 10)

disp(' ')
disp(' ---- P(s) の極 ----')
pole(sysP)
disp(' ')

y = step(sysP,t);
% ------------------------------------------------------------
[numP denP] = tfdata(sysP,'v');

yinf = numP(end)/denP(end)

S = stepinfo(y,t,yinf)

% ------------------------------------------------------------
figure(1)
plot(t,y,'LineWidth',1.5)
hold on

y1 = 1 + exp(-t);
y2 = 1 - exp(-t);
plot(t,y1,t,y2,'LineWidth',1.5)
hold off

xlim([0 5*pi/3])
ylim([0 2])

set(gca,'XTick',0:pi/3:5*pi/3)
set(gca,'XTickLabel',{'0','\pi/3','2\pi/3','\pi','4\pi/3','5\pi/3'})

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 3.3','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend('$y(t)$','$\overline{y}(t)$','$\underline{y}(t)$')
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on


