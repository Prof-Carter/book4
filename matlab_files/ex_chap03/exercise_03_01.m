% exercise_03_01.m
% 問題 3.1
% 安定性判別と単位ステップ応答の定常値

clear
format compact

% -------------------------------------------------------
disp(' ')
disp(' ***** 問題 3.1 (1) ********************')
s = tf('s');
sysP = 1/((s + 1)*(s + 2))

pole_P = pole(sysP)

if real(pole_P) < 0
    disp('　=====> 安定')
    [numP denP] = tfdata(sysP,'v');
    yinf = numP(end)/denP(end)
else
    disp('　=====> 不安定')
end

% -------------------------------------------------------
disp(' ')
disp(' ***** 問題 3.1 (2) ********************')
s = tf('s');
sysP = (s + 1)/((s - 1)*(s + 2))

pole_P = pole(sysP)

if real(pole_P) < 0
    disp('　=====> 安定')
    [numP denP] = tfdata(sysP,'v');
    yinf = numP(end)/denP(end)
else
    disp('　=====> 不安定')
end

% -------------------------------------------------------
disp(' ')
disp(' ***** 問題 3.1 (3) ********************')
s = tf('s');
sysP = 1/(s^2 - 2*s + 2)

pole_P = pole(sysP)

if real(pole_P) < 0
    disp('　=====> 安定')
    [numP denP] = tfdata(sysP,'v');
    yinf = numP(end)/denP(end)
else
    disp('　=====> 不安定')
end

% -------------------------------------------------------
disp(' ')
disp(' ***** 問題 3.1 (4) ********************')
s = tf('s');
sysP = (-s + 2)/((s + 1)*(s^2 + 2*s + 2))

pole_P = pole(sysP)

if real(pole_P) < 0
    disp('　=====> 安定')
    [numP denP] = tfdata(sysP,'v');
    yinf = numP(end)/denP(end)
else
    disp('　=====> 不安定')
end
    