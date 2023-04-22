% exercise_06_04b.m
% 問題 6.4
% kI を変化させたときの PI 制御の目標値応答の描画（図 4.9）

close all

clear
format compact

s = tf('s');
sysP = 1/(s - 1)

t = 0:0.001:5;

kP = 4;
num = 0;
for kI = [2 8]
    num = num + 1;

    disp(' ')
    disp('**************************************')
    
    kP
    kI
    
    sysC = kP + kI/s;
    sysGyr = minreal(sysP*sysC/(1 + sysP*sysC))
    
    disp(' ')
    disp(' ---- Gyr(s) の極 ---- ')
    pole(sysGyr)

    disp(' ')
    disp(' ---- Gyr(s) の零点 ---- ')
    zero(sysGyr)
    
    y = step(sysGyr,t);
    figure(1)
    
    h(num) = plot(t,y,'LineWidth',1.5);
    hold on  
    
    % -------------------------------------
    txt(num) = {strcat('${k}_{\rm P} = ',...
                       num2str(kP),...
                       '$, ${k}_{\rm I} = ',...
                       num2str(kI),...
                       '$')};
end

% -------------------------------------
figure(1)
hold off

set(gca,'FontSize',12,'FontName','Arial')

ylim([0 1.5])

title('Fig. 6.9 ($r(t) = 1$, $d(t) = 0$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend(h,txt)
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on



