% example_09_02.m
% 例 9.2
% 状態空間表現から伝達関数表現への変換
% 【Symbolic Math Toolbox】

clear
format compact

disp(' ')
disp(' ***** 例 9.2 ********************')

syms J c M g l positive
syms s

disp(' ')
disp(' ---- 状態空間表現の A, B, C 行列 ---- ')
A = [  0         1
      -M*g*l/J  -c/J ]
B = [  0
       1/J ];
C = [ 1  0 ]

disp(' ')
disp(' ---- 伝達関数 P(s) = C*(s*I - A)^(-1)*B ---- ')
n = length(A);
Ps = C*inv(s*eye(n) - A)*B;
Ps = collect(Ps,s)