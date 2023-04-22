% exercise_09_04.m
% ��� 9.4
% ���䐫�C�ϑ����̔���

clear
format compact

s = tf('s');

disp(' ')
disp(' ***** ��� 9.4 ********************')

A = [ 0   1
     -6  -5 ]
B = [ 0
      1 ]
C = [ 1   0 ]

% --------------------------------------------------
disp(' ')
disp(' ---- ���䐫�s�� Vc ---- ')
Vc = ctrb(A,B)

disp(' ')
disp(' ---- rank Vc ---- ')
rank_Vc = rank(Vc)
n = length(A)

disp(' ')
disp(' ---- |Vc| ---- ')
det_Vc  = det(Vc)

disp(' ')
if det_Vc == 0
    disp('�@===> ����ł͂Ȃ�')
else
    disp('�@===> ����ł���')
end

% --------------------------------------------------
disp(' ')
disp(' ---- �ϑ����s�� Vo ---- ')
Vo = obsv(A,C)

disp(' ')
disp(' ---- rank Vo ---- ')
rank_Vo = rank(Vo)
n = length(A)

disp(' ')
disp(' ---- |Vo| ---- ')
det_Vo  = det(Vo)

disp(' ')
if det_Vo == 0
    disp('�@===> �ϑ��ł͂Ȃ�')
else
    disp('�@===> �ϑ��ł���')
end

