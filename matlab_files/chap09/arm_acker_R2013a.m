% arm_acker_R2013a
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
sim('sim_arm_sfbk_R2013a')

figure(1)
plot(t,x1)
xlabel('t [s]')
ylabel('{x}_{1} [rad]')
grid on

figure(2)
plot(t,u)
xlabel('t [s]')
ylabel('u(t) [Nm]')
grid on

