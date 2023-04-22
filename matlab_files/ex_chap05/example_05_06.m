% example_05_06.m
% �� 5.6
% �t�B�[�h�o�b�N����n�̓������萫�̔��ʁi�s����ȋɗ둊�E�j

disp(' ')
disp(' ***** �� 5.6 (1) ********************')

clear
format compact

sysP = tf([1],[1 -1]);
sysC = tf([1 -1],[1 1]);

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
disp(' ----- Gyr(s), Gyd(s), Gur(s), Gud(s) -----')
sysPC = minreal(sysP*sysC);

sysGyr = minreal(  sysPC/(1 + sysPC))
sysGyd = minreal(  sysP /(1 + sysPC))
sysGur = minreal(  sysC /(1 + sysPC))
sysGud = minreal(- sysPC/(1 + sysPC))

disp(' ')
disp(' ***** �� 5.6 (2) ********************')

clear
format compact

sysP = tf([1 -1],[1 1]);
sysC = tf([1],[1 -1]);

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
disp(' ----- Gyr(s), Gyd(s), Gur(s), Gud(s) -----')
sysPC = minreal(sysP*sysC);

sysGyr = minreal(  sysPC/(1 + sysPC))
sysGyd = minreal(  sysP /(1 + sysPC))
sysGur = minreal(  sysC /(1 + sysPC))
sysGud = minreal(- sysPC/(1 + sysPC))


