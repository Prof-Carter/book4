% step_2nd_zeta.m
% 2 ���x��n�̒P�ʃX�e�b�v����
% �c�c �Q�C���� K = 1�C�ŗL�p���g���� wn = 1 �ɌŒ肵�C
%      �����W���� zeta = 0.1, 0.2, ..., 0.9 �̂悤�ɕω�

close all

clear
format compact

t = 0:0.001:10;

K = 1;
yinf = K;

wn = 1;
for zeta = 0.1:0.1:0.9
    sysP = tf([K*wn^2],[1 2*zeta*wn wn^2]);
    y = step(sysP,t);

    figure(1)
    plot(t,y)
    hold on

    S = stepinfo(y,t,yinf);
    Tp = S.PeakTime;
    Amax = S.Overshoot;
    fprintf('zeta = %2.1f, ',zeta)
    fprintf( 'wn = %2.1f, ',wn)
    fprintf( 'Tp = %4.3e, ',Tp)
    fprintf('Amax = %4.3eY=n',Amax)
end

figure(1)
ylim([0 2])
xlabel('t [s]')
ylabel('y(t)')
hold off
grid on

