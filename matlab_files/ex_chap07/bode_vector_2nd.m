% bode_vector_2nd.m
% 1 éüíxÇÍóvëfÇÃÉ{Å[Éhê¸ê}ÇÃï`âÊ

close all

clear
format compact

% -------------------------------------------------------
% É{Å[Éhê¸ê}
% -------------------------------------------------------
w = logspace(-2,2,10000);

s = tf('s');
wn = 1;

num = 0;
for zeta = [0.25 0.5 1 2]
    num = num + 1;
    
    sysP = wn^2/(s^2 + 2*zeta*wn*s + wn^2);
    
    [Gg Gp] = bode(sysP,w);
    Gg = Gg(:,:);
    Gp = Gp(:,:);
    
    figure(1)
    p1(num) = semilogx(w,20*log10(Gg),'LineWidth',1.5);
    hold on
    
    figure(2)
    p2(num) = semilogx(w,Gp,'LineWidth',1.5);
    hold on
    
    figure(3)
    p3(num) = semilogx(w,Gg,'LineWidth',1.5);
    hold on
    
    txt(num) = {strcat('$\zeta = ',num2str(zeta),'$')};
end

% -------------------------------------------------------
figure(1)
movegui('northwest')
hold off

figure(1)
ylim([-80 20])
set(gca,'YTick',-80:20:20)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.16 (a)','Interpreter','latex','FontSize',14)
xlabel('${\omega}/{\omega}_{\rm n}$','Interpreter','latex','FontSize',14)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',14)

legend(p1,txt)
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

% -------------------------------------------------------
figure(2)
movegui('north')
hold off

figure(2)
ylim([-210 30])
set(gca,'YTick',-210:30:30)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.16 (b)','Interpreter','latex','FontSize',14)
xlabel('${\omega}/{\omega}_{\rm n}$','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',14)

legend(p2,txt)
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

% -------------------------------------------------------
figure(3)
movegui('southwest')
hold off

figure(3)
ylim([0 2.5])
set(gca,'YTick',0:0.5:2.5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.16 (c)','Interpreter','latex','FontSize',14)
xlabel('${\omega}/{\omega}_{\rm n}$','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm g}(\omega)$','Interpreter','latex','FontSize',14)

legend(p3,txt)
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

% -------------------------------------------------------
% ÉxÉNÉgÉããOê’
% -------------------------------------------------------
options = nyquistoptions;
options.ShowFullContour = 'off';

w = logspace(-2,2,100000);

num = 0;
for zeta = [0.25 0.5 1 2]
    num = num + 1;
    
    sysP = wn^2/(s^2 + 2*zeta*wn*s + wn^2);
    
    [xx yy] = nyquist(sysP,w,options);
    xx = xx(:,:);
    yy = yy(:,:);
    
    figure(4)
    p4(num) = plot(xx,yy,'LineWidth',1.5);
    hold on
    
    txt(num) = {strcat('$\zeta = ',num2str(zeta),'$')};
end



figure(4)
hold off

movegui('south')

xlim([-1 1.5])
ylim([-2.25 0.25])
set(gca,'XTick',-1:0.5:1)
set(gca,'YTick',-2:0.5:0)
axis('square')

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.16 (d)','Interpreter','latex','FontSize',14)
xlabel('${\rm Re}[P(j\omega)]$','Interpreter','latex','FontSize',14)
ylabel('${\rm Im}[P(j\omega)]$','Interpreter','latex','FontSize',14)

legend(p4,txt)
set(legend,'Location','NorthEastOutside')
set(legend,'Interpreter','latex','FontSize',14)

grid on


