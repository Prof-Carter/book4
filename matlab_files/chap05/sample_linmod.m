% sample_linmod.m
% �u���b�N���}�̌����i�֐� linmod �̎g�p��j

[A B C D] = linmod('connect_fbk');
sys = ss(A,B,C,D);
sys = tf(sys);

sysGyr = sys(1,1)
sysGyd = sys(1,2)
sysGer = sys(2,1)
sysGed = sys(2,2)