% arm_acker_custom
% 鉛直面を回転するアームの状態フィードバック制御：極配置（関数 acker の使用例）

close all

clear
format compact

arm_para

A = [    0       1
     -M*g*l/J  -c/J ];
B = [ 0
     1/J ];

p = [ -10+10j
      -10-10j ];
K = - acker(A,B,p)

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
ylim([-14 2])
set(gca,'XTick',0:0.1:1)
set(gca,'YTick',-14:2:2)

