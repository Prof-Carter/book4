% example_02_12_sym.m
% �� 2.12 / �� 2.13
% �������������i�d�����܂ޏꍇ�j�Ƌt���v���X�ϊ�
% �ySymbolic Math Toolbox�z

clear
format compact

syms s
syms t real

disp(' ')
disp(' ***** �� 2.12 / �� 2.13 ******************')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = (2*s + 1)/(s*(s + 1)^2)
ft = ilaplace(fs)


disp(' ')
disp(' ***** �� 2.12 / �� 2.13 ******************')
disp(' ***** �������������Ƌt���v���X�ϊ� ********')
fs = (2*s + 1)/(s*(s + 1)^2)
fs = prod(factor(fs))

p1  = 0
k1  = subs(s*fs,   s,p1)

p2  = -1
k22 = subs(     (s + 1)^2*fs,   s,p2)
k21 = subs(diff((s + 1)^2*fs,s),s,p2)

ft = k1*exp(p1*t) + k22*t*exp(p2*t) + k21*exp(p2*t)

