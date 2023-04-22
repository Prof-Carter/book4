% example_09_07_sym.m
% 例 9.7
% 鉛直面を回転するアーム系の状態フィードバック制御：極配置
% 【Symbolic Math Toolbox】

clear
format compact

syms s
syms a0 a1 b0 real

% --------------------------------------------------
disp(' ')
disp(' ***** 例 9.7 ********************')

disp(' ')
disp(' ---- A, B 行列 ---- ')
A = [ 0    1
     -a0  -a1 ]
B = [ 0
      b0 ]
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
p = sym('p',[1 n],'real')

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



