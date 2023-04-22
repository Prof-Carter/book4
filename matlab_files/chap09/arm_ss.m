% arm_ss.m
% 鉛直面を回転するアームの状態空間表現（関数 ss の使用例）

clear
format compact

arm_para

A = [    0       1
     -M*g*l/J  -c/J ];
B = [ 0
     1/J ];
C = [ 1  0 ];
D = 0;

sys = ss(A,B,C,D)

