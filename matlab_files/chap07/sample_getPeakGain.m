% sample_getPeakGain.m
% ピーク角周波数と共振ピーク（関数 getPeakGain の使用例）

clear
format compact

zeta = 0.5; wn = 1; K = 1;
sysP = tf([K*wn^2],[1 2*zeta*wn wn^2]);

[Mp wp] = getPeakGain(sysP,1e-5)

% 解析的に得られる結果：(7.64), (7.65) 式 (p.156)
Mp = 1/(2*zeta*sqrt(1 - zeta^2))
wp = wn*sqrt(1 - 2*zeta^2)