% plot_data_custom_R2015a.m
% ÉmÉCÉYèúãé

close all

clear
format compact

sim('sim_noise_reduction_R2015a')

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])
plot(t,y,'LineWidth',1.5)
ylabel('y(t)','FontSize',16,'FontName','Arial')

figure(2)
subplot('Position',[0.15 0.15 0.8 0.8])
plot(t,n,'LineWidth',1.5)
ylabel('n(t)','FontSize',16,'FontName','Arial')

figure(3)
subplot('Position',[0.15 0.15 0.8 0.8])
plot(t,y+n,'LineWidth',1.5)
ylabel('y(t) + n(t)','FontSize',16,'FontName','Arial')

figure(4)
subplot('Position',[0.15 0.15 0.8 0.8])
plot(t,yf,'LineWidth',1.5)
ylabel('{y}_{f}(t)','FontSize',16,'FontName','Arial')

for i = 1:4
    figure(i)
    set(gca,'FontSize',14,'FontName','Arial')
    set(gca,'XTick',0:1:10)
    ylim([-1.5 1.5]) 
    set(gca,'YTick',-1.5:0.5:1.5)
    xlabel('t [s]','FontSize',16,'FontName','Arial')
    grid on
end

