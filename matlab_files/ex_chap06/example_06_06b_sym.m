% example_06_06b_sym.m
% 例 6.6
% マス・ばね・ダンパ系の I-PD 制御
% （目標値応答に注目した部分的モデルマッチング法による kI, kP, kD の設計）
% 【Symbolic Math Toolbox】


disp(' ')
disp(' ***** 例 6.6（目標値応答に注目した I-PD 制御） ********************')

syms s
syms kP kI kD real
syms alpha1 alpha2 wm positive

a0 = 2;
a1 = 2;
b0 = 5;

% --------------------
disp(' ')
disp(' ---- P(s) ---- ')
P = b0/(s^2 + a1*s + a0)

disp(' ')
disp(' ---- 1/P(s) をマクローリン展開（2 次まで） ---- ')
inv_P = taylor(1/P,'Order',3)

% --------------------
disp(' ')
disp(' ---- C1(s) ---- ')
C1 = kP + kI/s + kD*s

% --------------------
disp(' ')
disp(' ---- C3(s) ---- ')
C3 = kI/s
inv_C3 = 1/C3;

% --------------------
disp(' ')
disp(' ---- Gyr(s) ---- ')
Gyr = P*C3/(1 + P*C1);
Gyr = collect(Gyr,s)

% --------------------
disp(' ')
disp(' ---- 1/Gyr(s) = gamma0 + gamma1*s + gamma2*s^2 + gamma3*s^3 + ... ---- ')
disp(' ---- gamma = [ gamma0')
disp('                gamma1')
disp('                gamma2')
disp('                gamma3 ] ---------------------------------------------- ')
inv_Gyr = inv_C3*(inv_P + C1);
gamma = coeffs(expand(inv_Gyr),s)';
gamma = gamma(1:4)

% --------------------
disp(' ')
disp(' ---- Gm3(s) ---- ')
Gm3 = wm^3/(s^3 + alpha2*wm*s^2 + alpha1*wm^2*s + wm^3);

disp(' ')
disp(' ---- 1/Gm3(s) = gamma_m0 + gamma_m1*s + gamma_m2*s^2 + gamma_m3*s^3 ---- ')
disp(' ---- gamma_m = [ gamma_m0')
disp('                  gamma_m1')
disp('                  gamma_m2')
disp('                  gamma_m3 ] -------------------------------------------- ')
gamma_m = coeffs(1/Gm3,s)'

% --------------------
disp(' ')
disp(' ---- PID パラメータ（gamma = gamma_m の解） ---- ')
[sol_kI sol_kP sol_kD] = solve(gamma(2:4)==gamma_m(2:4),[kI kP kD])

% --------------------
disp(' ')
disp(' ---- Gm3(s) を 2 項係数標準形 (alpha1 = alpha2 = 3, wm = 6) としたときの PID パラメータ ---- ')
kI_binomial = subs(sol_kI,{alpha1,alpha2,wm},{3,3,6})
kP_binomial = subs(sol_kP,{alpha1,alpha2,wm},{3,3,6})
kD_binomial = subs(sol_kD,{alpha1,alpha2,wm},{3,3,6})

% --------------------
disp(' ')
disp(' ---- Gm3(s) を バターワース標準形 (alpha1 = alpha2 = 2, wm = 6) としたときの PID パラメータ ---- ')
kI_butterworth = subs(sol_kI,{alpha1,alpha2,wm},{2,2,6})
kP_butterworth = subs(sol_kP,{alpha1,alpha2,wm},{2,2,6})
kD_butterworth = subs(sol_kD,{alpha1,alpha2,wm},{2,2,6})






