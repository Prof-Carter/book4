% exercise_05_05.m
% ñ‚ëË 5.5
% ñ⁄ïWílâûìöÇ∆íËèÌà íuïŒç∑

close all

clear
format compact

s = tf('s');
sysP = 2/(s^3 + 4*s^2 + 5*s - 1);

t = 0:0.001:20;

% ===============================================
disp(' ')
disp(' ***** ñ‚ëË 5.5 (1) ********************')

sysC = 4
sysL = minreal(sysP*sysC);

% -------------------------------------
sysGyr = minreal(sysL/(1 + sysL))
[numGyr denGyr] = tfdata(sysGyr,'v');
yr_inf = numGyr(end)/denGyr(end)

y = step(sysGyr,t);
figure(1)
plot([0 t(end)],[yr_inf yr_inf],'k--')
hold on
h1(1) = plot(t,y,'LineWidth',1.5);

% -------------------------------------
sysGer = minreal(1/(1 + sysL))
[numGer denGer] = tfdata(sysGer,'v');
ep = numGer(end)/denGer(end)

e = step(sysGer,t);
figure(2)
plot([0 t(end)],[ep ep],'k--')
hold on
h2(1) = plot(t,e,'LineWidth',1.5);

% ===============================================
disp(' ')
disp(' ***** ñ‚ëË 5.5 (2) ********************')

sysC = (4*s + 1)/s
sysL = minreal(sysP*sysC);

% -------------------------------------
sysGyr = minreal(sysL/(1 + sysL))
[numGyr denGyr] = tfdata(sysGyr,'v');
yr_inf = numGyr(end)/denGyr(end)

y = step(sysGyr,t);
figure(1)
plot([0 t(end)],[yr_inf yr_inf],'k--')
hold on
h1(2) = plot(t,y,'LineWidth',1.5);
hold off

% -------------------------------------
sysGer = minreal(1/(1 + sysL))
[numGer denGer] = tfdata(sysGer,'v');
ep = numGer(end)/denGer(end)

e = step(sysGer,t);
figure(2)
plot([0 t(end)],[ep ep],'k--')
hold on
h2(2) = plot(t,e,'LineWidth',1.5);
hold off


% -------------------------------------
figure(1)
hold off

movegui('north')

set(gca,'FontSize',12,'FontName','Arial')
legend(h1,{'ñ‚ëË 5.5 (1)', 'ñ‚ëË 5.5 (2)'})
set(legend,'Location','SouthEast')
set(legend,'FontSize',12,'FontName','MS UI Gothic')

ylim([0 2])

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${y}_{\rm r}(t)$','Interpreter','latex','FontSize',14)

grid on

% -------------------------------------
figure(2)
hold off

movegui('south')

set(gca,'FontSize',12,'FontName','Arial')
legend(h2,{'ñ‚ëË 5.5 (1)', 'ñ‚ëË 5.5 (2)'})
set(legend,'Location','SouthEast')
set(legend,'FontSize',12,'FontName','MS UI Gothic')

ylim([-1 1])

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${e}_{\rm r}(t)$','Interpreter','latex','FontSize',14)

grid on



