% exercise_07_05.m
% ñ‚ëË 7.5
% ÉxÉNÉgÉããOê’ÇÃï`âÊ

close all

clear
format compact

% -------------------------------------------------------
disp(' ')
disp(' ***** ñ‚ëË 7.5 (1) ********************')
disp(' ***** L = 1 ÇÃÇ∆Ç´ ********************')

L = 1;

s = tf('s');
sysP = exp(-L*s)

options = nyquistoptions;
options.ShowFullContour = 'off';

w = logspace(-2,1,100000);

[xx yy] = nyquist(sysP,w,options);
xx = xx(:,:);
yy = yy(:,:);

figure(1)
movegui('north')

plot(xx,yy,'LineWidth',1.5)

num = 0;
for w = [0 pi/2 pi 3*pi/2]    
    num = num + 1;
    [xx yy] = nyquist(sysP,w,options);
    xx = xx(:,:);
    yy = yy(:,:);
    figure(1)
    hold on
    p1(num) = plot(xx,yy,'.','MarkerSize',25);
    hold off
end

set(gca,'FontSize',12,'FontName','Arial')

xlim([-1.2 1.2])
ylim([-1.2 1.2])
set(gca,'xtick',-1:0.5:1)
set(gca,'ytick',-1:0.5:1)
axis('square')

title('$P(s) ={e}^{-Ls}\ (L > 0)$','Interpreter','latex','FontSize',14)
xlabel('${\rm Re}[P(j\omega)]$','Interpreter','latex','FontSize',14)
ylabel('${\rm Im}[P(j\omega)]$','Interpreter','latex','FontSize',14)

txt1(1) = {'${\omega}L = 0$'};
txt1(2) = {'${\omega}L = \displaystyle\frac{\pi}{2}$'};
txt1(3) = {'${\omega}L = \pi$'};
txt1(4) = {'${\omega}L = \displaystyle\frac{3\pi}{2}$'};

legend(p1,txt1)
set(legend,'Location','NorthEastOutside')
set(legend,'Interpreter','latex','FontSize',12)

grid on

% -------------------------------------------------------
disp(' ')
disp(' ***** ñ‚ëË 7.5 (2) ********************')
disp(' ***** L = 1ÅCT = 1 ÇÃÇ∆Ç´ *************')

L = 1;
T = 1;
sysP = exp(-L*s)/(T*s + 1)

options = nyquistoptions;
options.ShowFullContour = 'off';

w = logspace(-2,2,100000);

[xx yy] = nyquist(sysP,w,options);
xx = xx(:,:);
yy = yy(:,:);

figure(2)
movegui('south')

plot(xx,yy,'LineWidth',1.5)

num = 0;
for w = [0 1/2 1 2 4 8]    
    num = num + 1;
    
    [xx yy] = nyquist(sysP,w,options);
    xx = xx(:,:);
    yy = yy(:,:);
    figure(2)
    hold on
    p2(num) = plot(xx,yy,'.','MarkerSize',25);
    hold off
    
    txt2(num) = {strcat('$\omega = ',num2str(w),'$')};
end

set(gca,'FontSize',12,'FontName','Arial')

xlim([-1.2 1.2])
ylim([-1.2 1.2])
set(gca,'xtick',-1:0.5:1)
set(gca,'ytick',-1:0.5:1)
axis('square')

title('$P(s) = \displaystyle\frac{{e}^{-Ls}}{1 + Ts}\ (L = 1,\ T = 1)$','Interpreter','latex','FontSize',14)
xlabel('${\rm Re}[P(j\omega)]$','Interpreter','latex','FontSize',14)
ylabel('${\rm Im}[P(j\omega)]$','Interpreter','latex','FontSize',14)

legend(p2,txt2)
set(legend,'Location','NorthEastOutside')
set(legend,'Interpreter','latex','FontSize',12)

grid on


