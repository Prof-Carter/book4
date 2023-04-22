% example_06_03_sym.m
% 例 6.3
% マス・ばね・ダンパ系の PI-D 制御（kP > 0, kI > 0, kD > 0 であるときの安定条件）
% 　　===>　フルビッツの安定判別法（簡略化した条件）
% 【Symbolic Math Toolbox】

clear
format compact

disp(' ')
disp(' ***** 例 6.3 ********************')

syms s
syms kP kI kD real
syms zeta wn K1 positive
syms zeta_m wm positive

a0 = 2;
a1 = 2;
b0 = 5;

disp(' ')
disp(' ---- マス・ばね・ダンパ系の伝達関数 P(s) ---- ')
Ps = b0/(s^2 + a1*s + a0)
disp(' ')
disp(' ---- P--D コントローラ C(s) ---- ')
C1s = kP + kI/s + kD*s
C2s = kP + kI/s

disp(' ')
disp(' ---- Gyr(s) ---- ')
Gyr = collect(Ps*C2s/(1 + Ps*C1s),s)

disp(' ')
disp(' ---- Gyd(s) ---- ')
Gyd = collect(Ps/(1 + Ps*C1s),s)

disp(' ')
disp(' ---- 特性多項式 ⊿(s) ---- ')
[numPs  denPs]  = numden(Ps);
[numC1s denC1s] = numden(C1s);

Delta = denPs*denC1s + numPs*numC1s;
Delta = collect(Delta,s)


disp(' ')
disp('**********************************************')
disp('***** kP > 0, kI > 0, kD > 0 であるときの *****')
disp('***** フルビッツの安定判別法による安定条件  *****')
disp('**********************************************')
disp(' ')
assume(kP > 0)
assume(kI > 0)
assume(kD > 0)

hurwitz_sym




