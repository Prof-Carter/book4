% example_09_08.m
% �� 9.8
% �����ʂ���]����A�[���n�̏�ԃt�B�[�h�o�b�N����
% �F�œK���M�����[�^�i�֐� lqr�j�Ǝ��ԉ����̕`��i�֐� initial�j


close all

clear
format compact

disp(' ')
disp(' ***** �� 9.8 ********************')
% --------------------------------------------------
t = 0:0.0001:1;
x0 = [ 1
       0 ];
   
% --------------------------------------------------
arm_para

a0 = M*g*l/J;
a1 = c/J;
b0 = 1/J;

disp(' ')
disp(' ---- A, B �s�� ---- ')
A = [ 0    1
     -a0  -a1 ]
B = [ 0
      b0 ]
n = length(A);

% --------------------------------------------------
q2 = 0.001;    
for q1 = [5 20 80]
    disp(' ')
    disp(' ---- �d�� Q, R �Ɛ݌v���ꂽ��ԃt�B�[�h�o�b�N�Q�C�� K ---- ')

    Q = diag([q1 q2])
    R = 1
    K = - lqr(A,B,Q,R)

    sys = ss(A+B*K,[],eye(n),[]);

    x = initial(sys,x0,t);

    figure(1)
    plot(t,x(:,1),'LineWidth',1.5)
    hold on

    figure(2)
    plot(t,x(:,2),'LineWidth',1.5)
    hold on
    
    u = K*x';
    figure(3)
    plot(t,u,'LineWidth',1.5)
    hold on
end

% --------------------------------------------------
figure(1)
movegui('northwest')
hold off


ylim([-0.5 1.5])
set(gca,'YTick',-0.5:0.5:1.5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 9.8 ($Q = {\rm diag}\{{q}_{1},\,0.001\}$, $R = 1$, $x(0) = [\begin{array}{cc} 1 & 0 \end{array}]^{\top}$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{1}(t)$ [rad]','Interpreter','latex','FontSize',14)

legend('${q}_{1} = 5$','${q}_{1} = 20$','${q}_{1} = 80$')
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

% --------------------------------------------------
figure(2)
movegui('southwest')
hold off

ylim([-5 2.5])
set(gca,'YTick',-5:2.5:2.5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 9.8 ($Q = {\rm diag}\{{q}_{1},\,0.001\}$, $R = 1$, $x(0) = [\begin{array}{cc} 1 & 0 \end{array}]^{\top}$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{2}(t)$ [rad/s]','Interpreter','latex','FontSize',14)

legend('${q}_{1} = 5$','${q}_{1} = 20$','${q}_{1} = 80$')
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on

% --------------------------------------------------
figure(3)
movegui('north')
hold off

ylim([-10 5])
set(gca,'YTick',-10:5:5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 9.8 ($Q = {\rm diag}\{{q}_{1},\,0.001\}$, $R = 1$, $x(0) = [\begin{array}{cc} 1 & 0 \end{array}]^{\top}$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('$u(t)$ [N$\cdot$m]','Interpreter','latex','FontSize',14)

legend('${q}_{1} = 5$','${q}_{1} = 20$','${q}_{1} = 80$')
set(legend,'Location','NorthEast')
set(legend,'Interpreter','latex','FontSize',14)

grid on


