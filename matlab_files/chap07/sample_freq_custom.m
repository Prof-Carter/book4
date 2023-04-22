% sample_freq_custom.m
% 周波数応答の描画 ====> グラスのカスタマイズ

close all

clear
format compact

sysP = tf([10],[1 2 10]);

w = 5;  A = 1;
[Gg Gp] = bode(sysP,w);
Gg = Gg(:,:)
Gp = Gp(:,:)
Gp = pi/180*Gp;

t = 0:0.001:5;
u = A*sin(w*t);
y = lsim(sysP,u,t);
yapp = A*Gg*sin(w*t + Gp);

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])
plot(t,y,'-.',t,u,'--',t,yapp,'LineWidth',1.5)

set(gca,'XTick',0:0.5:5)
set(gca,'YTick',-1:0.2:1)
set(gca,'FontSize',14,'FontName','Arial')
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('y(t), u(t) and {y}_{app}(t)','FontSize',16,'FontName','Arial')

grid on

legend({'y(t)','u(t)','{y}_{app}(t)'},'NumColumns',3);
legend('Location','SouthEast')
set(legend,'FontSize',16,'FontName','Arial')

