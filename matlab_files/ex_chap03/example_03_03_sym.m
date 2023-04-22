% example_03_03_sym.m
% �� 3.3
% 2 ���x��n�̒P�ʃX�e�b�v�����̉ߓn����
% �ySymbolic Math Toolbox�z

close all

clear
format compact

disp(' ')
disp(' ***** �� 3.3 ********************')

syms s
syms t real

Ps = 10/(s^2 + 2*s + 10)

disp(' ')
disp(' ---- P(s) �̋� ----')
[numP denP] = numden(Ps);
solve(denP)
disp(' ')

ut = sym(1)
us = laplace(ut)
ys = Ps*us

disp(' ')
disp(' ----�P�ʃX�e�b�v���� y(t) ----')
yt = ilaplace(ys)

disp(' ')
disp(' ----�P�ʃX�e�b�v���� y(t) �̎��Ԕ��� dy(t)/dt ----')
dyt = simplify(diff(yt))

disp(' ')
disp(' ---- dy(t)/dt = 0 �̉� t = t_l (l = 0, 1, 2, ...) ----')
assume(t >= 0);
[t_l params conds] = solve(dyt, 'ReturnConditions', true)

disp(' ')
disp(' ---- ���l yinf ----')
yinf = subs(Ps,s,0)
fprintf('yinf = %f\n',yinf)

disp(' ')
disp(' ---- �s���߂����� Tp ----')
Tp   = subs(t_l,1)
fprintf('Tp   = %f\n',Tp)

disp(' ')
disp(' ---- �I�[�o�[�V���[�g Amax ----')
Amax = subs(yt,Tp) - yinf
fprintf('Amax = %f\n',Amax)

disp(' ')
disp(' ---- �ɑ�l�ƂȂ鎞�� t1_bar, t2_bar, t3_bar, ... ----')
t1_bar = subs(t_l,1)
t2_bar = subs(t_l,3)
t3_bar = subs(t_l,5)

disp(' ')
disp(' ---- �ɑ�l A1, A2, A3, ... ----')
A1 = subs(yt,t1_bar) - yinf
A2 = subs(yt,t2_bar) - yinf
A3 = subs(yt,t3_bar) - yinf

disp(' ')
disp(' ---- ������ lambda ----')
lambda = simplify(A2/A1)
fprintf('lambda = %f\n',lambda)

% ------------------------------------------------------------
figure(1)
fplot(yt,[0 5*pi/3],'LineWidth',1.5)
hold on

fplot(1 + exp(-t),[0 5*pi/3],'LineWidth',1.5)
fplot(1 - exp(-t),[0 5*pi/3],'LineWidth',1.5)
hold off

xlim([0 5*pi/3])
ylim([0 2])

set(gca,'XTick',0:pi/3:5*pi/3)
set(gca,'XTickLabel',{'0','\pi/3','2\pi/3','\pi','4\pi/3','5\pi/3'})

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 3.3','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

legend('$y(t)$','$\overline{y}(t)$','$\underline{y}(t)$')
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on
