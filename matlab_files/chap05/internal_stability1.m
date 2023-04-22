% internal_stability1.m
% �������萫�̔��ʁi�֐� tfdata, conv, roots �̎g�p��j

clear
format compact

sysP = tf([1],[1 -1]);
sysC = tf([2 1],[1 0]);

[numP denP] = tfdata(sysP,'v');
[numC denC] = tfdata(sysC,'v');

Delta = conv(denP,denC) + conv(numP,numC);
sysDelta = tf(Delta,[1])
roots(Delta)

