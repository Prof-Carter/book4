% sample_linmod_R2015a.m
% �u���b�N���}�̌���

[A B C D] = linmod('connect_fbk_R2015a');
sys = ss(A,B,C,D);
sys = tf(sys);

sysGyr = sys(1,1)
sysGyd = sys(1,2)
sysGer = sys(2,1)
sysGed = sys(2,2)