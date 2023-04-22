% example_09_04.m
% ó· 9.4
% óÎì¸óÕånÇÃâÇÃï`âÊÅiä÷êî initialÅj

close all

clear
format compact

A = [  0    1
      -10  -2 ];
sysP = ss(A,[],eye(2),[])

x0 = [ 1
       0 ];
   
t = 0:0.001:5;

x = initial(sysP,x0,t);

figure(1)
movegui('north')

plot(t,x(:,1),'LineWidth',1.5)

ylim([-0.5 1.5])
set(gca,'YTick',-0.5:0.5:1.5)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 9.3 ($x(0) = [\begin{array}{cc} 1 & 0 \end{array}]^{\top}$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{1}(t)$ [m]','Interpreter','latex','FontSize',14)

grid on

% --------------------------------------------------
figure(2)
movegui('south')

plot(t,x(:,2),'LineWidth',1.5)

ylim([-3 1])
set(gca,'YTick',-3:1:1)

set(gca,'FontSize',12,'FontName','Arial')

title('Fig. 9.3 ($x(0) = [\begin{array}{cc} 1 & 0 \end{array}]^{\top}$)','Interpreter','latex','FontSize',14)
xlabel('$t$ [s]','Interpreter','latex','FontSize',14)
ylabel('${x}_{2}(t)$ [m/s]','Interpreter','latex','FontSize',14)

grid on


