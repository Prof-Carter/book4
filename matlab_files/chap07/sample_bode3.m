% sample_bode3.m
% 周波数領域を指定したボード応答の計算と描画（関数 bode の使用例）

close all

clear
format compact

sysP = tf([10],[1 2 10]);

w = logspace(-1,2,10000);

[Gg Gp] = bode(sysP,w);
Gg = Gg(:,:);
Gp = Gp(:,:);

figure(1)
semilogx(w,20*log10(Gg))
xlabel('\omega [rad/s]')
ylabel('Gain [dB]')
grid on

figure(2)
semilogx(w,Gp)
set(gca,'YTick',-180:30:0)
xlabel('\omega [rad/s]')
ylabel('Phase [deg]')
grid on

