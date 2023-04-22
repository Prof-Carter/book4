% plot_step_2nd.m
% ê} 4.7
% ê} 4.8
% ê} 4.10

close all

clear
format compact

t = 0:0.001:10;

% -------------------------------------------------------
zeta = 0:0.01:1;
Amax_tilde = 100*exp(-   pi*zeta./sqrt(1 - zeta.^2));
lambda     =     exp(- 2*pi*zeta./sqrt(1 - zeta.^2));

figure(1)
yyaxis left
plot(zeta,Amax_tilde,'LineWidth',1.5)
ylabel('$\tilde{A}_{\rm max}\ [\%]$','Interpreter','latex','FontSize',14)

figure(1)
yyaxis right
plot(zeta,lambda,'LineWidth',1.5)
ylabel('$\lambda$','Interpreter','latex','FontSize',14)

title('Fig. 4.7','Interpreter','latex','FontSize',14)
xlabel('$\zeta$','Interpreter','latex','FontSize',14)

set(gca,'FontSize',12,'FontName','Arial')

movegui('northwest');

% -------------------------------------------------------
K = 1;
wn = 1;
num = 0;
for zeta = 0:0.1:0.9
    num = num + 1;
    
    sysP = tf([K*wn^2],[1 2*zeta*wn  wn^2]);
    y = step(sysP,t);
    
    figure(2)
    plot(t,y,'LineWidth',1.5)
    hold on
    
    txt2(num) = {strcat('$\zeta =',num2str(zeta),'$')};
end

figure(2)
hold off

ylim([0 2])

title('$K = 1$, ${\omega}_{n} = 1$ (Fig. 4.8)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend(txt2,'Location','NorthEast','NumColumns',2)
set(legend,'Interpreter','latex','FontSize',12)

grid on

set(gca,'FontSize',12,'FontName','Arial')

movegui('southwest');

% -------------------------------------------------------
K = 1;
wn = 1;
num = 0;
for zeta = 1:0.5:3
    num = num + 1;
    
    sysP = tf([K*wn^2],[1 2*zeta*wn  wn^2]);
    y = step(sysP,t);
    
    figure(3)
    plot(t,y,'LineWidth',1.5)
    hold on
    
    txt3(num) = {strcat('$\zeta =',num2str(zeta),'$')};
end

figure(3)
hold off

ylim([0 2])

title('$K = 1$, ${\omega}_{n} = 1$ (Fig. 4.10)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend(txt3,'Location','NorthWest','NumColumns',2)
set(legend,'Interpreter','latex','FontSize',12)

grid on

set(gca,'FontSize',12,'FontName','Arial')

movegui('north');
