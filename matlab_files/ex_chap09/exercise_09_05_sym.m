% exercise_09_05_sym.m
% 問題 9.5
% 状態フィードバック制御：極配置
% 【Symbolic Math Toolbox】

clear
format compact

syms s

% --------------------------------------------------
disp(' ')
disp(' ***** 問題 9.5 ********************')

disp(' ')
disp(' ---- A, B 行列 ---- ')
A = [ 0  2
      1  3 ]
B = [ -1
       1 ]
n = length(A);

disp(' ')
disp(' ---- 状態フィードバックゲイン K ---- ')
K = sym('k',[1 n],'real')

disp(' ')
disp(' ---- |s*I - (A + B*K)| ---- ')
n = length(A);
det_A_BK = det(s*eye(n) - (A + B*K));
det_A_BK = collect(det_A_BK,s)

disp(' ')
disp(' ---- |s*I - (A + B*K)| の係数 a ---- ')
a = fliplr(coeffs(det_A_BK,s))

disp(' ')
disp(' ---- 指定する固有値（極） p ---- ')
p = [ -2+j
      -2-j ]

disp(' ')
disp(' ---- ⊿(s) = (s - p1)*(s - p2) ---- ')
delta = 1;
for i = 1:n
    delta = delta*(s - p(i));
end
delta = collect(delta,s)

disp(' ')
disp(' ---- ⊿(s) の係数 d ---- ')
d = fliplr(coeffs(delta,s))

disp(' ')
disp(' ---- a = d となるように K を設計 ---- ')
[k1 k2] = solve(a == d, K)



