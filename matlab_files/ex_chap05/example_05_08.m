% example_05_08.m
% 例 5.8
% 目標値応答と定常位置偏差（L(s) に積分器を含まない場合）

close all

clear
format compact

disp(' ')
disp(' ***** 例 5.8 ********************')

s = tf('s');
sysP = 5/(s^2 + 2*s + 2);

t = 0:0.001:8;

num = 0;
for kP = [1 2 4]
    num = num + 1;
    
    sysC = kP;
    sysL = minreal(sysP*sysC);
    
    fprintf('==============================\n')
    fprintf('kP = %2.1f\n',kP)
    fprintf('==============================\n')
    
    % -------------------------------------
    sysGyr = minreal(sysL/(1 + sysL))
    [numGyr denGyr] = tfdata(sysGyr,'v');
    yr_inf = numGyr(end)/denGyr(end)
    
    y = step(sysGyr,t);
    figure(1)
    plot([0 t(end)],[yr_inf yr_inf],'k--')
    hold on
    h1(num) = plot(t,y,'LineWidth',1.5);
    
    % -------------------------------------
    sysGer = minreal(1/(1 + sysL))
    [numGer denGer] = tfdata(sysGer,'v');
    ep = numGer(end)/denGer(end)
    
    e = step(sysGer,t);
    figure(2)
    plot([0 t(end)],[ep ep],'k--')
    hold on
    h2(num) = plot(t,e,'LineWidth',1.5);

    % -------------------------------------
    txt(num) = {strcat('${k}_{\rm P} = ',num2str(kP),'$')};
end

% -------------------------------------
figure(1)
hold off

movegui('north')

set(gca,'FontSize',12,'FontName','Arial')
legend(h1,txt)
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

ylim([0 1.5])

title('Fig. 5.11','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${y}_{\rm r}(t)$','Interpreter','latex','FontSize',14)

grid on

% -------------------------------------
figure(2)
hold off

movegui('south')

set(gca,'FontSize',12,'FontName','Arial')
legend(h2,txt)
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

ylim([-0.5 1])

title('Fig. 5.11','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${e}_{\rm r}(t)$','Interpreter','latex','FontSize',14)

grid on



