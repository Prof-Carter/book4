% sample_bode3_custom.m
% ���g���̈���w�肵���{�[�h�����̌v�Z�ƕ`��i�֐� bode �̎g�p��j

close all

clear
format compact

sysP = tf([10],[1 2 10]);

w = logspace(-1,2,10000);
[Gg Gp] = bode(sysP,w);
Gg = Gg(:,:);
Gp = Gp(:,:);

figure(1)
subplot('Position',[0.15 0.15 0.8 0.8])             % �`��̈�̐ݒ�
semilogx(w,20*log10(Gg),'LineWidth',1.5)
ylim([-60 10])
set(gca,'ytick',-60:10:10)
set(gca,'FontSize',14,'FontName','Arial')
xlabel('\omega [rad/s]','FontSize',16,'FontName','Arial')
ylabel('Gain [dB]','FontSize',16,'FontName','Arial')
grid on

figure(2)
subplot('Position',[0.15 0.15 0.8 0.8])             % �`��̈�̐ݒ�
semilogx(w,Gp,'LineWidth',1.5)
ylim([-180 0])
set(gca,'ytick',-180:30:0)
set(gca,'FontSize',14,'FontName','Arial')
xlabel('\omega [rad/s]','FontSize',16,'FontName','Arial')
ylabel('Phase [deg]','FontSize',16,'FontName','Arial')
grid on


