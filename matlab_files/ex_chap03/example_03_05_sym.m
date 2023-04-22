% example_03_05_sym.m
% �� 3.5
% ��_�����V�X�e���̉ߓn����
% �ySymbolic Math Toolbox�z

close all

clear
format compact

disp(' ')
disp(' ***** �� 3.5 ********************')

syms s
syms t real
syms k real

disp(' ')
disp(' ---- ��_�����V�X�e���̓`�B�֐� ----')
Ps = (k*s + 2)/((s + 1)*(s + 2))

[numP denP] = numden(Ps);
disp(' ')
disp(' ---- P(s) �̋� ----')
solve(denP,s)
disp(' ---- P(s) �̗�_ ----')
solve(numP,s)
disp(' ')

ut = sym(1)
us = laplace(ut)
ys = Ps*us

disp(' ')
disp(' ----�P�ʃX�e�b�v���� y(t) ----')
yt = ilaplace(ys)

disp(' ')
disp(' ---- ���l yinf ----')
yinf = subs(Ps,s,0)

disp(' ')
disp(' ----�P�ʃX�e�b�v���� y(t) �̎��Ԕ��� dy(t)/dt ----')
dyt = simplify(diff(yt))

disp(' ')
disp(' ---- dy(t)/dt = 0 �̉� t = Tp ----')
assume(t > 0);
[Tp params conds] = solve(dyt, t, 'ReturnConditions', true);
Tp

conds = simplify(conds);
sol = solve(conds, k, 'ReturnConditions', true);
subs(sol.conditions,k)
disp(' .......... Tp > 0 �����݂��� k �͈̔�')

disp(' ')
disp(' ---- y(Tp) ----')
y_Tp = simplify(subs(yt,t,Tp))

disp(' ')
disp(' ---- �I�[�o�[�V���[�g Amax = y(Tp) - yinf ----')
Amax = simplify(y_Tp - yinf)

conds2 = simplify(conds & y_Tp > 0);
sol2 = solve(conds2, k, 'ReturnConditions', true);
subs(sol2.conditions,k)
disp(' .......... �I�[�o�[�V���[�g Amax �𐶂��� k �͈̔́iy(Tp) > 0�j')

disp(' ')
disp(' ---- �t�Ԃ�̍ŏ��l ymin = y(Tp) ----')
ymin = y_Tp

conds2 = simplify(conds & y_Tp < 0);
sol2 = solve(conds2, k, 'ReturnConditions', true);
subs(sol2.conditions,k)
disp(' .......... �t�Ԃ� ymin �𐶂��� k �͈̔́iy(Tp) < 0�j')


% ------------------------------------------------------------
for kk = -1:3 
    figure(1)
    fplot(subs(yt,k,kk),[0 5],'LineWidth',1.5)
    hold on
end   
for kk = -1:3 
    figure(1)  
    if limit(Tp,k,kk) > 0
        plot(subs(Tp,k,kk),subs(y_Tp,k,kk),'k.','MarkerSize',25)
        hold on
    end
end
hold off   

ylim([-0.25 1.25])
set(gca,'YTick',-0.25:0.25:1.25)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 3.8','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$y(t)$','Interpreter','latex','FontSize',14)

grid on

legend('$k = -1$', ...
       '$k = 0$', ...
       '$k = 1$', ...
       '$k = 2$', ...
       '$k = 3$')
set(legend,'Location','SouthEast')
set(legend,'Interpreter','latex','FontSize',14)


   