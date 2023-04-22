% sample_pidtune2.m
% P 制御の設計：PID パラメータの自動調整（関数 pidtune の使用例）

clear
format compact

sysP = tf([1],[1 1])^3;

opts = pidtuneOptions;
opts.CrossoverFrequency = 1;
[sysC info] = pidtune(sysP,'P',opts)

kP = sysC.Kp
wgc = info.CrossoverFrequency
Pm  = info.PhaseMargin

