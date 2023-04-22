% example_09_03_sym.m
% —á 9.3
% ‰Â§Œä•W€Œ`
% ySymbolic Math Toolboxz

clear
format compact

disp(' ')
disp(' ***** —á 9.3 ********************')

syms a1 a0 real
syms b1 b0 real
syms s

disp(' ')
disp(' ---- P(s) ---- ')
Ps = (b1*s + b0)/(s^2 + a1*s + a0);
Ps = collect(Ps,s)

disp(' ')
disp(' ---- P(s) = N(s)/D(s) ---- ')
[Ns Ds] = numden(Ps)

disp(' ')
disp(' ---- N(s) ‚ÌŒW” ---- ')
numP = fliplr(coeffs(Ns,s))

disp(' ')
disp(' ---- D(s) ‚ÌŒW” ---- ')
denP = fliplr(coeffs(Ds,s))

[Ac Bc Cc] = ss_ctrb_sym(numP,denP)

disp(' ')
disp(' ---- a1 = c/J, a0 = M*g*l/J, b1 = 0, b0 = 1/J ‚Ì‚Æ‚« ---- ')

syms J c M g l positive

Ac_arm = subs(Ac,{a1,a0,b1,b0},{c/J,M*g*l/J,0,1/J})
Bc_arm = subs(Bc,{a1,a0,b1,b0},{c/J,M*g*l/J,0,1/J})
Cc_arm = subs(Cc,{a1,a0,b1,b0},{c/J,M*g*l/J,0,1/J})


