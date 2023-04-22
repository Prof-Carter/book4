% exercise_04_02.m
% –â‘è 4.2
% RL ‰ñ˜H‚Ìƒpƒ‰ƒ[ƒ^“¯’è

disp(' ')
disp(' ***** –â‘è 4.2 ********************')

close all

clear
format compact

K = 0.02;
T = 0.004;

% -------------------------------------------------------
% K = 1/R,  T = L/R
R = 1/K
L = T*R

% -------------------------------------------------------
t = linspace(0,0.02,1000);

sysP = tf([K],[T 1])
y = step(sysP,t);

figure(1)
plot(t,y,'LineWidth',1.5)
hold on

plot([T T],[0 0.632*K],'k')
plot([0 t(end)],[0.632*K 0.632*K],'k')
plot(T,0.632*K,'k.','MarkerSize',25)
hold off

ylim([0 0.03])
set(gca,'XTick',0:0.004:0.02)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$i(t)$ [A]','Interpreter','latex','FontSize',14)

grid on
