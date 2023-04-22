% sample_impulse1.m
% �C���p���X�����̕`��i�֐� impulse �̎g�p��j====> �O���X�̃J�X�^�}�C�Y

close all

clear
format compact

sysP = tf([10],[1 2 10]);

options = timeoptions;

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;
options.TickLabel.FontSize = 14;
options.Title.String = '�C���p���X����';

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % �`��̈�̐ݒ�
impulse(sysP,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')
