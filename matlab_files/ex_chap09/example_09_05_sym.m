% example_09_05_sym.m
% 例 9.5
% 水位系の可制御性の判別
% 【Symbolic Math Toolbox】

clear
format compact

syms a11 a21 a22 b1 b2 real

% --------------------------------------------------
disp(' ')
disp(' ***** 例 9.5（その 1）********************')

disp(' ')
disp(' ---- A 行列 ---- ')
A = [ a11  0
      a21  a22 ]
  
disp(' ')
disp(' ---- B 行列 ---- ')
B = [ b1
      0 ]

disp(' ')
disp(' ---- 可制御性行列 Vc ---- ')
Vc = [ B  A*B ]

disp(' ')
disp(' ---- |Vc| ---- ')
det_Vc = det(Vc)

disp(' ')
if det_Vc == 0
    disp('　===> 可制御ではない')
else
    disp('　===> 可制御である')
end

% --------------------------------------------------
disp(' ')
disp(' ***** 例 9.5（その 2）********************')

disp(' ')
disp(' ---- A 行列 ---- ')
A = [ a11  0
      a21  a22 ]
  
disp(' ')
disp(' ---- B 行列 ---- ')
B = [ 0
      b2 ]

disp(' ')
disp(' ---- 可制御性行列 Vc ---- ')
Vc = [ B  A*B ]

disp(' ')
disp(' ---- |Vc| ---- ')
det_Vc = det(Vc)

disp(' ')
if det_Vc == 0
    disp('　===> 可制御ではない')
else
    disp('　===> 可制御である')
end
