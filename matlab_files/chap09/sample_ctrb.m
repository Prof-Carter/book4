% sample_ctrb
% システムの可制御性（関数 ctrb の使用例）

arm_ss

disp('*********** 可制御行列 Vc ***********')
Vc = ctrb(A,B)

disp('*********** |Vc| の計算 ***********')
det(Vc)

disp('*********** rank(Vc) の計算 ***********')
rank(Vc)

