% example_08_06.m
% 例 8.6
% 安定余裕

close all

clear
format compact

disp(' ')
disp(' ***** 例 8.6 ***************************')

s = tf('s');
sysP = 1/(s + 1)^3

disp(' ')
disp(' ---- Pm = 60 [deg] となる kP（解析解） ---- ')
th = 40*pi/180;
kP = (1 + (tan(th))^2)^(3/2)

wgc = sqrt(kP^(2/3) - 1) 

disp(' ---- Pm = 60 [deg] となる kP（数値解） ---- ')
opts = pidtuneOptions;
opts.PhaseMargin = 60;
[sysC info] = pidtune(sysP,'P',opts)


disp(' ')
disp(' ---- wgc = 1 [rad/s] となる kP（解析解） ---- ')
kP = 2*sqrt(2)

Pm = 180 - 3*atan(kP^(2/3) - 1)*180/pi

disp(' ')
disp(' ---- wgc = 1 [rad/s] となる kP（数値解） ---- ')
opts = pidtuneOptions;
opts.CrossoverFrequency = 1;
[sysC info] = pidtune(sysP,'P',opts)



% --------------------------------------------------
figure(1)
movegui('north');

% --------------------------------------------------
kP = 0:0.001:10;
Gm = - 20*log10(kP/8);

figure(1)
yyaxis left

plot(kP,Gm,'LineWidth',1.5)

xlim([0 10])
set(gca,'XTick',0:1:10)
ylim([-2.5 42.5]) 
set(gca,'YTick',0:10:40)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('${k}_{\rm P}$','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm m}$ [dB]','Interpreter','latex','FontSize',14)


% --------------------------------------------------
kP = 1:0.001:10;
wgc = sqrt(kP.^(2/3) - 1);
Pm = 180 - 3*atan(wgc)*180/pi;

figure(1)
yyaxis right

plot(kP,Pm,'LineWidth',1.5)

xlim([0 10])
set(gca,'XTick',0:1:10)
ylim([-11.25 180+11.25])
set(gca,'YTick',0:45:180)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('${k}_{\rm P}$','Interpreter','latex','FontSize',14)
ylabel('${P}_{\rm m}$ [deg]','Interpreter','latex','FontSize',14)

title('Fig. 8.12 (a)','Interpreter','latex','FontSize',14)
grid on

% --------------------------------------------------
t = 0:0.001:10;

num = 0;
for kP = 2:2:8
    num = num + 1;
    
    sysC = kP;
    sysL = sysP*sysC;
    
    sysGyr = minreal(sysL/(1 + sysL));
    
    y = step(sysGyr,t);
    
    figure(2)
    plot(t,y,'LineWidth',1.5)
    hold on
    
    txt(num) = {strcat('${k}_{\rm P} =',num2str(kP),'$')};
end

% --------------------------------------------------
figure(2)
movegui('south');
hold off

ylim([0 2])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 8.12 (b)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend(txt,'Location','NorthEast','NumColumns',2)
set(legend,'Interpreter','latex','FontSize',13)

grid on


