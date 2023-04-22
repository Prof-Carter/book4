% exercise_07_09_02.m
% 問題 7.9 (2)
% 高次要素のボード線図

close all

clear
format compact

% -------------------------------------------------------
w = logspace(-3,3,10000);
n = length(w);

s = tf('s');

% -------------------------------------------------------
figure(1)
movegui('northwest')

figure(2)
movegui('north')

% -------------------------------------------------------
T1 = 1;
sysQ = 1/(1 + T1*s)

wg1 = 1/T1;

wp1 = [1/(5*T1)  5/T1];
log10_wp1 = log10(wp1);

for i = 1:n
    if w(i) < wg1
        Gg1_app(i) = 1;
    else
        Gg1_app(i) = 1/(w(i)*T1);
    end
    
    if w(i) < wp1(1)
        Gp1_app(i) = 0;
    elseif w(i) < wp1(2)
        Gp1_app(i) = (-90)/(log10_wp1(2) - log10_wp1(1))*(log10(w(i)) - log10_wp1(1));
    else
        Gp1_app(i) = -90;
    end
end

figure(1)
semilogx(w,20*log10(Gg1_app),'LineWidth',1.5)
hold on

figure(2)
semilogx(w,Gp1_app,'LineWidth',1.5)
hold on

% -------------------------------------------------------
sysP = zpk(sysQ^4)

% -------------------------------------------------------
figure(1)
semilogx(w,4*20*log10(Gg1_app),'LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-240 40])
set(gca,'YTick',-240:40:40)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',14)

legend('$Q(s) = 1/(1 + s)$',...
       '$P(s) = Q(s)^4 = 1/(1 + s)^4$')
set(legend,'Location','SouthWest')
set(legend,'Interpreter','latex','FontSize',12)

grid on

% -------------------------------------------------------
figure(2)
semilogx(w,4*Gp1_app,'LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-382.5 22.5])
set(gca,'YTick',-360:45:0)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',14)

legend('$Q(s) = 1/(1 + s)$',...
       '$P(s) = Q(s)^4 = 1/(1 + s)^4$')
set(legend,'Location','SouthWest')
set(legend,'Interpreter','latex','FontSize',12)

grid on


% =======================================================
[Gg1 Gp1] = bode(sysQ,w);
Gg1 = Gg1(:,:);
Gp1 = Gp1(:,:);

% -------------------------------------------------------
figure(3)
movegui('southwest')

semilogx(w,20*log10(Gg1),'LineWidth',1.5)
hold on

semilogx(w,4*20*log10(Gg1),'LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-240 40])
set(gca,'YTick',-240:40:40)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',14)

legend('$Q(s) = 1/(1 + s)$',...
       '$P(s) = Q(s)^4 = 1/(1 + s)^4$')
set(legend,'Location','SouthWest')
set(legend,'Interpreter','latex','FontSize',12)

grid on

% -------------------------------------------------------
figure(4)
movegui('south')

semilogx(w,Gp1,'LineWidth',1.5)
hold on

semilogx(w,4*Gp1,'LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-382.5 22.5])
set(gca,'YTick',-360:45:0)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',14)

legend('$Q(s) = 1/(1 + s)$',...
       '$P(s) = Q(s)^4 = 1/(1 + s)^4$')
set(legend,'Location','SouthWest')
set(legend,'Interpreter','latex','FontSize',12)

grid on
