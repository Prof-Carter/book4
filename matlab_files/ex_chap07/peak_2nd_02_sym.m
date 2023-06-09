% peak_2nd_02_sym.m
% 2 次遅れ要素の共振ピーク

close all

clear
format compact

syms s
syms w positive
syms eta positive
syms wn zeta positive

% -------------------------------------------------------
disp(' ')
disp(' ---- 2 次遅れ要素 P(s) ---- ')
Ps = wn^2/(s^2 + 2*zeta*wn*s + wn^2)

disp(' ')
disp(' ---- 周波数伝達関数 P(jw) ---- ')
Pjw = subs(Ps,s,1i*w)

disp(' ')
disp(' ---- eta = w/wn とおいたときの P(jw) ---- ')
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
disp(' ---- f''(eta) = 0 の解 eta = eta_p ---- ')
sol = solve(df,eta,'ReturnConditions',true);
eta_p = sol.eta

disp(' ')
disp(' ---- eta_p が存在する zeta の範囲 ---- ')
cond  = sol.conditions;
sol_cond = solve(cond,'ReturnConditions',true);
subs(sol_cond.conditions,zeta)

disp(' ')
disp(' ---- fmin = f(eta_p) ---- ')
fmin = simplify(subs(f,eta,eta_p))

disp(' ')
disp(' ---- ピーク角周波数 wp = wn*eta_p ---- ')
wp = wn*eta_p

disp(' ')
disp(' ---- 共振ピーク Gg(wp) ---- ')
% abs_Pjw = abs(Pjw)
abs_Pjw = sqrt(real(Pjw)^2 + imag(Pjw)^2);
abd_Pjw = simplify(abs_Pjw)
Mp = subs(abs_Pjw,eta,eta_p);
Mp = simplify(Mp)


% -------------------------------------------------------
num = 0;
for zeta_data = 0.1:0.1:0.7
    num = num + 1;
    
    ff = subs(f,zeta,zeta_data);
    
    figure(1)
    h1(num) = fplot(ff,[-1.5 1.5],'LineWidth',1.5);
    hold on
    
    txt(num) = {strcat('$\zeta = ',num2str(zeta_data),'$')};    
end

for zeta_data = 0.1:0.1:0.7
    h2(num) = plot(subs(wp,{zeta,wn},{zeta_data,1}),subs(fmin,zeta,zeta_data),'.','MarkerSize',25);
end

figure(1)
movegui('north')
hold off

xlim([-1.5 1.5])
set(gca,'XTick',-1.5:0.5:1.5)
ylim([0 2.5])
set(gca,'YTick',0:0.5:2.5)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('$\eta = \omega/{\omega}_{\rm n}$','Interpreter','latex','FontSize',14)
ylabel('$f(\eta)$','Interpreter','latex','FontSize',14)

legend(h1,txt)
set(legend,'Location','North','NumColumns',2)
set(legend,'Interpreter','latex','FontSize',14)

grid on

% -------------------------------------------------------
figure(2)
movegui('south')
fplot(Mp,[0 0.7],'LineWidth',1.5)
xlim([0 0.7])
ylim([0 10])

set(gca,'FontSize',12,'FontName','Arial')

title('$0 < \zeta < 1/\sqrt{2} \simeq 0.7071$','Interpreter','latex','FontSize',14)
xlabel('$\zeta$','Interpreter','latex','FontSize',14)
ylabel('${M}_{\rm p}$','Interpreter','latex','FontSize',14)

grid on



