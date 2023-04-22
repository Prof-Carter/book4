% exercise_07_07b.m
% ñ‚ëË 7.7
% É{Å[Éhê¸ê}ÇÃï`âÊ

close all

clear
format compact

s = tf('s');
sysP1 = 1/(1 + 0.1*s);
sysP2 = 1/(1 + 10*s);

w = logspace(-3,3,10000);

[Gg1 Gp1] = bode(sysP1,w);
Gg1 = Gg1(:,:);
Gp1 = Gp1(:,:);

[Gg2 Gp2] = bode(sysP2,w);
Gg2 = Gg2(:,:);
Gp2 = Gp2(:,:);

% -------------------------------------------------------
figure(1)
movegui('north')

semilogx(w,20*log10(Gg1),'LineWidth',1.5)
hold on
semilogx(w,20*log10(Gg2),'--','LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'xtick',logspace(-3,3,7))
ylim([-80 20])
set(gca,'ytick',-80:20:20)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',14)

legend('$P(s) = \displaystyle\frac{1}{1 + 0.1s}$','$P(s) = \displaystyle\frac{1}{1 + 10s}$')
set(legend,'Location','SouthWest')
set(legend,'Interpreter','latex','FontSize',12)

grid on

% -------------------------------------------------------
figure(2)
movegui('south')

semilogx(w,Gp1,'LineWidth',1.5)
hold on
semilogx(w,Gp2,'--','LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'xtick',logspace(-3,3,7))
ylim([-120 30])
set(gca,'ytick',-120:30:30)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',14)

legend('$P(s) = \displaystyle\frac{1}{1 + 0.1s}$','$P(s) = \displaystyle\frac{1}{1 + 10s}$')
set(legend,'Location','SouthWest')
set(legend,'Interpreter','latex','FontSize',12)

grid on


