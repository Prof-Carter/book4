% example_09_06_sym.m
% 例 9.6
% 水位系の可観測性の判別
% 【Symbolic Math Toolbox】

clear
format compact

syms a11 a21 a22 b1 b2 real

% --------------------------------------------------
disp(' ')
disp(' ***** 例 9.6（その 1）********************')

disp(' ')
disp(' ---- A 行列 ---- ')
A = [ a11  0
      a21  a22 ]
  
disp(' ')
disp(' ---- B 行列 ---- ')
B = [ b1
      0 ]

disp(' ')
disp(' ---- C 行列 ---- ')
C = [ 0  1 ]
  
disp(' ')
disp(' ---- 可観測性行列 Vo ---- ')
Vo = [ C
       C*A ]

disp(' ')
disp(' ---- |Vo| ---- ')
det_Vo = det(Vo)

disp(' ')
if det_Vo == 0
    disp('　===> 可観測ではない')
else
    disp('　===> 可観測である')
end

% --------------------------------------------------
disp(' ')
disp(' ***** 例 9.6（その 2）********************')

disp(' ')
disp(' ---- A 行列 ---- ')
A = [ a11  0
      a21  a22 ]
  
disp(' ')
disp(' ---- B 行列 ---- ')
B = [ b1
      0 ]

disp(' ')
disp(' ---- C 行列 ---- ')
C = [ 1  0 ]
  
disp(' ')
disp(' ---- 可観測性行列 Vo ---- ')
Vo = [ C
       C*A ]

disp(' ')
disp(' ---- |Vo| ---- ')
det_Vo = det(Vo)

disp(' ')
if det_Vo == 0
    disp('　===> 可観測ではない')
else
    disp('　===> 可観測である')
end
