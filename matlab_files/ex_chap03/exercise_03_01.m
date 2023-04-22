% exercise_03_01.m
% ��� 3.1
% ���萫���ʂƒP�ʃX�e�b�v�����̒��l

clear
format compact

% -------------------------------------------------------
disp(' ')
disp(' ***** ��� 3.1 (1) ********************')
s = tf('s');
sysP = 1/((s + 1)*(s + 2))

pole_P = pole(sysP)

if real(pole_P) < 0
    disp('�@=====> ����')
    [numP denP] = tfdata(sysP,'v');
    yinf = numP(end)/denP(end)
else
    disp('�@=====> �s����')
end

% -------------------------------------------------------
disp(' ')
disp(' ***** ��� 3.1 (2) ********************')
s = tf('s');
sysP = (s + 1)/((s - 1)*(s + 2))

pole_P = pole(sysP)

if real(pole_P) < 0
    disp('�@=====> ����')
    [numP denP] = tfdata(sysP,'v');
    yinf = numP(end)/denP(end)
else
    disp('�@=====> �s����')
end

% -------------------------------------------------------
disp(' ')
disp(' ***** ��� 3.1 (3) ********************')
s = tf('s');
sysP = 1/(s^2 - 2*s + 2)

pole_P = pole(sysP)

if real(pole_P) < 0
    disp('�@=====> ����')
    [numP denP] = tfdata(sysP,'v');
    yinf = numP(end)/denP(end)
else
    disp('�@=====> �s����')
end

% -------------------------------------------------------
disp(' ')
disp(' ***** ��� 3.1 (4) ********************')
s = tf('s');
sysP = (-s + 2)/((s + 1)*(s^2 + 2*s + 2))

pole_P = pole(sysP)

if real(pole_P) < 0
    disp('�@=====> ����')
    [numP denP] = tfdata(sysP,'v');
    yinf = numP(end)/denP(end)
else
    disp('�@=====> �s����')
end
    