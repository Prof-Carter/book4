% sample_hurwitz1.m
% ��� 3.3 (1)�F�ȗ��������t���r�b�c�̈��蔻�ʖ@�iM �t�@�C�� hurwitz.m �̎g�p��j

clear
format compact

sysP = tf([1 10],[1 1 4 30])
[numP denP] = tfdata(sysP,'v');
hurwitz