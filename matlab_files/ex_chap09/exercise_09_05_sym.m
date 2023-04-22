% exercise_09_05_sym.m
% ��� 9.5
% ��ԃt�B�[�h�o�b�N����F�ɔz�u
% �ySymbolic Math Toolbox�z

clear
format compact

syms s

% --------------------------------------------------
disp(' ')
disp(' ***** ��� 9.5 ********************')

disp(' ')
disp(' ---- A, B �s�� ---- ')
A = [ 0  2
      1  3 ]
B = [ -1
       1 ]
n = length(A);

disp(' ')
disp(' ---- ��ԃt�B�[�h�o�b�N�Q�C�� K ---- ')
K = sym('k',[1 n],'real')

disp(' ')
disp(' ---- |s*I - (A + B*K)| ---- ')
n = length(A);
det_A_BK = det(s*eye(n) - (A + B*K));
det_A_BK = collect(det_A_BK,s)

disp(' ')
disp(' ---- |s*I - (A + B*K)| �̌W�� a ---- ')
a = fliplr(coeffs(det_A_BK,s))

disp(' ')
disp(' ---- �w�肷��ŗL�l�i�Ɂj p ---- ')
p = [ -2+j
      -2-j ]

disp(' ')
disp(' ---- ��(s) = (s - p1)*(s - p2) ---- ')
delta = 1;
for i = 1:n
    delta = delta*(s - p(i));
end
delta = collect(delta,s)

disp(' ')
disp(' ---- ��(s) �̌W�� d ---- ')
d = fliplr(coeffs(delta,s))

disp(' ')
disp(' ---- a = d �ƂȂ�悤�� K ��݌v ---- ')
[k1 k2] = solve(a == d, K)



