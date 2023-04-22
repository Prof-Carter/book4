% 伝達関数の極，零点（関数 pole, zero, tzero の使用例）

clear
format compact

sysP = tf([4 8],[1 2 -15 0])
pole(sysP)
zero(sysP)
tzero(sysP)