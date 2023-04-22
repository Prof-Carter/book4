% sample_feedback_connection2.m
% フィードバック結合（関数 feedback の使用例）

clear
format compact

sysP1 = tf([1],[1 2])
sysP2 = tf([2],[10 1])

sysP = feedback(sysP1,sysP2)