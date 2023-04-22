% bode_vector_1st.m
% 1 次遅れ要素のボード線図の描画

close all

clear
format compact

s = tf('s');
T = 1;
sysP = 1/(1 + T*s);

% -------------------------------------------------------
% ボード線図
% -------------------------------------------------------
w = logspace(-2,2,10000);
[Gg Gp] = bode(sysP,w);
Gg = Gg(:,:);
Gp = Gp(:,:);

% -------------------------------------------------------
% ボード線図：折れ線近似
% -------------------------------------------------------
wg = 1/T;

wp = [1/(5*T)  5/T];
log10_wp = log10(wp);

n = length(w);
for i = 1:n
    if w(i) < wg
        Gg_app(i) = 1;
    else
        Gg_app(i) = 1/(w(i)*T);
    end
    
    if w(i) < wp(1)
        Gp_app(i) = 0;
    elseif w(i) < wp(2)
        Gp_app(i) = (-90)/(log10_wp(2) - log10_wp(1))*(log10(w(i)) - log10_wp(1));
    else
        Gp_app(i) = -90;
    end
end



% -------------------------------------------------------
figure(1)
movegui('northwest')

semilogx(w,20*log10(Gg_app),'--','LineWidth',1.5,'Color',[0.8500 0.3250 0.0980])
hold on
semilogx(w,20*log10(Gg),'LineWidth',1.5,'Color',[0 0.4470 0.7410])

semilogx(wg,0,'o','Color',[0.6350 0.0780 0.1840],'MarkerFaceColor',[1 1 1],'MarkerSize',7,'LineWidth',1.5)
semilogx(wg,20*log10(1/sqrt(2)),'.','Color',[0.6350 0.0780 0.1840],'MarkerSize',25)
hold off

ylim([-40 10])
set(gca,'YTick',-40:10:10)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.9 (a)','Interpreter','latex','FontSize',14)
xlabel('${\omega}T$','Interpreter','latex','FontSize',14)
ylabel('$20\log_{10}{G}_{\rm g}(\omega)$ [dB]','Interpreter','latex','FontSize',14)

grid on

% -------------------------------------------------------
figure(2)
movegui('north')

semilogx(w,Gp_app,'--','LineWidth',1.5,'Color',[0.8500 0.3250 0.0980])
hold on
semilogx(w,Gp,'LineWidth',1.5,'Color',[0 0.4470 0.7410])

p2(1) = semilogx(wp(1),  0,'o','MarkerFaceColor',[1 1 1],'MarkerSize',7,'LineWidth',1.5);
p2(2) = semilogx(wg,   -45,'.','Color',[0.6350 0.0780 0.1840],'MarkerSize',25);
p2(3) = semilogx(wp(2),-90,'o','MarkerFaceColor',[1 1 1],'MarkerSize',7,'LineWidth',1.5);
hold off

ylim([-100 10])
set(gca,'YTick',-90:30:0)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.9 (b)','Interpreter','latex','FontSize',14)
xlabel('${\omega}T$','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm p}(\omega)$ [deg]','Interpreter','latex','FontSize',14)

legend(p2,{'$\omega = 1/5T$','$\omega = 1/T$','$\omega = 5/T$'})
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

% -------------------------------------------------------
figure(3)
movegui('southwest')

semilogx(w,Gg,'LineWidth',1.5,'Color',[0 0.4470 0.7410])
hold on

semilogx(wg,1/sqrt(2),'.','Color',[0.6350 0.0780 0.1840],'MarkerSize',25)
hold off

ylim([0 1.25])
set(gca,'YTick',0:0.25:1.25)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.9 (c)','Interpreter','latex','FontSize',14)
xlabel('${\omega}T$','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm g}(\omega)$','Interpreter','latex','FontSize',14)

grid on

% -------------------------------------------------------
% ベクトル軌跡
% -------------------------------------------------------
options = nyquistoptions;
options.ShowFullContour = 'off';

w = logspace(-2,2,100000);

[xx yy] = nyquist(sysP,w,options);
xx = xx(:,:);
yy = yy(:,:);

figure(4)
movegui('south')

plot(xx,yy,'LineWidth',1.5)
hold on
p4(1) = plot(  1,   0,'.','MarkerSize',25);
p4(2) = plot(1/2,-1/2,'.','MarkerSize',25,'Color',[0.6350 0.0780 0.1840]);
p4(3) = plot(  0,   0,'.','MarkerSize',25);
hold off

xlim([-0.1 1.1])
ylim([-0.6 0.6])
set(gca,'XTick',-1:0.25:1)
set(gca,'YTick',-0.5:0.25:0.5)
axis('square')

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.9 (d)','Interpreter','latex','FontSize',14)
xlabel('${\rm Re}[P(j\omega)]$','Interpreter','latex','FontSize',14)
ylabel('${\rm Im}[P(j\omega)]$','Interpreter','latex','FontSize',14)

legend(p4, {'$\omega = 0$', '$\omega = 1/T$', '$\omega = \infty$'})
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on





