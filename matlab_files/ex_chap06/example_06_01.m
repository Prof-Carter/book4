% example_06_01.m
% 例 6.1
% マス・ばね・ダンパ系の P 制御（wm を変化させたときの目標値応答と外乱応答の描画）

close all

clear
format compact

disp(' ')
disp(' ***** 例 6.1 ********************')

a0 = 2;
a1 = 2;
b0 = 5;

s = tf('s');
sysP = b0/(s^2 + a1*s + a0)

t = 0:0.001:4;

num = 0;
for wm = [4 6]
    num = num + 1;
        
    fprintf('\n')
    fprintf('========================================\n')
    fprintf('wm = %d のとき\n',wm)
    fprintf('========================================\n')
    
    kP = (wm^2 - a0)/b0
    sysC = kP;
    
    zeta = a1/(2*sqrt(a0 + b0*kP))
        
    % -------------------------------------
    sysGyr = minreal(sysP*sysC/(1 + sysP*sysC))
    [numGyr denGyr] = tfdata(sysGyr,'v');
    yr_inf = numGyr(end)/denGyr(end)
    
    yr = step(sysGyr,t);
    
    figure(1)
    plot([0 t(end)],[yr_inf yr_inf],'k--')
    hold on
    h1(num) = plot(t,yr,'LineWidth',1.5);
    
    % -------------------------------------
    sysGyd = minreal(sysP/(1 + sysP*sysC))
    [numGyd denGyd] = tfdata(sysGyd,'v');
    ys = numGyd(end)/denGyd(end)
    
    yd = step(sysGyd,t);
    
    figure(2)
    plot([0 t(end)],[ys ys],'k--')
    hold on
    h2(num) = plot(t,yd,'LineWidth',1.5);
    
    % -------------------------------------
    txt(num) = {strcat('${\omega}_{\rm m} = ',num2str(wm),'$',' (${k}_{\rm P} = ',num2str(kP),'$)')};
end

% -------------------------------------
figure(1)
hold off

movegui('north')

set(gca,'FontSize',12,'FontName','Arial')

ylim([0 1.5])

title('Fig. 6.5 (a)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${y}_{\rm r}(t)$','Interpreter','latex','FontSize',14)

legend(h1,txt)
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

% -------------------------------------
figure(2)
hold off

movegui('south')

set(gca,'FontSize',12,'FontName','Arial')

ylim([0 0.6])

title('Fig. 6.5 (b)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${y}_{\rm d}(t)$','Interpreter','latex','FontSize',14)

legend(h2,txt)
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on


    
    
    
