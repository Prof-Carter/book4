% example_09_06_sym.m
% �� 9.6
% ���ʌn�̉ϑ����̔���
% �ySymbolic Math Toolbox�z

clear
format compact

syms a11 a21 a22 b1 b2 real

% --------------------------------------------------
disp(' ')
disp(' ***** �� 9.6�i���� 1�j********************')

disp(' ')
disp(' ---- A �s�� ---- ')
A = [ a11  0
      a21  a22 ]
  
disp(' ')
disp(' ---- B �s�� ---- ')
B = [ b1
      0 ]

disp(' ')
disp(' ---- C �s�� ---- ')
C = [ 0  1 ]
  
disp(' ')
disp(' ---- �ϑ����s�� Vo ---- ')
Vo = [ C
       C*A ]

disp(' ')
disp(' ---- |Vo| ---- ')
det_Vo = det(Vo)

disp(' ')
if det_Vo == 0
    disp('�@===> �ϑ��ł͂Ȃ�')
else
    disp('�@===> �ϑ��ł���')
end

% --------------------------------------------------
disp(' ')
disp(' ***** �� 9.6�i���� 2�j********************')

disp(' ')
disp(' ---- A �s�� ---- ')
A = [ a11  0
      a21  a22 ]
  
disp(' ')
disp(' ---- B �s�� ---- ')
B = [ b1
      0 ]

disp(' ')
disp(' ---- C �s�� ---- ')
C = [ 1  0 ]
  
disp(' ')
disp(' ---- �ϑ����s�� Vo ---- ')
Vo = [ C
       C*A ]

disp(' ')
disp(' ---- |Vo| ---- ')
det_Vo = det(Vo)

disp(' ')
if det_Vo == 0
    disp('�@===> �ϑ��ł͂Ȃ�')
else
    disp('�@===> �ϑ��ł���')
end
