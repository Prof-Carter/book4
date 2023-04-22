% example_03_05.m
% 例 3.5
% 零点を持つシステムの過渡特性

close all

clear
format compact

s = tf('s');
t = 0:0.001:5;

yinf = 1;

for k = -1:3
    sysP = (k*s + 2)/((s + 1)*(s + 2));
    y = step(sysP,t);

    figure(1)
    plot(t,y,'LineWidth',1.5)
    hold on
end   
for k = -1:3 
    sysP = (k*s + 2)/((s + 1)*(s + 2));
    y = step(sysP,t);
    
    figure(1)  
    if max(y) > yinf
        [ymax i] = max(y);
        Tp = t(i);
        plot(Tp,ymax,'k.','MarkerSize',25)
        hold on
    end
    if min(y) < 0
        [ymin i] = min(y);
        Tp = t(i);
        plot(Tp,ymin,'k.','MarkerSize',25)
        hold on        
    end
end
hold off   

ylim([-0.25 1.25])
set(gca,'YTick',-0.25:0.25:1.25)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 3.8','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

grid on

legend('$k = -1$', ...
       '$k = 0$', ...
       '$k = 1$', ...
       '$k = 2$', ...
       '$k = 3$')
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)
   