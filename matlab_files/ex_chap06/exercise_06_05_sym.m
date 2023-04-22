% exercise_06_05_sym.m
% ��� 6.5
% �}�X�E�΂ˁE�_���p�n�� PI-D ����i�ڕW�l�����ɒ��ڂ��������I���f���}�b�`���O�@�j
% �ɂ����āC�K�̓��f���� 2 ���Ƃ����ꍇ
% �ySymbolic Math Toolbox�z

disp(' ')
disp(' ***** ��� 6.5�i�ڕW�l�����ɒ��ڂ��� PI-D ����j ********************')

syms s
syms kP kI kD real
syms alpha1 wm positive

a0 = 2;
a1 = 2;
b0 = 5;

% --------------------
disp(' ')
disp(' ---- P(s) ---- ')
P = b0/(s^2 + a1*s + a0)

disp(' ')
disp(' ---- 1/P(s) ���}�N���[�����W�J�i2 ���܂Łj ---- ')
inv_P = taylor(1/P,'Order',3)

% --------------------
disp(' ')
disp(' ---- C1(s) ---- ')
C1 = kP + kI/s + kD*s

% --------------------
disp(' ')
disp(' ---- C2(s) ---- ')
C2 = kP + kI/s
inv_C2 = taylor(1/C2);

% --------------------
disp(' ')
disp(' ---- Gyr(s) ---- ')
Gyr = P*C2/(1 + P*C1);
Gyr = collect(Gyr,s)

% --------------------
disp(' ')
disp(' ---- 1/Gyr(s) = gamma0 + gamma1*s + gamma2*s^2 + gamma3*s^3 + ... ---- ')
disp(' ---- gamma = [ gamma0')
disp('                gamma1')
disp('                gamma2')
disp('                gamma3 ] ---------------------------------------------- ')
inv_Gyr = inv_C2*(inv_P + C1);
gamma = coeffs(expand(inv_Gyr),s)';
gamma = gamma(1:4)

% --------------------
disp(' ')
disp(' ---- Gm2(s) ---- ')
Gm2 = wm^2/(s^2 + alpha1*wm*s + wm^2);

disp(' ')
disp(' ---- 1/Gm3(s) = gamma_m0 + gamma_m1*s + gamma_m2*s^2 + gamma_m3*s^3 ---- ')
disp(' ---- gamma_m = [ gamma_m0')
disp('                  gamma_m1')
disp('                  gamma_m2')
disp('                  gamma_m3 ] -------------------------------------------- ')
gamma_m = coeffs(1/Gm2,s)';
gamma_m = [ gamma_m
            0 ]

% --------------------
disp(' ')
disp(' ---- PID �p�����[�^�igamma = gamma_m �̉��j ---- ')
[sol_kI sol_kP sol_kD] = solve(gamma(2:4)==gamma_m(2:4),[kI kP kD])

% --------------------
disp(' ')
disp(' ---- Gm2(s) �� 2 ���W���W���` (alpha1 = 2, wm = 6)  ---- ')
Gm2_binomial = subs(Gm2,{alpha1,wm},{2,6})

% --------------------
disp(' ')
disp(' ---- Gm2(s) �� 2 ���W���W���` (alpha1 = 2, wm = 6) �Ƃ����Ƃ��� PID �p�����[�^ ---- ')
kI_binomial = subs(sol_kI,{alpha1,wm},{2,6})
kP_binomial = subs(sol_kP,{alpha1,wm},{2,6})
kD_binomial = subs(sol_kD,{alpha1,wm},{2,6})

% --------------------
disp(' ')
disp(' ---- Gyr(s)  ---- ')
Gyr_binomial = subs(Gyr,{kI,kP,kD},{kI_binomial,kP_binomial,kD_binomial})
Gyr_binomial = collect(Gyr_binomial,s)
Gyr_binomial = simplify(Gyr_binomial)

