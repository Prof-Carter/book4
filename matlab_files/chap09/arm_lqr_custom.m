% arm_lqr_custom
% 鉛直面を回転するアームの状態フィードバック制御：最適レギュレータ（関数 lqr の使用例）====> グラスのカスタマイズ

close all

clear
format compact

arm_para

A = [    0       1
     -M*g*l/J  -c/J ];
B = [ 0
     1/J ];

q1 = 80;
q2 = 0.001;
Q = diag([q1 q2]);
R = 1;
K = - lqr(A,B,Q,R)

eig(A + B*K)

x0 = [ 1  0 ]';
sim('sim_arm_sfbk')

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
plot(t,x1,'LineWidth',1.5)
set(gca,'FontSize',14,'FontName','Arial')
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('{x}_{1} [rad]','FontSize',16,'FontName','Arial')
grid on
ylim([-0.2 1])
set(gca,'XTick',0:0.1:1)
set(gca,'YTick',-0.2:0.2:1)

figure(2)
subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
plot(t,u,'LineWidth',1.5)
set(gca,'FontSize',14,'FontName','Arial')
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('u(t) [Nm]','FontSize',16,'FontName','Arial')
grid on
ylim([-9 1])
set(gca,'XTick',0:0.1:1)
set(gca,'YTick',-9:1:1)

