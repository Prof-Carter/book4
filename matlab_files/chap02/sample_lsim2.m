% sample_lsim2.m
% �C�ӂ̎��ԉ����̌v�Z�ƕ`��i�֐� lsim �̎g�p��j

close all

clear
format compact

sysP = tf([10],[1 2 10]);

t = 0:0.001:5;

for i = 1:2
    if i == 1
        u = t;
    else
        u = sin(5*t);
    end
    y = lsim(sysP,u,t);

    figure(i)
    plot(t,y,t,u,'--')
    xlabel('t [s]')
    ylabel('y(t) and u(t)')
    grid on
    legend('y(t)','u(t)')
    legend('Location','SouthEast')
end