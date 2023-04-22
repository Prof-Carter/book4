% sample_nyquist2_custom.m
% �x�N�g���O�Ղ̕`��i�֐� nyquist �̎g�p��j====> �O���X�̃J�X�^�}�C�Y

close all

clear
format compact

sysP = tf([10],[1 2 10]);

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' �x�N�g���O��';

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;
options.TickLabel.FontSize = 14;

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % �`��̈�̐ݒ�
nyquist(sysP,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')

xlim([-1 1.5])
set(gca,'XTick',-1:0.5:1.5)
ylim([-2 0.5])
set(gca,'YTick',-2:0.5:0.5)

hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off

h = findall(gcf,'String','����');       % ������ "����" ������
set(h,'position',[-29.4000 158 0])      % �ʒu(Position)��ύX

