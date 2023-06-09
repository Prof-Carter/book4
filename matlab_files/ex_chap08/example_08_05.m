% example_08_05.m
% �� 8.5
% �x�N�g���O��

close all

clear
format compact

s = tf('s');
sysP = 1/(s*(s + 1))
sysC = 1/(2*s + 1)
sysL = sysP*sysC

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' �x�N�g���O��';

options.Title.FontSize  = 14;
options.XLabel.FontSize = 14;
options.YLabel.FontSize = 14;
options.TickLabel.FontSize = 12;

figure(1)
nyquist(sysL,options)
hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off

set(gca,'FontName','Arial')

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

xlim([-4 1])
ylim([-10 2])



