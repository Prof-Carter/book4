% sample_isstable2.m
% ��� 3.3 (2)�F���萫�̔��ʁi�֐� isstable �̎g�p��j

clear
format compact

sysP = tf([1 3 2],[1 4 11 14 10])
isstable(sysP)