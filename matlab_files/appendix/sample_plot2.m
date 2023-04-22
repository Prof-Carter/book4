% sample_plot2.m
% グラフの描画とカスタマイズ

close all

clear
format compact

x = -4:0.001:4;
y1 = (x + 3).*(x - 1);
y2 = - 2*(x + 2).*(x - 3);

figure(1)
plot(x,y1,     'LineWidth',2,'Color',[192  80  77]/255)
hold on
plot(x,y2,'--','LineWidth',2,'Color',[ 79 129 189]/255)
plot([-3 1],[0 0],'o','LineWidth',2,'MarkerSize',10,'Color',[192  80  77]/255)
plot([-2 3],[0 0],'o','LineWidth',2,'MarkerSize',10,'Color',[ 79 129 189]/255)
hold off
set(gca,'FontSize',14,'FontName','Arial')

xlim([-3.5 3.5])
ylim([-20 15])
set(gca,'XTick',-3.5:0.5:3.5)
set(gca,'YTick',-20:5:15)

xlabel('x','FontSize',16,'FontName','Arial')
ylabel('y','FontSize',16,'FontName','Arial')

legend('f(x)','g(x)')
legend('Location','NorthWest')
set(legend,'FontSize',16,'FontName','Arial')

grid on
