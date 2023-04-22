% example_04_03.m
% 例 4.3
% マス・ばね・ダンパ系の単位ステップ応答

close all

clear
format compact

t = 0:0.001:10;

% -------------------------------------------------------
c = 1;
k = 1;
num = 0;
for M = 0.25:0.25:1.5
    num = num + 1;
    
    sysP = tf(1,[M c k]);
    
    y = step(sysP,t);
    
    figure(1)
    plot(t,y,'LineWidth',1.5)
    hold on
    
    txt(num) = {strcat('$M = ',num2str(M),'$')};
end

ylim([0 1.5])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 4.12 ($c = 1$, $k = 1$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend(txt)
set(legend,'Location','SouthEast','NumColumns',2)
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('northwest')

% -------------------------------------------------------
M = 1;
k = 1;
num = 0;
for c = 0.5:0.5:2.5
    num = num + 1;
    
    sysP = tf(1,[M c k]);
    
    y = step(sysP,t);
    
    figure(2)
    plot(t,y,'LineWidth',1.5)
    hold on
    
    txt(num) = {strcat('$c = ',num2str(c),'$')};
end

ylim([0 1.5])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 4.13 ($M = 1$, $k = 1$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend(txt)
set(legend,'Location','SouthEast','NumColumns',2)
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('north')

% -------------------------------------------------------
M = 1;
c = 1.5;
num = 0;
for k = 0.75:0.25:1.75
    num = num + 1;
    
    sysP = tf(1,[M c k]);
    
    y = step(sysP,t);
    
    figure(3)
    plot(t,y,'LineWidth',1.5)
    hold on
    
    txt(num) = {strcat('$k = ',num2str(k),'$')};
end

ylim([0 1.5])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 4.14 ($M = 1$, $c = 1.5$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend(txt)
set(legend,'Location','SouthEast','NumColumns',2)
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('southwest')

% -------------------------------------------------------
M = 1;
c = 1.5;
num = 0;
for k = 0.75:0.25:1.75
    num = num + 1;
    
    sysP = tf(1,[M c k])*k;
    
    y = step(sysP,t);
    
    figure(4)
    plot(t,y,'LineWidth',1.5)
    hold on
    
    txt(num) = {strcat('$k = ',num2str(k),'$')};
end

ylim([0 1.5])

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 4.14 ($M = 1$, $c = 1.5$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)/K$','Interpreter','latex','FontSize',14)

legend(txt)
set(legend,'Location','SouthEast','NumColumns',2)
set(legend,'Interpreter','latex','FontSize',14)

grid on

movegui('south')



