% i_pd_design_custom_R2013a.m
% 鉛直面を回転するアーム系の I-PD コントローラ設計と線形シミュレーション
% （目標値応答に注目した部分的モデルマッチング法） ====> グラスのカスタマイズ

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
C3 = kI/s;
inv_C3 = 1/C3;
% --------------------
inv_Gyr = inv_C3*(inv_P + C1);
gamma = coeffs(expand(inv_Gyr),s)';
gamma = gamma(1:4)
% --------------------
wm = 2;  a1 = 2;  a2 = 2;
Gm3 = wm^3/(s^3 + a2*wm*s^2 + a1*wm^2*s + wm^3);
gamma_m = coeffs(1/Gm3,s)'
% --------------------
[sol_kD sol_kI sol_kP] = solve(gamma(2:4)==gamma_m(2:4));
% --------------------
kI = double(sol_kI)
kP = double(sol_kP)
kD = double(sol_kD)
% --------------------
Tf = 0.01;
b = 0;  c = 0;
sim('two_dof_pid_cont_R2013a')
% --------------------
sysGm3 = tf([wm^3],[1 a2*wm a1*wm^2 wm^3]);
ym = step(sysGm3,t);
% --------------------
figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
plot(t,y,t,ym,'--','LineWidth',1.5)
set(gca,'FontSize',14,'FontName','Arial')
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('y(t) and {y}_{m}(t)','FontSize',16,'FontName','Arial')
legend({'y(t)','{y}_{m}(t)'},'Location','SouthEast','FontSize',16,'FontName','Arial')
ylim([0 1.5])
grid on

