% sample_freq.m
% 周波数応答の描画（関数 bode, lsim の使用例）

close all

clear
format compact

sysP = tf([10],[1 2 10]);

w = 5; A = 1;
[Gg Gp] = bode(sysP,w);
Gg = Gg(:,:)
Gp = Gp(:,:)
Gp = pi/180*Gp;

t = 0:0.001:5;
u = A*sin(w*t);
y = lsim(sysP,u,t);
yapp = A*Gg*sin(w*t + Gp);

figure(1)
plot(t,y,'-.',t,u,'--',t,yapp)
xlabel('t [s]')
ylabel('y(t), u(t) and {y}_{app}(t)')
grid on
legend({'y(t)','u(t)','{y}_{app}(t)'},'NumColumns',3);
legend('Location','SouthEast')

