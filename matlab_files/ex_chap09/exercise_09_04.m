% exercise_09_04.m
% 問題 9.4
% 可制御性，可観測性の判別

clear
format compact

s = tf('s');

disp(' ')
disp(' ***** 問題 9.4 ********************')

A = [ 0   1
     -6  -5 ]
B = [ 0
      1 ]
C = [ 1   0 ]

% --------------------------------------------------
disp(' ')
disp(' ---- 可制御性行列 Vc ---- ')
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
    disp('　===> 可制御ではない')
else
    disp('　===> 可制御である')
end

% --------------------------------------------------
disp(' ')
disp(' ---- 可観測性行列 Vo ---- ')
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
    disp('　===> 可観測ではない')
else
    disp('　===> 可観測である')
end

