% example_09_05_sym.m
% �� 9.5
% ���ʌn�̉��䐫�̔���
% �ySymbolic Math Toolbox�z

clear
format compact

syms a11 a21 a22 b1 b2 real

% --------------------------------------------------
disp(' ')
disp(' ***** �� 9.5�i���� 1�j********************')

disp(' ')
disp(' ---- A �s�� ---- ')
A = [ a11  0
      a21  a22 ]
  
disp(' ')
disp(' ---- B �s�� ---- ')
B = [ b1
      0 ]

disp(' ')
disp(' ---- ���䐫�s�� Vc ---- ')
Vc = [ B  A*B ]

disp(' ')
disp(' ---- |Vc| ---- ')
det_Vc = det(Vc)

disp(' ')
if det_Vc == 0
    disp('�@===> ����ł͂Ȃ�')
else
    disp('�@===> ����ł���')
end

% --------------------------------------------------
disp(' ')
disp(' ***** �� 9.5�i���� 2�j********************')

disp(' ')
disp(' ---- A �s�� ---- ')
A = [ a11  0
      a21  a22 ]
  
disp(' ')
disp(' ---- B �s�� ---- ')
B = [ 0
      b2 ]

disp(' ')
disp(' ---- ���䐫�s�� Vc ---- ')
Vc = [ B  A*B ]

disp(' ')
disp(' ---- |Vc| ---- ')
det_Vc = det(Vc)

disp(' ')
if det_Vc == 0
    disp('�@===> ����ł͂Ȃ�')
else
    disp('�@===> ����ł���')
end
