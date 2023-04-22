% exercise_02_06_sym.m
% 問題 2.6
% 部分分数分解（重解を含む場合のヘビサイドの公式）と逆ラプラス変換
% 【Symbolic Math Toolbox】

clear
format compact

syms s
syms t real

disp(' ')
disp(' ***** 問題 2.6 ***************************')
disp(' ***** 関数 ilaplace による逆ラプラス変換 **')
fs = (s + 4)/(s^2 + 4*s + 4)
ft = ilaplace(fs)

disp(' ')
disp(' ***** 問題 2.6 ***************************')
disp(' ***** 部分分数分解と逆ラプラス変換 ********')
fs = (s + 4)/(s^2 + 4*s + 4)
fs = prod(factor(fs))

p1 = -2
k12 = subs(     (s + 2)^2*fs,   s,p1)
k11 = subs(diff((s + 2)^2*fs,s),s,p1)

ft = k12*t*exp(p1*t) + k11*exp(p1*t)

