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
rc_deg = 120;  rc = rc_deg*(pi/180);
dc = 2;
sim('arm_linear_sim_pi_d_cont')
y_linear = y;
% sim('arm_nonlinear_sim_pi_d_cont')
sim('arm_nonlinear_sim_pi_d_cont_MATLAB_function')
% --------------------
sysGm2 = tf([wm^2],[1 a1*wm wm^2]);
ym = step(sysGm2,t)*rc;
% --------------------
figure(1)
plot(t,y_linear*(180/pi),t,y*(180/pi),'-.',t,ym*(180/pi),'--')
xlabel('t [s]')
ylabel('y(t) and {y}_{m}(t) [deg]')
legend({'y(t) (Linear simulation)',...
        'y(t) (Nonlinear simulation)',...
        '{y}_{m}(t) (d(t) = 0)'},'Location','SouthEast')
ylim([0 (4/3)*rc_deg])
grid on

