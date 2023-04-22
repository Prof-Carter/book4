% example_01_07.m
% 例 1.7
% 鉛直面を回転するアーム系の運動方程式（ラグランジュ法）

clear
format compact

syms M g l Jg c real
syms th dth ddth tau real

q   = th;
dq  = dth;
ddq = ddth;
u   = tau;
% ------------------------------------------
xg = - l*sin(q)
yg = - l*cos(q)

dxg = diff(xg,q)*dq
dyg = diff(yg,q)*dq
% ------------------------------------------
W = (1/2)*M*dxg^2 + (1/2)*M*dyg^2 + (1/2)*Jg*dq^2
V = M*g*yg
D = (1/2)*c*dq^2

L = W - V
% ------------------------------------------
dLq  = diff(L,dq)
ddLq = diff(dLq,dq)*ddq + diff(dLq,q)*dq
eq   = ddLq - diff(L,q) + diff(D,dq) - u;
eq = simplify(eq')
