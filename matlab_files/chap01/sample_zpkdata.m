% 伝達関数の零点，極，ゲインの抽出（関数 zpkdata の使用例）

clear
format compact

sysP = tf([4 8],[1 2 -15 0])
[z p K] = zpkdata(sysP,'v')