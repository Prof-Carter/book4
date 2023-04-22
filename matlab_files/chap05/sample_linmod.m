% sample_linmod.m
% ブロック線図の結合（関数 linmod の使用例）

[A B C D] = linmod('connect_fbk');
sys = ss(A,B,C,D);
sys = tf(sys);

sysGyr = sys(1,1)
sysGyd = sys(1,2)
sysGer = sys(2,1)
sysGed = sys(2,2)