% ラプラス演算子および伝達関数の定義（関数 tf の使用例）

clear
format compact

s = tf('s'); 
sysP = (4*s + 8)/(s^3 + 2*s^2 - 15*s)