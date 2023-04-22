% example_06_04.m
% 例 6.4
% マス・ばね・ダンパ系の I-PD, PI-D 制御

close all

clear
format compact

disp(' ')
disp(' ***** 例 6.4 ********************')

a0 = 2;
a1 = 2;
b0 = 5;

s = tf('s');
sysP = b0/(s^2 + a1*s + a0)

t = 0:0.001:4;

kP = 4;
kI = 6;
kD = 1;

sysC1 = kP + kI/s + kD*s;
sysC2 = kP + kI/s;
sysC3 = kI/s;

t = 0:0.001:8;

% -------------------------------------
sysGyr_PI_D = minreal(sysP*sysC2/(1 + sysP*sysC1))
sysGyr_I_PD = minreal(sysP*sysC3/(1 + sysP*sysC1))

sysGyd      = minreal(sysP/(1 + sysP*sysC1))

% -------------------------------------
sim('sim_msd_pi_d_cont_R2018a')

figure(1)
plot(t,y,'LineWidth',1.5)
hold on

figure(2)
plot(t,u,'LineWidth',1.5)
hold on

% -------------------------------------
sim('sim_msd_i_pd_cont_R2018a')

figure(1)
plot(t,y,'LineWidth',1.5)
plot(t,ym,'--','LineWidth',1.5,'Color',[0.4660 0.6740 0.1880])
hold off

figure(2)
plot(t,u,'LineWidth',1.5)
hold off

% -------------------------------------
figure(1)
movegui('north')

set(gca,'FontSize',12,'FontName','Arial')

xlim([0 9])
ylim([0 1.5])

title('Fig. 6.12','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend('PI--D control','I--PD control','Filter output')
set(legend,'Interpreter','latex','FontSize',14)
set(legend,'Location','SouthEast')

grid on


% -------------------------------------
figure(2)
movegui('south')

set(gca,'FontSize',12,'FontName','Arial')

xlim([0 9])
ylim([-2.5 5])

title('Fig. 6.12','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$u(t)$','Interpreter','latex','FontSize',14)

legend('PI--D control','I--PD control')
set(legend,'Interpreter','latex','FontSize',14)
set(legend,'Location','SouthEast')

grid on
    
    
