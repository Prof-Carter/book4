% sample_hurwitz_sym.m
% 例 5.7：フルビッツの安定判別法（簡略化した条件）

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