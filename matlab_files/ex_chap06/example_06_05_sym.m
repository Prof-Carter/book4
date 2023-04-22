% example_06_05_sym.m
% �� 6.5
% ��������
% �ySymbolic Math Toolbox�z


disp(' ')
disp(' ***** �� 6.5 ********************')

syms s

disp(' ')
disp(' ---- P(s) ---- ')
Ps = (s + 9)/(3*s^2 + 6*s + 9)

disp(' ')
disp(' ---- 1/P(s) ---- ')
inv_Ps = 1/Ps

disp(' ')
disp(' ---- 1/P(s) ���}�N���[�����W�J�i2 ���܂Łj ---- ')
inv_Ps_taylor = taylor(inv_Ps,s,'Order',3)


