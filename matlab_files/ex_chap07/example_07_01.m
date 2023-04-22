% example_07_01.m
% ó· 7.1
% é¸îgêîâûìöÇÃï`âÊ

clear
format compact

% -------------------------------------------------------
disp(' ')
disp(' ***** ó· 7.1 ********************')

for w = [0.1 10]
    Gg = 1/sqrt(1 + w^2);
    Gp = - atan(w);
    
    fprintf('+++++++++++++++++++++++++++\n')
    fprintf('w = %3.1f [rad/s]\n',w)
    fprintf('Gg(%3.1f) = %f [î{] Å‡ %4.2f [î{]\n',w,Gg,Gg)
    fprintf('Gp(%3.1f) = %f [deg]Å‡ %4.2f [deg]\n',w,Gp*180/pi,Gp*180/pi)
end

% -------------------------------------------------------
A = 1;
w = 0.1;
t = linspace(0,20/w,10000);

u = A*sin(w*t);
y = A*w/(1 + w^2)*exp(-t) + A/(1 + w^2)*(sin(w*t) - w*cos(w*t));

y_app = A/(1 + w^2)*(sin(w*t) - w*cos(w*t));

figure(1)
movegui('north')

plot(t,u,'--','LineWidth',1.5)
hold on
plot(t,y,t,y_app,'LineWidth',1.5)
hold off

ylim([-1.5 1.5])

title('Fig. 7.2 (a) ($A = 1$, $\omega = 0.1$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$u(t)$, $y(t)$ and ${y}_{\rm app}(t)$','Interpreter','latex','FontSize',14)

set(gca,'FontSize',12,'FontName','Arial')
legend('$u(t)$','$y(t)$','${y}_{\rm app}(t)$')
set(legend,'Location','SouthEast','NumColumns',3)
set(legend,'Interpreter','latex','FontSize',14)

grid on

% -------------------------------------------------------
A = 1;
w = 10;
t = linspace(0,20/w,10000);

u = A*sin(w*t);
y = A*w/(1 + w^2)*exp(-t) + A/(1 + w^2)*(sin(w*t) - w*cos(w*t));

y_app = A/(1 + w^2)*(sin(w*t) - w*cos(w*t));

figure(2)
movegui('south')

plot(t,u,'--','LineWidth',1.5)
hold on
plot(t,y,t,y_app,'LineWidth',1.5)
hold off

ylim([-1.5 1.5])

title('Fig. 7.2 (b) ($A = 1$, $\omega = 10$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$u(t)$, $y(t)$ and ${y}_{\rm app}(t)$','Interpreter','latex','FontSize',14)

set(gca,'FontSize',12,'FontName','Arial')
legend('$u(t)$','$y(t)$','${y}_{\rm app}(t)$')
set(legend,'Location','SouthEast','NumColumns',3)
set(legend,'Interpreter','latex','FontSize',14)

grid on

