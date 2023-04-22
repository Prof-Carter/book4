% peak_2nd_01_sym.m
% 2 Ÿ’x‚ê—v‘f‚Ì‹¤Uƒs[ƒN

close all

clear
format compact

syms s
syms w positive
syms eta positive
syms wn zeta positive

% -------------------------------------------------------
disp(' ')
disp(' ---- 2 Ÿ’x‚ê—v‘f P(s) ---- ')
Ps = wn^2/(s^2 + 2*zeta*wn*s + wn^2)

disp(' ')
disp(' ---- ü”g”“`’BŠÖ” P(jw) ---- ')
Pjw = subs(Ps,s,1i*w)

disp(' ')
disp(' ---- eta = w/wn ‚Æ‚¨‚¢‚½‚Æ‚«‚Ì P(jw) ---- ')
Pjw = simplify(subs(Pjw,w,wn*eta))


disp(' ')
disp(' ---- P(jw) = 1/( f(eta) )^(1/2) ---- ')
[num den] = numden(Pjw);
% f_square = abs(den);
f_square = sqrt(real(den)^2 + imag(den)^2);
f_square = simplify(f_square);
f  = f_square^2

disp(' ')
disp(' ---- f''(eta) ---- ')
df = diff(f,eta);
df = prod(factor(df,eta))

disp(' ')
disp(' ---- f''(eta) = 0 ‚Ì‰ğ eta = eta_p ---- ')
sol = solve(df,eta,'ReturnConditions',true);
eta_p = sol.eta

disp(' ')
disp(' ---- eta_p ‚ª‘¶İ‚·‚é zeta ‚Ì”ÍˆÍ ---- ')
cond  = sol.conditions;
sol_cond = solve(cond,'ReturnConditions',true);
subs(sol_cond.conditions,zeta)

disp(' ')
disp(' ---- fmin = f(eta_p) ---- ')
fmin = simplify(subs(f,eta,eta_p))

disp(' ')
disp(' ---- ƒs[ƒNŠpü”g” wp = wn*eta_p ---- ')
wp = wn*eta_p

disp(' ')
disp(' ---- ‹¤Uƒs[ƒN Gg(wp) ---- ')
% abs_Pjw = abs(Pjw)
abs_Pjw = sqrt(real(Pjw)^2 + imag(Pjw)^2);
abd_Pjw = simplify(abs_Pjw)
Mp = subs(abs_Pjw,eta,eta_p);
Mp = simplify(Mp)


% -------------------------------------------------------
figure(1)
movegui('north')

figure(1)
fplot(subs(f,zeta,0.25),[0 1.5],'LineWidth',1.5)
hold on
fplot(subs(f,zeta,0.25),[-1.5 0],'--','LineWidth',1.5)

plot(subs(wp,{zeta,wn},{0.25,1}),subs(fmin,zeta,0.25),'.','MarkerSize',25)
hold off

xlim([-1.5 1.5])
set(gca,'XTick',-1.5:0.5:1.5)
ylim([0 2.5])
set(gca,'YTick',0:0.5:2.5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.17 (a) ($0 < \eta < 1/\sqrt{2}$)','Interpreter','latex','FontSize',14)
xlabel('$\eta = \omega/{\omega}_{\rm n}$','Interpreter','latex','FontSize',14)
ylabel('$f(\eta)$','Interpreter','latex','FontSize',14)

grid on

% -------------------------------------------------------
figure(2)
movegui('south')

figure(2)
fplot(subs(f,zeta,2),[0 0.4],'LineWidth',1.5)
hold on
fplot(subs(f,zeta,2),[-0.4 0],'--','LineWidth',1.5)
hold off

xlim([-0.4 0.4])
set(gca,'XTick',-0.4:0.2:0.4)
ylim([0 2.5])
set(gca,'YTick',0:0.5:2.5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 7.17 (b) ($\eta \ge 1/\sqrt{2}$)','Interpreter','latex','FontSize',14)
xlabel('$\eta = \omega/{\omega}_{\rm n}$','Interpreter','latex','FontSize',14)
ylabel('$f(\eta)$','Interpreter','latex','FontSize',14)

grid on


