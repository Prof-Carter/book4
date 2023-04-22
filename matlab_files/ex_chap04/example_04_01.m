% example_04_01.m
% 例 4.1
% RC 回路の単位ステップ応答と過渡特性

close all

clear
format compact

disp(' ')
disp(' ***** 例 4.1 ********************')

t = linspace(0,4e-3,1000);

% -------------------------------------------------------
disp(' ')
disp(' ---- R = 1 [kΩ], C = 0.47 [μF] ---- ')

R1 = 1e3;
C1 = 0.47e-6;
T1 = R1*C1;
K  = 1;

fprintf('\n')
fprintf('R = %3.2e [Ω]\n',R1)
fprintf('C = %3.2e [F]\n',C1)
fprintf('T = RC = %3.2e\n',T1)

sysP1 = tf([K],[T1 1])
y1 = step(sysP1,t);

% -------------------------------------------------------
disp(' ')
disp(' ---- R = 2 [kΩ], C = 0.47 [μF] ---- ')

R2 = 2e3;
C2 = 0.47e-6;
T2 = R2*C2;
K  = 1;

fprintf('\n')
fprintf('R = %3.2e [Ω]\n',R2)
fprintf('C = %3.2e [F]\n',C2)
fprintf('T = RC = %3.2e\n',T2)

sysP2 = tf([K],[T2 1])
y2 = step(sysP2,t);

figure(1)
plot(t,y1,t,y2,'LineWidth',1.5)
hold on

plot([T1 T1],[0 0.632*K],'k')
plot([T2 T2],[0 0.632*K],'k')
plot([0 t(end)],[0.632*K 0.632*K],'k')
plot(T1,0.632*K,'k.','MarkerSize',25)
plot(T2,0.632*K,'k.','MarkerSize',25)
hold off

ylim([0 1.25])
set(gca,'YTick',0:0.25:1.25)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend('$R = 1$ [k$\Omega$], $C = 0.47$ [$\mu$F]', '$R = 2$ [k$\Omega$], $C = 0.47$ [$\mu$F]')
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

