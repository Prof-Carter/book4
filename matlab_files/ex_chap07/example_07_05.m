% example_07_05.m
% ó· 7.5
% É{Å[Éhê¸ê}ÇÃï`âÊ

close all

clear
format compact

s = tf('s');
sysP = 1/(s + 1);

w = logspace(-3,3,10000);
[Gg Gp] = bode(sysP,w);
Gg = Gg(:,:);
Gp = Gp(:,:);

% -------------------------------------------------------
figure(1)
movegui('northwest')

semilogx(w,Gg,'LineWidth',1.5)

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([0 1.25])
set(gca,'YTick',0:0.25:1.25)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.6 (a)','Interpreter','latex','FontSize',14)
xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm g}(\omega)$','Interpreter','latex','FontSize',14)
grid on

% -------------------------------------------------------
figure(2)
movegui('southwest')

semilogx(w,20*log10(Gg),'LineWidth',1.5)
hold on
semilogx(w,-20*log10(w),'--')
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-80 20])
set(gca,'YTick',-80:20:20)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.6 (a)','Interpreter','latex','FontSize',14)
xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',14)

grid on

% -------------------------------------------------------
figure(3)
movegui('south')

semilogx(w,Gp,'LineWidth',1.5)
hold on
semilogx(1e0,-45,'.','MarkerSize',25)
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-120 30])
set(gca,'YTick',-120:30:30)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.6 (b)','Interpreter','latex','FontSize',14)
xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',14)

grid on
