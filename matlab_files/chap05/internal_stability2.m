% internal_stability2.m
% �������萫�̔��ʁi�֐� zero �̎g�p��j

clear
format compact

sysP = tf([1],[1 -1]);
sysC = tf([2 1],[1 0]);

zero(1 + sysP*sysC)

