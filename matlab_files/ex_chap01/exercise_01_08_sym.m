% exercise_01_08.m
% 問題 1.8
% マス・ばね・ダンパ系の運動方程式（ラグランジュ法）

clear
format compact

syms M c k real
syms z dz ddz f real

q   = z;
dq  = dz;
ddq = ddz;
u   = f;
% ------------------------------------------
W = (1/2)*M*dq^2
V = (1/2)*k*q^2
D = (1/2)*c*dq^2

L = W - V
% ------------------------------------------
dLq  = diff(L,dq)
ddLq = diff(dLq,dq)*ddq + diff(dLq,q)*dq
eq   = ddLq - diff(L,q) + diff(D,dq) - f;
eq = simplify(eq')
