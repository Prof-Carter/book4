% exercise_02_06_sym.m
% ��� 2.6
% �������������i�d�����܂ޏꍇ�̃w�r�T�C�h�̌����j�Ƌt���v���X�ϊ�
% �ySymbolic Math Toolbox�z

clear
format compact

syms s
syms t real

disp(' ')
disp(' ***** ��� 2.6 ***************************')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = (s + 4)/(s^2 + 4*s + 4)
ft = ilaplace(fs)

disp(' ')
disp(' ***** ��� 2.6 ***************************')
disp(' ***** �������������Ƌt���v���X�ϊ� ********')
fs = (s + 4)/(s^2 + 4*s + 4)
fs = prod(factor(fs))

p1 = -2
k12 = subs(     (s + 2)^2*fs,   s,p1)
k11 = subs(diff((s + 2)^2*fs,s),s,p1)

ft = k12*t*exp(p1*t) + k11*exp(p1*t)

