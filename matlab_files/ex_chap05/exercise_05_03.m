% exercise_05_03.m
% 問題 5.3
% フィードバック制御系の内部安定性の判別

disp(' ')
disp(' ***** 問題 5.3 (1) ********************')

clear
format compact

s = tf('s');
sysP = 1/((s - 1)*(s + 2));
sysC = tf([1],[1]);

[numP denP] = tfdata(sysP,'v');
[numC denC] = tfdata(sysC,'v');

disp(' ')
disp(' ----- 特性方程式 ⊿(s) = 0 の解 -----')
Delta = conv(denP,denC) + conv(numP,numC);
sysDelta = tf(Delta,[1])
sol = roots(Delta)

if real(sol) < 0
    disp('===> 内部安定である')
else
    disp('===> 内部安定ではない')
end

disp(' ')
disp(' ***** 問題 5.3 (2) ********************')

clear
format compact

s = tf('s');
sysP = (s + 1)/((s + 2)*(s + 3));
sysC = 1/(s + 1);

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

disp(' ')
disp(' ***** 問題 5.3 (3) ********************')

clear
format compact

s = tf('s');
sysP = (s - 1)/(s^2 + 3*s + 1);
sysC = 1/(s - 1);

[numP denP] = tfdata(sysP,'v');
[numC denC] = tfdata(sysC,'v');

disp(' ')
disp(' ----- 特性方程式 ⊿(s) = 0 の解 -----')
Delta = conv(denP,denC) + conv(numP,numC);
sysDelta = tf(Delta,[1])
sol = roots(Delta)

if real(sol) < 0
    disp('===> 内部安定である')
else
    disp('===> 内部安定ではない')
end
