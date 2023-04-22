% sample_step3.m
% 時間指定した単位ステップ応答の計算と描画（関数 step の使用例）

close all

clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;
y = step(sysP,t);

figure(1)
plot(t,y)
xlabel('t [s]')
ylabel('y(t)')
grid on