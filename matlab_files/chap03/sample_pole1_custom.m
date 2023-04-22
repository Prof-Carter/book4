% sample_pole1_custom.m
% ��� 3.3 (1)�F�`�B�֐��̋Ɂi�֐� pole �̎g�p��j====> �O���X�̃J�X�^�}�C�Y

close all

clear
format compact

sysP = tf([1 10],[1 2 3 10])
pole(sysP)

t = 0:0.001:10;
options = timeoptions;

options.Title.FontSize  = 16;
options.XLabel.FontSize = 16;
options.YLabel.FontSize = 16;
options.TickLabel.FontSize = 14;
options.Title.String = '�X�e�b�v����';

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % �`��̈�̐ݒ�
step(sysP,t,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')
