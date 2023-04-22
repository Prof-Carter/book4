% sample_feedback_connection1.m
% フィードバック結合（関数 minreal の使用例）

clear
format compact

sysP1 = tf([1],[1 2])
sysP2 = tf([2],[10 1])

sysP = sysP1/(1 + sysP1*sysP2)
[z p] = zpkdata(sysP,'v')

sysP = minreal(sysP1/(1 + sysP1*sysP2))
[z p] = zpkdata(sysP,'v')


% P1(s) と P2(s) とで極零相殺がある場合は以下のように入力
% sysP = minreal(sysP1/(1 + minreal(sysP1*sysP2)))
% [z p] = zpkdata(sysP,'v')
