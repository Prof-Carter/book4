% sample_stepinfo1.m
% �� 3.3�F�P�ʃX�e�b�v�����̉ߓn�����̎w�W�i�֐� stepinfo �̎g�p��j

clear
format compact

sysP = tf([10],[1 2 10])
S = stepinfo(sysP)