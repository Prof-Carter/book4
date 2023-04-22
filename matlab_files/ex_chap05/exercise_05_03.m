% exercise_05_03.m
% ��� 5.3
% �t�B�[�h�o�b�N����n�̓������萫�̔���

disp(' ')
disp(' ***** ��� 5.3 (1) ********************')

clear
format compact

s = tf('s');
sysP = 1/((s - 1)*(s + 2));
sysC = tf([1],[1]);

[numP denP] = tfdata(sysP,'v');
[numC denC] = tfdata(sysC,'v');

disp(' ')
disp(' ----- ���������� ��(s) = 0 �̉� -----')
Delta = conv(denP,denC) + conv(numP,numC);
sysDelta = tf(Delta,[1])
sol = roots(Delta)

if real(sol) < 0
    disp('===> ��������ł���')
else
    disp('===> ��������ł͂Ȃ�')
end

disp(' ')
disp(' ***** ��� 5.3 (2) ********************')

clear
format compact

s = tf('s');
sysP = (s + 1)/((s + 2)*(s + 3));
sysC = 1/(s + 1);

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

disp(' ')
disp(' ***** ��� 5.3 (3) ********************')

clear
format compact

s = tf('s');
sysP = (s - 1)/(s^2 + 3*s + 1);
sysC = 1/(s - 1);

[numP denP] = tfdata(sysP,'v');
[numC denC] = tfdata(sysC,'v');

disp(' ')
disp(' ----- ���������� ��(s) = 0 �̉� -----')
Delta = conv(denP,denC) + conv(numP,numC);
sysDelta = tf(Delta,[1])
sol = roots(Delta)

if real(sol) < 0
    disp('===> ��������ł���')
else
    disp('===> ��������ł͂Ȃ�')
end
