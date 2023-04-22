% sample_residue_custom.m
% �������������i�֐� residue �̎g�p��j====> �O���X�̃J�X�^�}�C�Y

close all

clear
format compact

num = [4 5];
den = [1 3 2];
[k p] = residue(num,den)

t = 0:0.001:10;
y = k(1)*exp(p(1)*t) + k(2)*exp(p(2)*t);

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % �`��̈�̐ݒ�

plot(t,y,'LineWidth',1.5)                           % ���̑����F1.5 �|�C���g
set(gca,'XTick',0:1:10)                             % �����̖ڐ���
set(gca,'FontSize',14,'FontName','Arial')           % �t�H���g�T�C�Y�F14 �|�C���g�C�t�H���g�GArial
xlabel('t [s]','FontSize',16,'FontName','Arial')    % �����̃��x���i�t�H���g�T�C�Y�F16 �|�C���g�C�t�H���g�FArial�j
ylabel('y(t)','FontSize',16,'FontName','Arial')     % �c���̃��x���i�t�H���g�T�C�Y�F16 �|�C���g�C�t�H���g�FArial�j
grid on                                             % �⏕��
