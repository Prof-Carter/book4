% exercise_06_04_sym.m
% ��� 6.4
% PI ����
% �ySymbolic Math Toolbox�z

close all

clear
format compact

syms s
syms t real
syms kI positive

% -----------------------------------------------
disp(' ')
disp(' ***** ��� 6.4 (1) ********************')

disp(' ')
disp(' ---- P(s) ---- ')
Ps = 1/(s - 1)

disp(' ')
disp(' ---- C(s) ---- ')
kP = 4
Cs = kP + kI/s

disp(' ')
disp(' ---- Gyr(s) ---- ')
Gyr = collect(Ps*Cs/(1 + Ps*Cs),s)

disp(' ')
disp(' ---- Gyr(s) �̋� p ---- ')
[numGyr denGyr] = numden(Gyr)
p = solve(denGyr)

disp(' ')
disp(' ---- Gyr(s) ���� c(1)*s^2 + c(2)*s + c(3) �̌W�� c ---- ')
c = coeffs(denGyr,s);
c = fliplr(c)

disp(' ')
disp(' ---- ���ʎ� D = c(2)^2 - 4*c(1)*c(3) ---- ')
D = c(2)^2 - 4*c(1)*c(3)


disp(' ')
disp(' ---- D < 0 �ƂȂ� kI �̏����i�� p �����f���ƂȂ�����j ---- ')
simplify(D < 0)

disp(' ')
disp(' ---- D < 0 �ł���Ƃ��̋� p �̋����̑傫�� ---- ')
imag_p = sqrt(-D)/(2*c(1))

% =========================
kI_min = solve(D);

figure(1)
movegui('north')

fplot(imag_p,[double(kI_min) 5],'LineWidth',1.5)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('${k}_{\rm I}$','Interpreter','latex','FontSize',14)
ylabel('$|{\rm Im}[p]|$','Interpreter','latex','FontSize',14)

grid on


% -----------------------------------------------
disp(' ')
disp(' ***** ��� 6.4 (2) ********************')

disp(' ')
disp(' ---- C(s) ---- ')
kP = 4
kI = 2
Cs = kP + kI/s

disp(' ')
disp(' ---- Gyr(s) ---- ')
Gyr = collect(Ps*Cs/(1 + Ps*Cs),s)

[numGyr denGyr] = numden(Gyr);

disp(' ')
disp(' ---- Gyr(s) �̋� ---- ')
p = solve(denGyr,s)

disp(' ')
disp(' ---- Gyr(s) �̗�_ ---- ')
z = solve(numGyr,s)


% -----------------------------------------------
disp(' ')
disp(' ***** ��� 6.4 (3) ********************')

disp(' ')
disp(' ---- r(s) = 1/s (r(t) = 1) ---- ')
rs = 1/s

disp(' ')
disp(' ---- y(s) ---- ')
ys = Gyr*rs

disp(' ')
disp(' ---- y(t) ---- ')
yt = ilaplace(ys)

disp(' ')
disp(' ---- dy(t)/dt ---- ')
dyt = diff(yt)

disp(' ')
disp(' ---- dy(t)/dt = 0 �̉��i�s���߂����ԁjt = Tp ---- ')
assume(t > 0)
Tp = solve(dyt,t)

disp(' ')
disp(' ---- ���l yinf ---- ')
yinf = subs(Gyr,s,0)

disp(' ')
disp(' ---- �ő�l ymax = y(Tp) ---- ')
ymax = subs(yt,t,Tp)

disp(' ')
disp(' ---- �I�[�o�[�V���[�g Amax ---- ')
Amax = ymax - yinf

% =========================
figure(2)
movegui('south')

fplot(subs(yt,kI,2),[0 5],'LineWidth',1.5)
hold on
plot(Tp,ymax,'.','MarkerSize',30)
hold off

set(gca,'FontSize',12,'FontName','Arial')

ylim([0 1.5])

title('${k}_{\rm P} = 4$, ${k}_{\rm I} = 2$ ($r(t) = 1$, $d(t) = 0$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

grid on

