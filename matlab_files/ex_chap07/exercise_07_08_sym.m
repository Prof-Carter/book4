% exercise_07_08_sym.m
% ��� 7.8
% 1 ���x��v�f�̃i�C�L�X�g�O��

clear
format compact

syms s
syms w positive
syms T positive

disp(' ')
disp(' ---- �`�B�֐� P(s) ---- ')
Ps = 1/(1 + T*s)

disp(' ')
disp(' ---- ���g���`�B�֐� P(jw) ---- ')
Pjw = subs(Ps,s,1i*w)

disp(' ')
disp(' ---- a = Re[P(jw)] ---- ')
a = real(Pjw)

disp(' ')
disp(' ---- b = Im[P(jw)] ---- ')
b = imag(Pjw)

disp(' ')
disp(' ---- eq = (a - 1/2)^2 + b^2 ---- ')
eq = (a - 1/2)^2 + b^2

disp(' ')
disp(' ---- eq �̊ȗ��� ---- ')
eq = simplify(eq)

