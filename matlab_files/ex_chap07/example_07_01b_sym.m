% example_07_01b_sym.m
% ó· 7.1
% é¸îgêîâûìö
% ÅySymbolic Math ToolboxÅz

clear
format compact

syms s
syms t real
syms A real
syms w positive

disp(' ')
disp(' ***** ó· 7.1 ***************************')

disp(' ')
disp(' ---- u(t) ---- ')
ut = A*sin(w*t)

disp(' ')
disp(' ---- u(s) ---- ')
us = laplace(ut)

disp(' ')
disp(' ---- P(s) ---- ')
P = 1/(s + 1)

disp(' ')
disp(' ---- y(s) ---- ')
ys = P*us

disp(' ')
disp(' ---- y(s) ---- ')
ys_part = partfrac(ys,s,'FactorMode','full');
[num den] = numden(ys_part);

ys = num/den

factor_den = factor(den);

n = length(factor_den);
for i = 1:n
    p(i) = solve(factor_den(i),s);
    k(i) = subs(factor_den(i)*ys,s,p(i));
    k(i) = simplify(k(i));
end

k = simplify(real(k) + imag(k)*1i)

for i = 1:n
    disp(' ')
    disp('++++++++++++++++++++++++++')
    fprintf('p%d, k%d\n',i,i)
    p(i)
    k(i)
end

disp(' ')
disp(' ---- y_app(t) ---- ')

yt_app = k(1)*exp(p(1)*t) + k(2)*exp(p(2)*t);
yt_app = simplify(rewrite(yt_app,'sincos'))

disp(' ')
disp(' ---- y(t) ---- ')
yt = yt_app + k(3)*exp(p(3)*t)


