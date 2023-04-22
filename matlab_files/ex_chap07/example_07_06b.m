% example_07_06b.m
% 例 7.6b
% 高次要素のボード線図（折れ線近似）

close all

clear
format compact

% -------------------------------------------------------
w = logspace(-3,3,10000);
n = length(w);

s = tf('s');

% -------------------------------------------------------
figure(1)
movegui('southwest')

figure(2)
movegui('south')

% -------------------------------------------------------
T1 = 1;
sysP1 = 1/(1 + T1*s);

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
T2 = 10;
sysP2 = 1 + T2*s;

wg2 = 1/T2;

wp2 = [1/(5*T2)  5/T2];
log10_wp2 = log10(wp2);

for i = 1:n
    if w(i) < wg2
        Gg2_app(i) = 1;
    else
        Gg2_app(i) = w(i)*T2;
    end
    
    if w(i) < wp2(1)
        Gp2_app(i) = 0;
    elseif w(i) < wp2(2)
        Gp2_app(i) = 90/(log10_wp2(2) - log10_wp2(1))*(log10(w(i)) - log10_wp2(1));
    else
        Gp2_app(i) = 90;
    end
end

figure(1)
semilogx(w,20*log10(Gg2_app),'LineWidth',1.5)

figure(2)
semilogx(w,Gp2_app,'LineWidth',1.5)

% -------------------------------------------------------
K = 1/100;
sysP3 = K;
sysP3 = tf(sysP3)

for i = 1:n
    Gg3_app(i) =K;
    
    Gp3_app(i) = 0;
end

figure(1)
semilogx(w,20*log10(Gg3_app),'LineWidth',1.5)

figure(2)
semilogx(w,Gp3_app,'LineWidth',1.5)

% -------------------------------------------------------
figure(1)
semilogx(w,20*log10(Gg1_app)...
          +20*log10(Gg2_app)...
          +20*log10(Gg3_app),'LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-60 60])
set(gca,'YTick',-60:20:60)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.15 (c)','Interpreter','latex','FontSize',14)
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
semilogx(w,Gp1_app...
          +Gp2_app...
          +Gp3_app,'LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-135 135])
set(gca,'YTick',-135:45:135)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.15 (d)','Interpreter','latex','FontSize',14)
xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',14)

legend('${P}_{1}(s) = 1/(1 + s)$',...
       '${P}_{2}(s) = 1 + 10s$',...
       '${P}_{3}(s) = 1/100$',...
       '$P(s) = {P}_{1}(s){P}_{2}(s){P}_{3}(s)$')
set(legend,'Location','SouthWest')
set(legend,'Interpreter','latex','FontSize',12)

grid on

