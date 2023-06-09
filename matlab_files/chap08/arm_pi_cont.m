% arm_pi_cont.m
% 鉛直面を回転するアームに対する PI 制御系設計（周波数領域での設計）

close all

clear
format compact

arm_para
s = tf('s');
sysP = 1/(J*s^2 + c*s + M*g*l);

txt = {'PI (kP = 5.75,  TI = 2)',...
       'PI (kP = 5.75,  TI = 0.75)',...
       'PI (kP = 5.75,  TI = 0.35)'};
           
for i = 1:3
    if i == 1
        kP = 5.75;  TI = 2;
        sty = '--';
    elseif i == 2
        kP = 5.75;  TI = 0.75;
        sty = '-';
    else
        kP = 5.75;  TI = 0.35;
        sty = '-.';
    end

    sysC = kP*(1 + 1/(TI*s));
    sysL = sysP*sysC;

    figure(i+10)
    margin(sysL)

    sysS = minreal(   1/(1 + sysL));
    sysT = minreal(sysL/(1 + sysL));

    w = logspace(-2,3,1000);
    [Gg_S Gp_S] = bode(sysS,w);
    Gg_S = Gg_S(:,:);
    [Gg_T Gp_T] = bode(sysT,w);
    Gg_T = Gg_T(:,:);
    figure(1)
	semilogx(w,20*log10(Gg_S),sty)
    hold on
    figure(2)
    semilogx(w,20*log10(Gg_T),sty)
    hold on

    t = 0:0.001:1.5;
    y = step(sysT,t);
    figure(3)
    plot(t,y,sty)
    hold on
end

figure(1)
hold off
ylim([-60 20])
xlabel('\omega [rad/s]')
ylabel('20log_{10}|S(j{\omega})| [dB]')
legend(txt,'Location','SouthEast')
grid on

figure(2)
hold off
ylim([-60 20])
xlabel('\omega [rad/s]')
ylabel('20log_{10}|T(j{\omega})| [dB]')
legend(txt,'Location','SouthWest')
grid on

figure(3)
hold off
ylim([0 1.5])
xlabel('t [s]')
ylabel('y(t) [rad]')
legend(txt,'Location','SouthEast')
grid on
    
    