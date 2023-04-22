% exercise_07_09_01.m
% 問題 7.9 (1)
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
T1 = 10;
sysP1 = 1/(1 + T1*s)

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
T2 = 0.1;
sysP2 = 1/(1 + T2*s)

wg2 = 1/T2;

wp2 = [1/(5*T2)  5/T2];
log10_wp2 = log10(wp2);

for i = 1:n
    if w(i) < wg2
        Gg2_app(i) = 1;
    else
        Gg2_app(i) = 1/(w(i)*T2);
    end
    
    if w(i) < wp2(1)
        Gp2_app(i) = 0;
    elseif w(i) < wp2(2)
        Gp2_app(i) = -90/(log10_wp2(2) - log10_wp2(1))*(log10(w(i)) - log10_wp2(1));
    else
        Gp2_app(i) = -90;
    end
end

figure(1)
semilogx(w,20*log10(Gg2_app),'LineWidth',1.5)

figure(2)
semilogx(w,Gp2_app,'LineWidth',1.5)

% -------------------------------------------------------
K = 100;
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
sysP = zpk(sysP1*sysP2*sysP3)

% -------------------------------------------------------
figure(1)
semilogx(w,20*log10(Gg1_app)...
          +20*log10(Gg2_app)...
          +20*log10(Gg3_app),':','LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-80 60])
set(gca,'YTick',-80:20:60)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',14)

legend('${P}_{1}(s) = 1/(1 + 10s)$',...
       '${P}_{2}(s) = 1/(1 + 0.1s)$',...
       '${P}_{3}(s) = 100$',...
       '$P(s) = {P}_{1}(s){P}_{2}(s){P}_{3}(s)$')
set(legend,'Location','SouthWest')
set(legend,'Interpreter','latex','FontSize',12)

grid on

% -------------------------------------------------------
figure(2)
semilogx(w,Gp1_app...
          +Gp2_app...
          +Gp3_app,':','LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-210 30])
set(gca,'YTick',-180:45:0)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',14)

legend('${P}_{1}(s) = 1/(1 + 10s)$',...
       '${P}_{2}(s) = 1/(1 + 0.1s)$',...
       '${P}_{3}(s) = 100$',...
       '$P(s) = {P}_{1}(s){P}_{2}(s){P}_{3}(s)$')
set(legend,'Location','SouthWest')
set(legend,'Interpreter','latex','FontSize',12)

grid on


% =======================================================
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
figure(3)
movegui('southwest')

semilogx(w,20*log10(Gg1),'LineWidth',1.5)
hold on

semilogx(w,20*log10(Gg2),'LineWidth',1.5)
semilogx(w,20*log10(Gg3),'LineWidth',1.5)

semilogx(w,20*log10(Gg1)+20*log10(Gg2)+20*log10(Gg3),':','LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-80 60])
set(gca,'YTick',-80:20:60)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',14)

legend('${P}_{1}(s) = 1/(1 + 10s)$',...
       '${P}_{2}(s) = 1/(1 + 0.1s)$',...
       '${P}_{3}(s) = 100$',...
       '$P(s) = {P}_{1}(s){P}_{2}(s){P}_{3}(s)$')
set(legend,'Location','SouthWest')
set(legend,'Interpreter','latex','FontSize',12)

grid on

% -------------------------------------------------------
figure(4)
movegui('south')

semilogx(w,Gp1,'LineWidth',1.5)
hold on

semilogx(w,Gp2,'LineWidth',1.5)
semilogx(w,Gp3,'LineWidth',1.5)

semilogx(w,Gp1+Gp2+Gp3,':','LineWidth',1.5)
hold off

xlim([1e-3 1e3])
set(gca,'XTick',logspace(-3,3,7))
ylim([-210 30])
set(gca,'YTick',-180:45:0)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',14)

legend('${P}_{1}(s) = 1/(1 + 10s)$',...
       '${P}_{2}(s) = 1/(1 + 0.1s)$',...
       '${P}_{3}(s) = 100$',...
       '$P(s) = {P}_{1}(s){P}_{2}(s){P}_{3}(s)$')
set(legend,'Location','SouthWest')
set(legend,'Interpreter','latex','FontSize',12)

grid on
