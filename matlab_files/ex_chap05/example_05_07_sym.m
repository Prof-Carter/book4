% example_05_07_sym.m
% �� 5.7
% �t�B�[�h�o�b�N����n�̓������萫�̔��ʁF�t���r�b�c�̈��蔻�ʖ@�i�ȗ������������j
% �ySymbolic Math Toolbox�z

clear
format compact

disp(' ')
disp(' ***** �� 5.7 ********************')

syms s
syms kP kI real

P = 5/(s^2 + 2*s + 2);
C = (kP*s + kI)/s;

[Np Dp] = numden(P);
[Nc Dc] = numden(C);
Delta = Dp*Dc + Np*Nc;
Delta = collect(Delta,s)

Delta = subs(Delta,kP,0.5)

hurwitz_sym