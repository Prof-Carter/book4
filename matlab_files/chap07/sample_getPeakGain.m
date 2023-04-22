% sample_getPeakGain.m
% �s�[�N�p���g���Ƌ��U�s�[�N�i�֐� getPeakGain �̎g�p��j

clear
format compact

zeta = 0.5; wn = 1; K = 1;
sysP = tf([K*wn^2],[1 2*zeta*wn wn^2]);

[Mp wp] = getPeakGain(sysP,1e-5)

% ��͓I�ɓ����錋�ʁF(7.64), (7.65) �� (p.156)
Mp = 1/(2*zeta*sqrt(1 - zeta^2))
wp = wn*sqrt(1 - 2*zeta^2)