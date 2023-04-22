% sample_impulse3.m
% ���Ԏw�肵���C���p���X�����̌v�Z�ƕ`��i�֐� impulse �̎g�p��j====> �O���X�̃J�X�^�}�C�Y

close all

clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;
y = impulse(sysP,t);

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % �`��̈�̐ݒ�
plot(t,y,'LineWidth',1.5)

set(gca,'FontSize',14,'FontName','Arial')
set(gca,'XTick',0:1:5)
set(gca,'YTick',-1:0.5:2.5)
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('y(t)','FontSize',16,'FontName','Arial')
grid on
