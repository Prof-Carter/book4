% exercise_07_10.m
% 問題 7.10 (2)
% RLC 回路の周波数特性（ピーク角周波数と共振ピーク）

disp(' ')
disp(' ***** 問題 7.10 (2) ********************')

clear
format compact

disp(' ')
disp(' ---- L, C, R ---- ')
L = 200e-3
C = 10e-6
R = 100

disp(' ')
disp(' ---- 固有角周波数 wn，減衰係数 zeta ---- ')
wn   = 1/(L*C)^(1/2)
zeta = (R/2)*sqrt(C/L)

disp(' ')
disp(' ---- ピーク角周波数 wp ---- ')
wp = wn*(1 - 2*zeta^2)^(1/2)

disp(' ')
disp(' ---- 共振ピーク Mp ---- ')
Mp = 1/(2*zeta*(- zeta^2 + 1)^(1/2))

