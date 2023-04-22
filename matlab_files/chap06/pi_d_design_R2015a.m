% pi_d_design_R2015a.m
% 鉛直面を回転するアーム系の PI-D コントローラ設計と線形シミュレーション
% （目標値応答に注目した部分的モデルマッチング法）

close all

clear
format compact

syms s
syms kP kI kD real
% --------------------
P = (s + 1)/(s^2 - s + 1);
inv_P = taylor(1/P)
% --------------------
C1 = (kD*s^2 + kP*s + kI)/s;
% --------------------
C2 = (kP*s + kI)/s;
inv_C2 = taylor(1/C2);
% --------------------
inv_Gyr = inv_C2*(inv_P + C1);
gamma = coeffs(expand(inv_Gyr),s)';
gamma = gamma(1:4)
% --------------------
wm = 2;  a1 = 2;  a2 = 2;
Gm3 = wm^3/(s^3 + a2*wm*s^2 + a1*wm^2*s + wm^3);
gamma_m = coeffs(1/Gm3,s)'
% --------------------
[sol_kI sol_kP sol_kD] = solve(gamma(2:4)==gamma_m(2:4),[kI kP kD]);
% --------------------
kI = double(sol_kI)
kP = double(sol_kP)
kD = double(sol_kD)
% --------------------
Tf = 0.01;
b = 1;  c = 0;
sim('two_dof_pid_cont_R2015a')
% --------------------
sysGm3 = tf([wm^3],[1 a2*wm a1*wm^2 wm^3]);
ym = step(sysGm3,t);
% --------------------
figure(1)
plot(t,y,t,ym,'--')
xlabel('t [s]')
ylabel('y(t) and {y}_{m}(t)')
legend({'y(t)','{y}_{m}(t)'},'Location','SouthEast')
ylim([0 1.5])
grid on

