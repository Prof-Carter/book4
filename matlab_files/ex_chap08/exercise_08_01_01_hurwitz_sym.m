% exercise_08_01_01_hurwitz_sym.m
% ��� 8.1 (1)
% �t���r�b�c�̈��蔻�ʖ@�i�ȗ������������j
% �ySymbolic Math Toolbox�z

clear
format compact

disp(' ')
disp(' ***** ��� 8.1 (1) ********************')

syms s
syms kP real

disp(' ')
disp(' ---- P(s) ---- ')
Ps = 1/((s + 1)^2*(s + 2))

disp(' ')
disp(' ---- C(s) ---- ')
Cs = kP

disp(' ')
disp(' ---- L(s) = P(s)C(s) ---- ')
Ls = Ps*Cs

disp(' ')
disp(' ---- ���������� ��(s) ---- ')
[numLs  denLs]  = numden(Ls);

Delta = denLs + numLs;
Delta = collect(Delta,s)


disp(' ')
disp('**********************************************')
disp('***** kP > 0 �ł���Ƃ���                 *****')
disp('***** �t���r�b�c�̈��蔻�ʖ@�ɂ�������� ******')
disp('**********************************************')
disp(' ')
assume(kP > 0)

hurwitz_sym





