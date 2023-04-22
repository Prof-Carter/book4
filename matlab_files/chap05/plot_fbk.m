% plot_fbk.m
% ñ⁄ïWílâûìöÇ∆äOóêâûìö

close all

clear
format compact

sysP = tf([5],[1 2 2]);

t = 0:0.001:8;

line_type = char('--','-.','-');
n = 0;

kP = 1;
for kI = 0:0.5:1
    n = n + 1;

    sysC = tf([kP kI],[1 0]);

    sysGyr = minreal(sysP*sysC/(1 + sysP*sysC));
    sysGyd = minreal( sysP/(1 + sysP*sysC));

    yr = step(sysGyr,t);
    yd = step(sysGyd,t);

    figure(1)
    plot(t,yr,line_type(n,:))
    hold on

    figure(2)
    plot(t,yd,line_type(n,:))
    hold on
end

yaxis_label = char('{y}_{r}(t)','{y}_{d}(t)');
for i = 1:2
    figure(i)
    hold off
    xlabel('t [s]')
    ylabel(yaxis_label(i,:))
    legend({'{k}_{I}=0','{k}_{I}=0.5','{k}_{I}=1'},'NumColumns',3)
    grid on
end
