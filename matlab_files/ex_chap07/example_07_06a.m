% example_07_06a.m
% ó· 7.6a
% çÇéüóvëfÇÃÉ{Å[Éhê¸ê}

close all

clear
format compact

% -------------------------------------------------------
s = tf('s');
sysP1 = 1/(1 + s)

sysP2 = 1 + 10*s

sysP3 = 1/100;
sysP3 = tf(sysP3)

w = logspace(-3,3,10000);

[Gg1 Gp1] = bode(sysP1,w);
Gg1 = Gg1(:,:);
Gp1 = Gp1(:,:);

[Gg2 Gp2] = bode(sysP2,w);
Gg2 = Gg2(:,:);
Gp2 = Gp2(:,:);

[Gg3 Gp3] = bode(sysP3,w);
Gg3 = Gg3(:,:);
Gp3 = Gp3(:,:);

% -------------------------------------------------------
figure(1)
movegui('northwest')

semilogx(w,20*log10(Gg1),'LineWidth',1.5)
hold on

semilogx(w,20*log10(Gg2),'LineWidth',1.5)
semilogx(w,20*log10(Gg3),'LineWidth',1.5)

semilogx(w,20*log10(Gg1)+20*log10(Gg2)+20*log10(Gg3),'LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-60 60])
set(gca,'YTick',-60:20:60)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.15 (a)','Interpreter','latex','FontSize',14)
xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',14)

legend('${P}_{1}(s) = 1/(1 + s)$',...
       '${P}_{2}(s) = 1 + 10s$',...
       '${P}_{3}(s) = 1/100$',...
       '$P(s) = {P}_{1}(s){P}_{2}(s){P}_{3}(s)$')
set(legend,'Location','NorthWest')
set(legend,'Interpreter','latex','FontSize',12)

grid on

% -------------------------------------------------------
figure(2)
movegui('north')

semilogx(w,Gp1,'LineWidth',1.5)
hold on

semilogx(w,Gp2,'LineWidth',1.5)
semilogx(w,Gp3,'LineWidth',1.5)

semilogx(w,Gp1+Gp2+Gp3,'LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-135 135])
set(gca,'YTick',-135:45:135)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.15 (b)','Interpreter','latex','FontSize',14)
xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',14)

legend('${P}_{1}(s) = 1/(1 + s)$',...
       '${P}_{2}(s) = 1 + 10s$',...
       '${P}_{3}(s) = 1/100$',...
       '$P(s) = {P}_{1}(s){P}_{2}(s){P}_{3}(s)$')
set(legend,'Location','SouthWest')
set(legend,'Interpreter','latex','FontSize',12)

grid on

