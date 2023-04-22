% exercise_09_02.m
% 問題 9.2
% 伝達関数表現から状態空間表現（可制御標準形，可観測標準形）への変換

clear
format compact

s = tf('s');

disp(' ')
disp(' ***** 問題 9.2 ********************')

sysP = (5*s + 6)/(s^3 + 2*s^2 + 3*s + 4)

[numP denP] = tfdata(sysP,'v')

[Ac Bc Cc] = ss_ctrb(numP,denP)
[Ao Bo Co] = ss_obsv(numP,denP)

