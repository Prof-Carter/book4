% �`�B�֐��̗�_�C�ɁC�Q�C���̒��o�i�֐� zpkdata �̎g�p��j

clear
format compact

sysP = tf([4 8],[1 2 -15 0])
[z p K] = zpkdata(sysP,'v')