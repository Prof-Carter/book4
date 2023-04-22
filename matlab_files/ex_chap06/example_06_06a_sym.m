% example_06_06a_sym.m
% �� 6.6
% �}�X�E�΂ˁE�_���p�n�� PI-D ����
% �i�ڕW�l�����ɒ��ڂ��������I���f���}�b�`���O�@�ɂ�� kI, kP, kD �̐݌v�j
% �ySymbolic Math Toolbox�z


disp(' ')
disp(' ***** �� 6.6�i�ڕW�l�����ɒ��ڂ��� PI-D ����j ********************')

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
disp(' ---- PID �p�����[�^�igamma = gamma_m �̉��j ---- ')
[sol_kI sol_kP sol_kD] = solve(gamma(2:4)==gamma_m(2:4),[kI kP kD])

% --------------------
disp(' ')
disp(' ---- Gm3(s) �� 2 ���W���W���` (alpha1 = alpha2 = 3, wm = 6) �Ƃ����Ƃ��� PID �p�����[�^ ---- ')
kI_binomial = subs(sol_kI,{alpha1,alpha2,wm},{3,3,6})
kP_binomial = subs(sol_kP,{alpha1,alpha2,wm},{3,3,6})
kD_binomial = subs(sol_kD,{alpha1,alpha2,wm},{3,3,6})

% --------------------
disp(' ')
disp(' ---- Gm3(s) �� �o�^�[���[�X�W���` (alpha1 = alpha2 = 2, wm = 6) �Ƃ����Ƃ��� PID �p�����[�^ ---- ')
kI_butterworth = subs(sol_kI,{alpha1,alpha2,wm},{2,2,6})
kP_butterworth = subs(sol_kP,{alpha1,alpha2,wm},{2,2,6})
kD_butterworth = subs(sol_kD,{alpha1,alpha2,wm},{2,2,6})






