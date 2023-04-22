% example_02_07.m
% —á 2.7
% ‹tƒ‰ƒvƒ‰ƒX•ÏŠ·
% ySymbolic Math Toolboxz

clear
format compact

syms s

disp(' ')
disp(' ***** —á 2.7 ********************')
fs = 1/s + 2/(s + 1) - 3/(s + 2)
ft = ilaplace(fs)




