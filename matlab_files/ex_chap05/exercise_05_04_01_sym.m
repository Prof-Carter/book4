% exercise_05_04_sym.m
% ��� 5.4 (1)
% �t�B�[�h�o�b�N����n�̓������萫�̔��ʁF�t���r�b�c�̈��蔻�ʖ@�i�ȗ������������j
% �ySymbolic Math tauoolbox�z

disp(' ')
disp(' ***** ��� 5.4 (1) ********************')

clear
format compact

syms s
syms kP real

P = 2/(s^3 + 4*s^2 + 5*s - 1);
C = kP;

[Np Dp] = numden(P);
[Nc Dc] = numden(C);
Delta = Dp*Dc + Np*Nc;
Delta = collect(Delta,s)

hurwitz_sym

