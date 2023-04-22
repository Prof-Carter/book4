% exercise_09_05.m
% ��� 9.5
% ��ԃt�B�[�h�o�b�N����F�ɔz�u�i�֐� acker�j�Ǝ��ԉ����̕`��i�֐� initial�j

clear
format compact

disp(' ')
disp(' ***** ��� 9.5 ********************')
% --------------------------------------------------
t = 0:0.001:5;
x0 = [ 1
       0 ];

% --------------------------------------------------
disp(' ')
disp(' ---- A, B �s�� ---- ')
A = [ 0  2
      1  3 ]
B = [ -1
       1 ]
n = length(A);

% --------------------------------------------------
disp(' ')
disp(' ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ ')
disp(' ---- �w�肷��� p �Ɛ݌v���ꂽ��ԃt�B�[�h�o�b�N�Q�C�� K ---- ')
p = [ -2+j
      -2-j ]
K = - acker(A,B,p)

sys = ss(A+B*K,[],eye(n),[]);

x = initial(sys,x0,t);

% --------------------------------------------------
figure(1)
movegui('north')

plot(t,x(:,1),'LineWidth',1.5)

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

plot(t,x(:,2),'LineWidth',1.5)

ylim([-0.5 0.25])
set(gca,'YTick',-0.5:0.25:0.25)

set(gca,'FontSize',12,'FontName','Arial')

title('$x(0) = [\begin{array}{cc} 1 & 0 \end{array}]^{\top}$','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{2}(t)$','Interpreter','latex','FontSize',14)

grid on


