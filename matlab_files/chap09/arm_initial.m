% arm_initial
% �����ʂ���]����A�[���̗���͉����i�֐� initial �̎g�p��j

close all

clear
format compact

arm_para

A = [    0       1
     -M*g*l/J  -c/J ];
C = [ 1  0 ];
sys0 = ss(A,[],C,[]);

x0 = [ 1  0 ]';

figure(1)
initial(sys0,x0)
