% example_05_07.m
% 例 5.7
% フィードバック制御系の内部安定性の判別と目標値応答，外乱応答の描画

close all

clear
format compact

disp(' ')
disp(' ***** 例 5.7 ********************')

s = tf('s');
sysP = 5/(s^2 + 2*s + 2);

t = 0:0.001:8;

kP = 0.5;
for kI = [0.25 0.5 1 2]
    sysC = (kP*s + kI)/s;

    fprintf('\n')
    fprintf('++++++++++++++++++++++++++++++++++++++++++\n')
    fprintf('kP = %2.1f, kI = %3.2f\n',kP,kI)
    fprintf('++++++++++++++++++++++++++++++++++++++++++\n')
    
    sysGyr = minreal(sysP*sysC/(1 + sysP*sysC))    
    sysGyd = minreal(     sysP/(1 + sysP*sysC))    
    p = pole(sysGyr)

    if real(p) < 0
        disp('===> 内部安定である')
    else
        disp('===> 内部安定ではない')
    end
    
    yr = step(sysGyr,t);
    yd = step(sysGyd,t);
    
    figure(1)
    plot(t,yr,'LineWidth',1.5)
    hold on
    
    figure(2)
    plot(t,yd,'LineWidth',1.5)
    hold on
end

% -------------------------------------------
figure(1)
hold off

ylim([0 2])
set(gca,'YTick',0:0.5:2)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 5.9 (a) (${k}_{\rm P} = 0.5$, $r(t) = 1$, $d(t) = 0$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend('${k}_{\rm I} = 0.25$', ...
       '${k}_{\rm I} = 0.5$', ...
       '${k}_{\rm I} = 1$', ...
       '${k}_{\rm I} = 2$')
set(legend,'Location','SouthEast','NumColumns',2)
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('north')

% -------------------------------------------
figure(2)
hold off

ylim([-1.5 1.5])
set(gca,'YTick',-1.5:0.75:1.5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 5.9 (b) (${k}_{\rm P} = 0.5$, $r(t) = 0$, $d(t) = 1$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend('${k}_{\rm I} = 0.25$', ...
       '${k}_{\rm I} = 0.5$', ...
       '${k}_{\rm I} = 1$', ...
       '${k}_{\rm I} = 2$')
set(legend,'Location','SouthEast','NumColumns',2)
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('south')


