% plot_fbk_custom.m
% 目標値応答と外乱応答 ====> グラスのカスタマイズ

close all

clear
format compact

sysP = tf([5],[1 2 2]);

t = 0:0.001:8;

line_type = char('--','-.','-');
n = 0;

kP = 1;
for kI = 0:0.5:1
    n = n + 1;
    
    sysC = tf([kP kI],[1 0]);

    sysGyr = minreal(sysP*sysC/(1 + sysP*sysC));
    sysGyd = minreal(     sysP/(1 + sysP*sysC));

    yr = step(sysGyr,t);
    yd = step(sysGyd,t);

    figure(1)
    subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
    plot(t,yr,line_type(n,:),'LineWidth',1.5)
    hold on

    figure(2)
    subplot('Position',[0.15 0.15 0.8 0.8])             % 描画領域の設定
    plot(t,yd,line_type(n,:),'LineWidth',1.5)
    hold on
end

figure(1)
set(gca,'FontSize',14,'FontName','Arial')
hold off   
ylim([0 1.4])
set(gca,'XTick',0:1:8)
set(gca,'YTick',0:0.2:1.4)
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('{y}_{r}(t)','FontSize',16,'FontName','Arial')
legend({'{k}_{I}=0','{k}_{I}=0.5','{k}_{I}=1'},'NumColumns',3)
set(legend,'FontSize',16,'FontName','Arial')
grid on

figure(2)
set(gca,'FontSize',14,'FontName','Arial')
hold off   
ylim([-0.2 1])
set(gca,'XTick',0:1:8)
set(gca,'YTick',-0.2:0.2:1)
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('{y}_{d}(t)','FontSize',16,'FontName','Arial')
legend({'{k}_{I}=0','{k}_{I}=0.5','{k}_{I}=1'},'NumColumns',3)
set(legend,'FontSize',16,'FontName','Arial')
grid on
