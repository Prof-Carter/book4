% 伝達関数の定義（関数 tf の使用例）
clear
format compact

numP = [4 8];
denP = [1 2 -15 0];
sysP = tf(numP,denP)