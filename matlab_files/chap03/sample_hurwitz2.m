% sample_hurwitz2.m
% ��� 3.3 (2)�F�ȗ��������t���r�b�c�̈��蔻�ʖ@�iM �t�@�C�� hurwitz.m �̎g�p��j

clear
format compact

sysP = tf([1 3 2],[1 4 11 14 10])
[numP denP] = tfdata(sysP,'v');
hurwitz