% example_09_12_R2018a.m
% 例 9.12
% 鉛直面を回転するアーム系の積分型サーボ制御
% ：最適レギュレータ（関数 lqr）と Simulink によるシミュレーション

close all

clear
format compact

disp(' ')
disp(' ***** 例 9.12 ********************')
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

Ae = [ A  zeros(n,1)
      -C  0          ];
Be = [ B
       0 ];

% --------------------------------------------------
q1 = 1e-3;
q2 = 1e-3;    
for q3 = [5e3 5e4]
    disp(' ')
    disp(' ---- 重み Q, R と設計された状態フィードバックゲイン Ke ---- ')

    Q = diag([q1 q2 q3])
    R = 1
    Ke = - lqr(Ae,Be,Q,R)
    
    K = Ke(1:n)
    G = Ke(n+1)
                        
    sim('sim_arm_sfbk_servo_R2018a')
    
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

title('Fig. 9.13 ($Q = {\rm diag}\{10^{-3},\,10^{-3},\,{q}_{3}\}$, $R = 1$, $x(0) = 0$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{1}(t)$ [rad]','Interpreter','latex','FontSize',14)

legend('${q}_{3} = 5 \times 10^3$','${q}_{3} = 5 \times 10^4$')
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

title('Fig. 9.13 ($Q = {\rm diag}\{10^{-3},\,10^{-3},\,{q}_{3}\}$, $R = 1$, $x(0) = 0$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{2}(t)$ [rad/s]','Interpreter','latex','FontSize',14)

legend('${q}_{3} = 5 \times 10^3$','${q}_{3} = 5 \times 10^4$')
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

title('Fig. 9.13 ($Q = {\rm diag}\{10^{-3},\,10^{-3},\,{q}_{3}\}$, $R = 1$, $x(0) = 0$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$u(t)$ [N$\cdot$m]','Interpreter','latex','FontSize',14)

legend('${q}_{3} = 5 \times 10^3$','${q}_{3} = 5 \times 10^4$')
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('north')


