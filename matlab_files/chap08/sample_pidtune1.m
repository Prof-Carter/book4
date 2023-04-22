% sample_pidtune1.m
% P ����̐݌v�FPID �p�����[�^�̎��������i�֐� pidtune �̎g�p��j

clear
format compact

sysP = tf([1],[1 1])^3;

opts = pidtuneOptions;
opts.PhaseMargin = 60;
[sysC info] = pidtune(sysP,'P',opts)

kP = sysC.Kp
wgc = info.CrossoverFrequency
Pm  = info.PhaseMargin

