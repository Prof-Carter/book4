% 伝達関数の分子多項式，分母多項式の係数の抽出（関数 tfdata の使用例）

clear
format compact

sysP = tf([4 8],[1 2 -15 0])
[numP denP] = tfdata(sysP,'v')