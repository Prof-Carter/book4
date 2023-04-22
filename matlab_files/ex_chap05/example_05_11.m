% example_05_11.m
% 例 5.11
% 外乱応答と定常値（C(s) に積分器を含む場合）

close all

clear
format compact

disp(' ')
disp(' ***** 例 5.11 ********************')

s = tf('s');
sysP = 5/(s^2 + 2*s + 2);

t = 0:0.001:8;

kP = 1;
num = 0;
for kI = 0:0.5:1
    num = num + 1;
    
    sysC = (kP*s + kI)/s;
    sysL = minreal(sysP*sysC);
    
    fprintf('==============================\n')
    fprintf('kP = %2.1f, ',kP)
    fprintf('kI = %2.1f\n',kI)
    fprintf('==============================\n')
    
    % -------------------------------------
    sysGyd = minreal(sysP/(1 + sysL))
    [numGyd denGyd] = tfdata(sysGyd,'v');
    ys = numGyd(end)/denGyd(end)
    
    y = step(sysGyd,t);
    figure(1)
    plot([0 t(end)],[ys ys],'k--')
    hold on
    h(num) = plot(t,y,'LineWidth',1.5);

    % -------------------------------------
    txt(num) = {strcat('${k}_{\rm P} = ',num2str(kP),'$',', ${k}_{\rm I} = ',num2str(kI),'$')};
end

% -------------------------------------
figure(1)
hold off

set(gca,'FontSize',12,'FontName','Arial')
legend(h,txt)
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

ylim([-0.5 1])

title('Fig. 5.14','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${y}_{\rm d}(t)$','Interpreter','latex','FontSize',14)

grid on

