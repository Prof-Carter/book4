% step_1st_K.m
% 1 次遅れ系の単位ステップ応答
% …… 時定数を T = 1 に固定し，ゲインを K = 0.5, 1, 1.5, 2 のように変化

close all

clear
format compact

t = 0:0.001:5;

T = 1;
for K = 0.5:0.5:2
    sysP = tf([K],[T 1]);
    y = step(sysP,t);

    figure(1)
    plot(t,y)
    hold on
    plot(T,0.632*K,'ko')
    plot([0 5],0.632*K*[1 1],'k:')
end

figure(1)
plot(T*[1 1],K*[0 1],'k:')

xlabel('t [s]')
ylabel('y(t)')
hold off