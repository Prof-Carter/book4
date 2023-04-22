% plot_data.m
% ƒmƒCƒYœ‹

close all

clear
format compact

sim('sim_noise_reduction')

figure(1)
plot(t,y)
ylabel('y(t)')

figure(2)
plot(t,n)
ylabel('n(t)')

figure(3)
plot(t,y+n)

ylabel('y(t) + n(t)')

figure(4)
plot(t,yf)
ylabel('{y}_{f}(t)')

for i = 1:4
    figure(i)
    ylim([-1.5 1.5])
    xlabel('t [s]')
    grid on
end


