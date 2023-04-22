% example_06_03_sym.m
% �� 6.3
% �}�X�E�΂ˁE�_���p�n�� PI-D ����ikP > 0, kI > 0, kD > 0 �ł���Ƃ��̈�������j
% �@�@===>�@�t���r�b�c�̈��蔻�ʖ@�i�ȗ������������j
% �ySymbolic Math Toolbox�z

clear
format compact

disp(' ')
disp(' ***** �� 6.3 ********************')

syms s
syms kP kI kD real
syms zeta wn K1 positive
syms zeta_m wm positive

a0 = 2;
a1 = 2;
b0 = 5;

disp(' ')
disp(' ---- �}�X�E�΂ˁE�_���p�n�̓`�B�֐� P(s) ---- ')
Ps = b0/(s^2 + a1*s + a0)
disp(' ')
disp(' ---- P--D �R���g���[�� C(s) ---- ')
C1s = kP + kI/s + kD*s
C2s = kP + kI/s

disp(' ')
disp(' ---- Gyr(s) ---- ')
Gyr = collect(Ps*C2s/(1 + Ps*C1s),s)

disp(' ')
disp(' ---- Gyd(s) ---- ')
Gyd = collect(Ps/(1 + Ps*C1s),s)

disp(' ')
disp(' ---- ���������� ��(s) ---- ')
[numPs  denPs]  = numden(Ps);
[numC1s denC1s] = numden(C1s);

Delta = denPs*denC1s + numPs*numC1s;
Delta = collect(Delta,s)


disp(' ')
disp('**********************************************')
disp('***** kP > 0, kI > 0, kD > 0 �ł���Ƃ��� *****')
disp('***** �t���r�b�c�̈��蔻�ʖ@�ɂ��������  *****')
disp('**********************************************')
disp(' ')
assume(kP > 0)
assume(kI > 0)
assume(kD > 0)

hurwitz_sym




