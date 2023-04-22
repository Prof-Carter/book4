% example_03_01.m
% 例 3.1
% 簡略化したフルビッツの安定判別法

disp(' ')
disp(' ***** 例 3.1 ********************')

clear
format compact

sysP = tf([5],[1 3 7 5])
[numP denP] = tfdata(sysP,'v');
hurwitz