% sample_decomposition.m
% 部分分数分解：ヘビサイドの公式（関数 subs の使用例）

clear
format compact

syms s

fs = (4*s + 2)/(s^3 + 3*s^2 + 2*s)
fs = prod(factor(fs))

k1 = subs(collect( s*fs),s, 0)
k2 = subs(collect((s + 1)*fs),s,-1)
k3 = subs(collect((s + 2)*fs),s,-2)

