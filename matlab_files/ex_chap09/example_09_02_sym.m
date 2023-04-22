% example_09_02.m
% �� 9.2
% ��ԋ�ԕ\������`�B�֐��\���ւ̕ϊ�
% �ySymbolic Math Toolbox�z

clear
format compact

disp(' ')
disp(' ***** �� 9.2 ********************')

syms J c M g l positive
syms s

disp(' ')
disp(' ---- ��ԋ�ԕ\���� A, B, C �s�� ---- ')
A = [  0         1
      -M*g*l/J  -c/J ]
B = [  0
       1/J ];
C = [ 1  0 ]

disp(' ')
disp(' ---- �`�B�֐� P(s) = C*(s*I - A)^(-1)*B ---- ')
n = length(A);
Ps = C*inv(s*eye(n) - A)*B;
Ps = collect(Ps,s)