% arm_lqr_R2013a
% �����ʂ���]����A�[���̏�ԃt�B�[�h�o�b�N����F�œK���M�����[�^�i�֐� lqr �̎g�p��j

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

