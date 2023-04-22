% step_1st_T.m
% 1 ���x��n�̒P�ʃX�e�b�v����
% �c�c �Q�C���� K = 1 �ɌŒ肵�C���萔�� T = 0.5, 1, 1.5, 2 �̂悤�ɕω�

close all

clear
format compact

t = 0:0.001:5;

K = 1;
for T = 0.5:0.5:2
    sysP = tf([K],[T 1]);
    y = step(sysP,t);

    figure(1)
    plot(t,y)
    hold on
    plot(T,0.632*K,'ko')
    plot(T*[1 1],K*[0 1],'k:')
end

figure(1)
plot([0 5],0.632*K*[1 1],'k:')

xlabel('t [s]')
ylabel('y(t)')
hold off