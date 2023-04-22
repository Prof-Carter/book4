% sample_stepinfo2.m
% �� 3.3�F�P�ʃX�e�b�v�����̉ߓn�����̎w�W�i�֐� stepinfo �̎g�p��j

clear
format compact

sysP = tf([10],[1 2 10])
[numP denP] = tfdata(sysP,'v')
yinf = numP(end)/denP(end)
t = 0:0.001:5;
y = step(sysP,t);
S = stepinfo(y,t,yinf)