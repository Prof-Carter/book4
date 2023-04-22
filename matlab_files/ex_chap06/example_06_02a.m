% example_06_02.m
% 例 6.2
% マス・ばね・ダンパ系の P-D 制御（kD を変化）

close all

clear
format compact

disp(' ')
disp(' ***** 例 6.2 ********************')

a0 = 2;
a1 = 2;
b0 = 5;

s = tf('s');
sysP = b0/(s^2 + a1*s + a0)

t = 0:0.001:4;

kP = 4;
num = 0;
for kD = 0:0.5:1
    num = num + 1;
        
    fprintf('\n')
    fprintf('========================================\n')
    fprintf('kP = %d, kD = %2.1f のとき\n',kP,kD)
    fprintf('========================================\n')
    
    zeta = (b0*kD + a1)/(2*sqrt(a0 + b0*kP))
    wn   = sqrt(b0*kP + a0)

    sysC1 = kD*s + kP;
    sysC2 = kP;
          
    % -------------------------------------
    sysGyr = minreal(sysP*sysC2/(1 + sysP*sysC1))
    [numGyr denGyr] = tfdata(sysGyr,'v');
    yr_inf = numGyr(end)/denGyr(end)
    
    yr = step(sysGyr,t);
    
    figure(1)
    plot([0 t(end)],[yr_inf yr_inf],'k--')
    hold on
    h1(num) = plot(t,yr,'LineWidth',1.5);
    
    % -------------------------------------
    sysGyd = minreal(sysP/(1 + sysP*sysC1))
    [numGyd denGyd] = tfdata(sysGyd,'v');
    ys = numGyd(end)/denGyd(end)
    
    yd = step(sysGyd,t);
    
    figure(2)
    plot([0 t(end)],[ys ys],'k--')
    hold on
    h2(num) = plot(t,yd,'LineWidth',1.5);
    
    % -------------------------------------
    txt(num) = {strcat('${k}_{\rm P} = ',...
                       num2str(kP),...
                       '$, ${k}_{\rm D} = ',...
                       num2str(kD),...
                       '$')};
end

% -------------------------------------
figure(1)
hold off

movegui('north')

set(gca,'FontSize',12,'FontName','Arial')

ylim([0 1.5])

title('Fig. 6.6 (a)','Interpreter','latex','FontSize',14)
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

title('Fig. 6.6 (b)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${y}_{\rm d}(t)$','Interpreter','latex','FontSize',14)

legend(h2,txt)
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on


    
    
    
