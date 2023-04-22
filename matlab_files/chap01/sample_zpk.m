% 零点・極・ゲイン形式の伝達関数の定義（関数 zpk の使用例）

clear
format compact

z = [-2];
p = [-5 0 3];
K = 4;
sysP = zpk(z,p,K)