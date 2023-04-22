% exercise_05_06.m
% ñ‚ëË 5.6
% äOóêâûìöÇ∆íËèÌíl

close all

clear
format compact

s = tf('s');
sysP = 2/(s^3 + 4*s^2 + 5*s - 1);

t = 0:0.001:20;

% ===============================================
disp(' ')
disp(' ***** ñ‚ëË 5.6 (1) ********************')

sysC = 4
sysL = minreal(sysP*sysC);

% -------------------------------------
sysGyd = minreal(sysP/(1 + sysL))
[numGyd denGyd] = tfdata(sysGyd,'v');
ys = numGyd(end)/denGyd(end)

y = step(sysGyd,t);
figure(1)
plot([0 t(end)],[ys ys],'k--')
hold on
h(1) = plot(t,y,'LineWidth',1.5);

% ===============================================
disp(' ')
disp(' ***** ñ‚ëË 5.6 (2) ********************')

sysC = (4*s + 1)/s
sysL = minreal(sysP*sysC);

% -------------------------------------
sysGyd = minreal(sysP/(1 + sysL))
[numGyd denGyd] = tfdata(sysGyd,'v');
ys = numGyd(end)/denGyd(end)

y = step(sysGyd,t);
figure(1)
plot([0 t(end)],[ys ys],'k--')
hold on
h(2) = plot(t,y,'LineWidth',1.5);
hold off

% -------------------------------------
figure(1)
hold off

set(gca,'FontSize',12,'FontName','Arial')
legend(h,{'ñ‚ëË 5.6 (1)', 'ñ‚ëË 5.6 (2)'})
set(legend,'Location','SouthEast')
set(legend,'FontSize',12,'FontName','MS UI Gothic')

ylim([-0.2 0.4])

xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${y}_{\rm d}(t)$','Interpreter','latex','FontSize',14)

grid on

