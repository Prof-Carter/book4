% example_02_08_sym.m
% —á 2.8
% ‹tƒ‰ƒvƒ‰ƒX•ÏŠ·
% ySymbolic Math Toolboxz

clear
format compact

syms s

disp(' ')
disp(' ***** —á 2.8 ********************')
fs = 2*(2*s + 1)/(s*(s + 1)*(s + 2))
ft = ilaplace(fs)

