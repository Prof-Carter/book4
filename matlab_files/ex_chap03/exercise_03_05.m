% exercise_03_05.m
% 問題 3.5
% 零点を持つシステムの過渡特性

close all

clear
format compact

disp(' ')
disp(' ***** 問題 3.5 ********************')

s = tf('s');
t = 0:0.001:5;

sysP = (6*s + 3)/((s + 1)*(s + 3));
y = step(sysP,t);

[numP denP] = tfdata(sysP,'v');
yinf = numP(end)/denP(end);

figure(1)
plot(t,y,'LineWidth',1.5)
hold on

[ymax i] = max(y);
Tp = t(i);
Amax = ymax - yinf;

fprintf('Tp   = %f\n',Tp)
fprintf('Amax = %f\n',Amax)

plot(Tp,ymax,'k.','MarkerSize',25)
hold off

ylim([0 1.5])
set(gca,'YTick',0:0.25:1.5)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

grid on


   