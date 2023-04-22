% exercise_04_04.m
% 問題 4.4
% マス・ばね・ダンパ系のパラメータ同定

close all

clear
format compact

Amax = 0.1;
Tp = 2;

yinf = 0.5;

% -------------------------------------------------------
disp(' ')
disp(' ***** 問題 4.4 (1) ********************')

K = yinf;
xi = - 1/Tp*log(Amax/yinf);
wn = sqrt(xi^2 + (pi/Tp)^2);
zeta = xi/wn;

fprintf('K    = %5.4e\n',K)
fprintf('xi   = %5.4e\n',xi)
fprintf('wn   = %5.4e\n',wn)
fprintf('zeta = %5.4e\n',zeta)

% -------------------------------------------------------
disp(' ')
disp(' ***** 問題 4.4 (2) ********************')

k = 1/K;
M = k/wn^2;
c = 2*zeta*wn*M;

fprintf('k = %5.4e\n',k)
fprintf('M = %5.4e\n',M)
fprintf('c = %5.4e\n',c)

% -------------------------------------------------------
sysP = tf(K*wn^2,[1 2*zeta*wn wn^2])

t = 0:0.001:8;
y = step(sysP,t);

figure(1)
plot(t,y,'LineWidth',1.5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 4.9','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

grid on
