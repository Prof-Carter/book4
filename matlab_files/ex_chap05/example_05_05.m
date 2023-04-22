% example_05_05.m
% 例 5.5
% フィードバック制御系の内部安定性の判別

disp(' ')
disp(' ***** 例 5.5 ********************')

clear
format compact

sysP = tf([1],[1 -1]);
sysC = tf([2 1],[1 0]);

[numP denP] = tfdata(sysP,'v');
[numC denC] = tfdata(sysC,'v');

disp(' ')
disp(' ----- 特性多項式 ⊿(s) -----')
Delta = conv(denP,denC) + conv(numP,numC);
sysDelta = tf(Delta,[1])

disp(' ')
disp(' ----- 特性方程式 ⊿(s) = 0 の解 -----')
sol = roots(Delta)

if real(sol) < 0
    disp('===> 内部安定である')
else
    disp('===> 内部安定ではない')
end
