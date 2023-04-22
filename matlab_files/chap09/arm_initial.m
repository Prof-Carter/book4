% arm_initial
% 鉛直面を回転するアームの零入力応答（関数 initial の使用例）

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
