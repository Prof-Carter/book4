% sample_lsim1.m
% �C�ӂ̎��ԉ����̕`��i�֐� lsim �̎g�p��j

close all

clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;

u = t;
figure(1)
lsim(sysP,u,t)

u = sin(5*t);
figure(2)
lsim(sysP,u,t)
