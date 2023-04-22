% exercise_03_03.m
% 問題 3.3
% 簡略化したフルビッツの安定判別法

% -------------------------------------------------------
clear
format compact

disp(' ')
disp(' ***** 問題 3.3 (1) ********************')
sysP = tf([1 10],[1 1 4 30])
[numP denP] = tfdata(sysP,'v');
disp(' ----簡略化したフルビッツの安定判別法 ----')
hurwitz

disp(' ')
disp(' ---- P(s) の極 ----')
pole(sysP)

% -------------------------------------------------------
clear
format compact

disp(' ')
disp(' ***** 問題 3.3 (2) ********************')
sysP = tf([1 3 2],[1 4 11 14 10])
[numP denP] = tfdata(sysP,'v');
disp(' ----簡略化したフルビッツの安定判別法 ----')
hurwitz

disp(' ')
disp(' ---- P(s) の極 ----')
pole(sysP)
