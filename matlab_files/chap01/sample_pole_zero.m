% �`�B�֐��̋ɁC��_�i�֐� pole, zero, tzero �̎g�p��j

clear
format compact

sysP = tf([4 8],[1 2 -15 0])
pole(sysP)
zero(sysP)
tzero(sysP)