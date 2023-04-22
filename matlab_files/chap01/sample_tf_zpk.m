% 伝達関数の形式の変換（関数 tf, zpk の使用例）

clear
format compact

sysP1 = tf([4 8],[1 2 -15 0])
sysP2 = zpk(sysP1)
sysP3 = tf(sysP2)