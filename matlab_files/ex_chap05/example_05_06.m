% example_05_06.m
% 例 5.6
% フィードバック制御系の内部安定性の判別（不安定な極零相殺）

disp(' ')
disp(' ***** 例 5.6 (1) ********************')

clear
format compact

sysP = tf([1],[1 -1]);
sysC = tf([1 -1],[1 1]);

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
disp(' ----- Gyr(s), Gyd(s), Gur(s), Gud(s) -----')
sysPC = minreal(sysP*sysC);

sysGyr = minreal(  sysPC/(1 + sysPC))
sysGyd = minreal(  sysP /(1 + sysPC))
sysGur = minreal(  sysC /(1 + sysPC))
sysGud = minreal(- sysPC/(1 + sysPC))

disp(' ')
disp(' ***** 例 5.6 (2) ********************')

clear
format compact

sysP = tf([1 -1],[1 1]);
sysC = tf([1],[1 -1]);

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
disp(' ----- Gyr(s), Gyd(s), Gur(s), Gud(s) -----')
sysPC = minreal(sysP*sysC);

sysGyr = minreal(  sysPC/(1 + sysPC))
sysGyd = minreal(  sysP /(1 + sysPC))
sysGur = minreal(  sysC /(1 + sysPC))
sysGud = minreal(- sysPC/(1 + sysPC))


