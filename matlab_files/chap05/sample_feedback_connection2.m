% sample_feedback_connection2.m
% �t�B�[�h�o�b�N�����i�֐� feedback �̎g�p��j

clear
format compact

sysP1 = tf([1],[1 2])
sysP2 = tf([2],[10 1])

sysP = feedback(sysP1,sysP2)