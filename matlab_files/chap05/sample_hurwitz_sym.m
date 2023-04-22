% sample_hurwitz_sym.m
% �� 5.7�F�t���r�b�c�̈��蔻�ʖ@�i�ȗ������������j

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