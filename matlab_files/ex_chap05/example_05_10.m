% example_05_10.m
% 例 5.10
% 外乱応答と定常値（C(s) に積分器を含まない場合）

close all

clear
format compact

disp(' ')
disp(' ***** 例 5.10 ********************')

s = tf('s');
sysP = 5/(s^2 + 2*s + 2);

t = 0:0.001:8;

num = 0;
for kP = [1 2 4]
    num = num + 1;
    
    sysC = kP;
    sysL = minreal(sysP*sysC);
    
    fprintf('==============================\n')
    fprintf('kP = %d\n',kP)
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
    txt(num) = {strcat('${k}_{\rm P} = ',num2str(kP),'$')};
end

% -------------------------------------
figure(1)
hold off

set(gca,'FontSize',12,'FontName','Arial')
legend(h,txt)
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

ylim([-0.5 1])

title('Fig. 5.13','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${y}_{\rm d}(t)$','Interpreter','latex','FontSize',14)

grid on


