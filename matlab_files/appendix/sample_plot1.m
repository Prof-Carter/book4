% sample_plot1.m
% ƒOƒ‰ƒt‚Ì•`‰æ

close all

clear
format compact

x = -4:0.001:4;
y1 = (x + 3).*(x - 1);
y2 = - 2*(x + 2).*(x - 3);

figure(1)
plot(x,y1)
hold on
plot(x,y2,'--')
plot([-3 1],[0 0],'o')
plot([-2 3],[0 0],'o')
hold off

xlabel('x')
ylabel('y')

legend('f(x)','g(x)')

