% sample_isstable1.m
% ��� 3.3 (1)�F���萫�̔��ʁi�֐� isstable �̎g�p��j

clear
format compact

sysP = tf([1 10],[1 2 3 10])
isstable(sysP)
