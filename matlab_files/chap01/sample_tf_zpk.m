% �`�B�֐��̌`���̕ϊ��i�֐� tf, zpk �̎g�p��j

clear
format compact

sysP1 = tf([4 8],[1 2 -15 0])
sysP2 = zpk(sysP1)
sysP3 = tf(sysP2)