% sample_residue_custom.m
% 部分分数分解（関数 residue の使用例）

close all

clear
format compact

num = [4 5];
den = [1 3 2];
[k p] = residue(num,den)

t = 0:0.001:10;
y = k(1)*exp(p(1)*t) + k(2)*exp(p(2)*t);

figure(1)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')
grid on