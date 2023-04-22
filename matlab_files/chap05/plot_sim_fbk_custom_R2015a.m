% plot_sim_fbk_R2015a_custom.m
% Simulink ���p�����t�@�[�h�o�b�N����̃V�~�����[�V���� ====> �O���X�̃J�X�^�}�C�Y

close all

clear
format compact

sim('sim_fbk_R2015a')

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % �`��̈�̐ݒ�
plot(t,y,'LineWidth',1.5)
xlim([0 16])
ylim([0 1.8])
set(gca,'XTick',0:2:16)
set(gca,'YTick',0:0.2:1.8)
set(gca,'FontSize',14,'FontName','Arial')
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('y(t)','FontSize',16,'FontName','Arial')
grid on

figure(2)
subplot('Position',[0.15 0.15 0.8 0.8])             % �`��̈�̐ݒ�
plot(t,e,'LineWidth',1.5)
xlim([0 16])
ylim([-0.8 1])
set(gca,'XTick',0:2:16)
set(gca,'YTick',-0.8:0.2:1)
set(gca,'FontSize',14,'FontName','Arial')
xlabel('t [s]','FontSize',16,'FontName','Arial')
ylabel('e(t)','FontSize',16,'FontName','Arial')
grid on