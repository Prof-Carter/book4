% example_05_05.m
% �� 5.5
% �t�B�[�h�o�b�N����n�̓������萫�̔���

disp(' ')
disp(' ***** �� 5.5 ********************')

clear
format compact

sysP = tf([1],[1 -1]);
sysC = tf([2 1],[1 0]);

[numP denP] = tfdata(sysP,'v');
[numC denC] = tfdata(sysC,'v');

disp(' ')
disp(' ----- ���������� ��(s) -----')
Delta = conv(denP,denC) + conv(numP,numC);
sysDelta = tf(Delta,[1])

disp(' ')
disp(' ----- ���������� ��(s) = 0 �̉� -----')
sol = roots(Delta)

if real(sol) < 0
    disp('===> ��������ł���')
else
    disp('===> ��������ł͂Ȃ�')
end
