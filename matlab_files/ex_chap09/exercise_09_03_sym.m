% exercise_09_03.m
% –â‘è 9.3
% ‘JˆÚs—ñ
% ySymbolic Math Toolboxz

close all

clear
format compact

disp(' ')
disp(' ***** –â‘è 9.3 ********************')

% --------------------------------------------------
syms s
syms x10 x20 real

disp(' ')
disp(' ---- A s—ñ ---- ')
A = [  0   1
      -6  -5 ]

disp(' ')
disp(' ---- ‘JˆÚs—ñ exp(A*t) ---- ')
n = length(A);
eAt = ilaplace(inv(s*eye(n) - A))

disp(' ')
disp(' ---- —ë“ü—ÍŒn‚Ì‰ğ x(t) = exp(A*t)*x0 ---- ')
x0 = [ x10
       x20 ];
xt = eAt*x0

% --------------------------------------------------
x1 = subs(xt(1),{x10,x20},{1,0});
x2 = subs(xt(2),{x10,x20},{1,0});

% --------------------------------------------------
figure(1)
movegui('north')

fplot(x1,[0 5],'LineWidth',1.5)

ylim([-0.5 1.5])
set(gca,'YTick',-0.5:0.5:1.5)

set(gca,'FontSize',12,'FontName','Arial')

title('$x(0) = [\begin{array}{cc} 1 & 0 \end{array}]^{\top}$','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{1}(t)$','Interpreter','latex','FontSize',14)

grid on

% --------------------------------------------------
figure(2)
movegui('south')

fplot(x2,[0 5],'LineWidth',1.5)

ylim([-1 0.5])
set(gca,'YTick',-1:0.5:0.5)

set(gca,'FontSize',12,'FontName','Arial')

title('$x(0) = [\begin{array}{cc} 1 & 0 \end{array}]^{\top}$','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{2}(t)$','Interpreter','latex','FontSize',14)

grid on


