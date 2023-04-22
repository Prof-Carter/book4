% arm_linear_pi_d_design.m
% �����ʂ���]����A�[���n�� PI-D �R���g���[���݌v�Ɛ��`�V�~�����[�V����

close all

clear
format compact

arm_para
d0 = M*g*l;  d1 = c;  d2 = J;
% --------------------
wm = 10;  a1 = 1.4;
gamma_m1 = a1/wm;
gamma_m2 =  1/wm^2;
gamma_m3 =  0;
% --------------------
kI =  d0/gamma_m1
kP = (d2*gamma_m1 - d0*gamma_m3)/(gamma_m1*gamma_m2)
kD = (d2*gamma_m1^2 - d1*gamma_m1*gamma_m2 ...
                  + d0*(gamma_m2^2 - gamma_m1*gamma_m3))/(gamma_m1*gamma_m2)
% --------------------
rc_deg = 30;  rc = rc_deg*(pi/180);
dc = 0.5;
sim('arm_linear_sim_pi_d_cont')
% --------------------
sysGm2 = tf([wm^2],[1 a1*wm wm^2]);
ym = step(sysGm2,t)*rc;
% --------------------
figure(1)
plot(t,y*(180/pi),t,ym*(180/pi),'--')
xlabel('t [s]')
ylabel('y(t) and {y}_{m}(t) [deg]')
legend({'y(t)','{y}_{m}(t) (d(t) = 0)'},'Location','SouthEast')
ylim([0 (4/3)*rc_deg])
grid on
% --------------------
s = tf('s');
sysP  = 1/(J*s^2 + c*s + M*g*l);
sysC1 = kP + kI/s + kD*s;
sysC2 = kP + kI/s;
sysGyr = zpk(minreal(sysP*sysC2/(1 + sysP*sysC1)))
sysGyd = zpk(minreal(         1/(1 + sysP*sysC1)))


