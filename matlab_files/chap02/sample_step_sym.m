% sample_step_sym.m
% 単位ステップ応答の計算と描画（関数 laplace, ilaplace, fplot の使用例）

close all

clear
format compact

syms s
syms t real

ut = sym(1)
us = laplace(ut)

Ps = 10/(s^2 + 2*s + 10);

ys = Ps*us
yt = ilaplace(ys)

figure(1)
fplot(yt,[0 5])
xlabel('t [s]')
ylabel('y(t)')
grid on
