% example_09_08b_R2018a.m
% 例 9.8
% 鉛直面を回転するアーム系の状態フィードバック制御
% ：最適レギュレータ（関数 lqr）と Simulink によるシミュレーション

close all

clear
format compact

disp(' ')
disp(' ***** 例 9.8 ********************')
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
q2 = 0.001;    
for q1 = [5 20 80]
    disp(' ')
    disp(' ---- 重み Q, R と設計された状態フィードバックゲイン K ---- ')

    Q = diag([q1 q2])
    R = 1
    K = - lqr(A,B,Q,R)

    sim('sim_arm_sfbk_R2018a')

    figure(1)
    plot(t,x1,'LineWidth',1.5)
    hold on

    figure(2)
    plot(t,x2,'LineWidth',1.5)
    hold on
    
    figure(3)
    plot(t,u,'LineWidth',1.5)
    hold on
end

% --------------------------------------------------
figure(1)
hold off

ylim([-0.5 1.5])
set(gca,'YTick',-0.5:0.5:1.5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 9.8 ($Q = {\rm diag}\{{q}_{1},\,0.001\}$, $R = 1$, $x(0) = [\begin{array}{cc} 1 & 0 \end{array}]^{\top}$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{1}(t)$ [rad]','Interpreter','latex','FontSize',14)

legend('${q}_{1} = 5$','${q}_{1} = 20$','${q}_{1} = 80$')
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('northwest')

% --------------------------------------------------
figure(2)
hold off

ylim([-5 2.5])
set(gca,'YTick',-5:2.5:2.5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 9.8 ($Q = {\rm diag}\{{q}_{1},\,0.001\}$, $R = 1$, $x(0) = [\begin{array}{cc} 1 & 0 \end{array}]^{\top}$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{2}(t)$ [rad/s]','Interpreter','latex','FontSize',14)

legend('${q}_{1} = 5$','${q}_{1} = 20$','${q}_{1} = 80$')
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('southwest')

% --------------------------------------------------
figure(3)
hold off

ylim([-10 5])
set(gca,'YTick',-10:5:5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 9.8 ($Q = {\rm diag}\{{q}_{1},\,0.001\}$, $R = 1$, $x(0) = [\begin{array}{cc} 1 & 0 \end{array}]^{\top}$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$u(t)$ [N$\cdot$m]','Interpreter','latex','FontSize',14)

legend('${q}_{1} = 5$','${q}_{1} = 20$','${q}_{1} = 80$')
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('north')


