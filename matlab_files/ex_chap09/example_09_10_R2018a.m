% example_09_10_R2018a.m
% 例 9.10
% 鉛直面を回転するアーム系の目標値追従制御
% ：最適レギュレータ（関数 lqr）と Simulink によるシミュレーション

close all

clear
format compact

disp(' ')
disp(' ***** 例 9.10 ********************')
% --------------------------------------------------
t = 0:0.0001:1;
   
% --------------------------------------------------
arm_para

a0 = M*g*l/J;
a1 = c/J;
b0 = 1/J;

disp(' ')
disp(' ---- A, B, C 行列 ---- ')
A = [ 0    1
     -a0  -a1 ]
B = [ 0
      b0 ]
C = [ 1  0 ];
n = length(A);

% --------------------------------------------------
q2 = 0.001;    
for q1 = [5 20 80]
    disp(' ')
    disp(' ---- 重み Q, R と設計された状態フィードバックゲイン K とフィードフォワードゲイン H ---- ')

    Q = diag([q1 q2])
    R = 1
    K = - lqr(A,B,Q,R)
    
    M0 = [ A  B
           C  0 ];
    H = [ -K  1 ]*inv(M0)*[ zeros(n,1)
                            1 ]
                        
    sim('sim_arm_sfbk_tracking_R2018a')
    
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


ylim([0 1.5])
set(gca,'YTick',0:0.5:1.5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 9.11 ($Q = {\rm diag}\{{q}_{1},\,0.001\}$, $R = 1$, $x(0) = 0$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{1}(t)$ [rad]','Interpreter','latex','FontSize',14)

legend('${q}_{1} = 5$','${q}_{1} = 20$','${q}_{1} = 80$')
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('northwest')

% --------------------------------------------------
figure(2)
hold off

ylim([-2.5 7.5])
set(gca,'YTick',-2.5:2.5:7.5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 9.11 ($Q = {\rm diag}\{{q}_{1},\,0.001\}$, $R = 1$, $x(0) = 0$)','Interpreter','latex','FontSize',14)
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

ylim([-5 10])
set(gca,'YTick',-5:5:10)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 9.11 ($Q = {\rm diag}\{{q}_{1},\,0.001\}$, $R = 1$, $x(0) = 0$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$u(t)$ [N$\cdot$m]','Interpreter','latex','FontSize',14)

legend('${q}_{1} = 5$','${q}_{1} = 20$','${q}_{1} = 80$')
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('north')


