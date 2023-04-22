% sample_lsim2.m
% ”CˆÓ‚ÌŠÔ‰“š‚ÌŒvZ‚Æ•`‰æiŠÖ” lsim ‚Ìg—p—áj

close all

clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;

for i = 1:2
    if i == 1
        u = t;
    else
        u = sin(5*t);
    end
    y = lsim(sysP,u,t);

    figure(i)
    subplot('Position',[0.15 0.15 0.8 0.8])             % •`‰æ—Ìˆæ‚Ìİ’è
    plot(t,y,'LineWidth',1.5)
    hold on
    plot(t,u,'--','LineWidth',1.5)
    hold off

    set(gca,'FontSize',14,'FontName','Arial')
    
    if i == 1
        set(gca,'XTick',0:1:5)
        set(gca,'YTick',0:1:5)     
    else
        set(gca,'XTick',0:1:5)
        set(gca,'YTick',-1:0.2:1)   
    end

    xlabel('t [s]','FontSize',16,'FontName','Arial')
    ylabel('y(t) and u(t)','FontSize',16,'FontName','Arial')
    grid on
    legend('y(t)','u(t)')
    legend('Location','SouthEast')
    set(legend,'FontSize',16,'FontName','Arial')
end

