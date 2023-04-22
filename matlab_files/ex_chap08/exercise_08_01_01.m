% exercise_08_01_01.m
% 問題 8.1 (1)
% ナイキスト軌跡

close all

clear
format compact

s = tf('s');
sysP = 1/((s + 1)^2*(s + 2))

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' ベクトル軌跡';

options.Title.FontSize  = 14;
options.XLabel.FontSize = 14;
options.YLabel.FontSize = 14;
options.TickLabel.FontSize = 12;

num = 0;
for kP = 14:4:22
    num = num + 1;
    
    sysC = kP
    sysL = sysP*sysC
    
    for i = 1:2
        figure(i)
        nyquist(sysL,options)

        hold on
    end
    
    txt(num) = {strcat('${k}\sb{\rm P} = ',num2str(kP),'$')};
end

for i = 1:2
    figure(i)
    plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
    hold off

    set(gca,'FontName','Arial')

    legend(txt)
    set(legend,'Interpreter','latex','FontSize',14)

    h2 = findobj(gcf,'type','Line');
    set(h2,'LineWidth',1.5)
end

figure(1)
movegui('north')

set(legend,'Location','NorthEast')
xlim([-4 12])
ylim([-8 4])

figure(2)
movegui('south')

set(legend,'Location','SouthEast')
xlim([-3 1])
ylim([-3 1])




