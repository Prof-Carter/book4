% example_09_07b.m
% 例 9.7
% 鉛直面を回転するアーム系の状態フィードバック制御
% ：極配置（関数 acker）と Simulink によるシミュレーション

clear
format compact

disp(' ')
disp(' ***** 例 9.7 ********************')
% --------------------------------------------------
x0 = [ 1
       0 ];
   
% --------------------------------------------------
arm_para

a0 = M*g*l/J;
a1 = c/J;
b0 = 1/J;

disp(' ')
disp(' ---- A, B 行列 ---- ')
A = [ 0    1
     -a0  -a1 ]
B = [ 0
      b0 ]
n = length(A);

% --------------------------------------------------
disp(' ')
disp(' ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ')
disp(' ---- 指定する極 p と設計された状態フィードバックゲイン K ---- ')
p = [ -5+10j
      -5-10j ]
K = - acker(A,B,p)

sim('sim_arm_sfbk_R2015a')

figure(1)
plot(t,x1,'LineWidth',1.5)
hold on

figure(2)
plot(t,x2,'LineWidth',1.5)
hold on

disp(' ')
disp(' ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ')
disp(' ---- 指定する極 p と設計された状態フィードバックゲイン K ---- ')
p = [ -10+10j
      -10-10j ]
K = - acker(A,B,p)

sim('sim_arm_sfbk_R2015a')

figure(1)
plot(t,x1,'LineWidth',1.5)
hold on

figure(2)
plot(t,x2,'LineWidth',1.5)
hold on


disp(' ')
disp(' ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ')
disp(' ---- 指定する極 p と設計された状態フィードバックゲイン K ---- ')
p = [ -5+20j
      -5-20j ]
K = - acker(A,B,p)

sim('sim_arm_sfbk_R2015a')

figure(1)
plot(t,x1,'LineWidth',1.5)
hold off

figure(2)
plot(t,x2,'LineWidth',1.5)
hold off

% --------------------------------------------------
figure(1)

ylim([-0.5 1.5])
set(gca,'YTick',-0.5:0.5:1.5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 9.7 ($x(0) = [\begin{array}{cc} 1 & 0 \end{array}]^{\top}$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{1}(t)$ [rad]','Interpreter','latex','FontSize',14)

legend('$- 5 \pm 10j$','$- 10 \pm 10j$','$- 5 \pm 20j$')
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('north')

% --------------------------------------------------
figure(2)

ylim([-20 10])
set(gca,'YTick',-20:10:10)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 9.7 ($x(0) = [\begin{array}{cc} 1 & 0 \end{array}]^{\top}$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{2}(t)$ [rad/s]','Interpreter','latex','FontSize',14)

legend('$- 5 \pm 10j$','$- 10 \pm 10j$','$- 5 \pm 20j$')
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('south')


