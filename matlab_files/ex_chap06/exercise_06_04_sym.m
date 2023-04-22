% exercise_06_04_sym.m
% 問題 6.4
% PI 制御
% 【Symbolic Math Toolbox】

close all

clear
format compact

syms s
syms t real
syms kI positive

% -----------------------------------------------
disp(' ')
disp(' ***** 問題 6.4 (1) ********************')

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
disp(' ---- Gyr(s) の極 p ---- ')
[numGyr denGyr] = numden(Gyr)
p = solve(denGyr)

disp(' ')
disp(' ---- Gyr(s) 分母 c(1)*s^2 + c(2)*s + c(3) の係数 c ---- ')
c = coeffs(denGyr,s);
c = fliplr(c)

disp(' ')
disp(' ---- 判別式 D = c(2)^2 - 4*c(1)*c(3) ---- ')
D = c(2)^2 - 4*c(1)*c(3)


disp(' ')
disp(' ---- D < 0 となる kI の条件（極 p が複素数となる条件） ---- ')
simplify(D < 0)

disp(' ')
disp(' ---- D < 0 であるときの極 p の虚部の大きさ ---- ')
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
disp(' ***** 問題 6.4 (2) ********************')

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
disp(' ---- Gyr(s) の極 ---- ')
p = solve(denGyr,s)

disp(' ')
disp(' ---- Gyr(s) の零点 ---- ')
z = solve(numGyr,s)


% -----------------------------------------------
disp(' ')
disp(' ***** 問題 6.4 (3) ********************')

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
disp(' ---- dy(t)/dt = 0 の解（行き過ぎ時間）t = Tp ---- ')
assume(t > 0)
Tp = solve(dyt,t)

disp(' ')
disp(' ---- 定常値 yinf ---- ')
yinf = subs(Gyr,s,0)

disp(' ')
disp(' ---- 最大値 ymax = y(Tp) ---- ')
ymax = subs(yt,t,Tp)

disp(' ')
disp(' ---- オーバーシュート Amax ---- ')
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

