% example_08_07.m
% ó· 8.7
% É{Å[Éhê¸ê}Ç∆à¿íËó]óT

close all

clear
format compact

disp(' ')
disp(' ***** ó· 8.7 ***************************')

% --------------------------------------------------
w = logspace(-1,1,10000);
s = tf('s');
sysP = 1/(s + 1)^3;

num = 0;
for kP = [2 8 27]
    num = num + 1;
    
    % --------------------------------------------------
    wpc = 3^(1/2);
    Gm = - 20*log10(kP/8);
    
    wgc = sqrt(kP^(2/3) - 1);
    Pm = 180 - 3*atan(wgc)*180/pi;
    
    fprintf('\n+++++++++++++++++++++++++++++++++++++++++\n')
    fprintf('kP  = %d\n',kP)
    fprintf('Gm  = %6.4f [dB]  (wpc = %6.4f [rad/s])\n',Gm,wpc)
    fprintf('Pm  = %6.4f [deg] (wgc = %6.4f [rad/s])\n',Pm,wgc)
    
    % --------------------------------------------------
    sysC = kP;
    sysL = sysP*sysC

    [Gg Gp] = bode(sysL,w);
    Gg = Gg(:,:);
    Gp = Gp(:,:);
    
    figure(1)
    semilogx(w,20*log10(Gg),'LineWidth',1.5)
    hold on
    h1(num) = semilogx(wpc,-Gm,'.','MarkerSize',25);
    
    figure(2)
    semilogx(w,Gp,'LineWidth',1.5)
    hold on
    h2(num) = semilogx(wgc,-180+Pm,'.','MarkerSize',25);
    
    txt(num) = {strcat('${k}\sb{\rm P} = ',num2str(kP),'$')};
end

% --------------------------------------------------
figure(1)
hold off

movegui('north');

ylim([-30 30]) 
set(gca,'YTick',-30:15:30)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('$20\log_{10}|L(j\omega)|$ [dB]','Interpreter','latex','FontSize',14)

legend(h1,txt)
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)
    
grid on

% --------------------------------------------------
figure(2)
hold off

movegui('south');

ylim([-270 0]) 
set(gca,'YTick',-270:90:0)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$\omega$ [rad/s]','Interpreter','latex','FontSize',14)
ylabel('$\angle L(j\omega)$ [deg]','Interpreter','latex','FontSize',14)

legend(h2,txt)
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on


