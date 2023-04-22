% sample_obsv
% システムの可観測性（関数 obsv の使用例）

arm_ss

disp('*********** 可観測行列 Vo ***********')
Vo = obsv(A,C)

disp('*********** |Vo| の計算 ***********')
det(Vo)

disp('*********** rank(Vo) の計算 ***********')
rank(Vo)

