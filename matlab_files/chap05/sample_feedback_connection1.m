% sample_feedback_connection1.m
% �t�B�[�h�o�b�N�����i�֐� minreal �̎g�p��j

clear
format compact

sysP1 = tf([1],[1 2])
sysP2 = tf([2],[10 1])

sysP = sysP1/(1 + sysP1*sysP2)
[z p] = zpkdata(sysP,'v')

sysP = minreal(sysP1/(1 + sysP1*sysP2))
[z p] = zpkdata(sysP,'v')


% P1(s) �� P2(s) �Ƃŋɗ둊�E������ꍇ�͈ȉ��̂悤�ɓ���
% sysP = minreal(sysP1/(1 + minreal(sysP1*sysP2)))
% [z p] = zpkdata(sysP,'v')
