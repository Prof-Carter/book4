% example_08_01_nyquist_sym.m
% 例 8.1
% ナイキストの安定判別法
% 【Symbolic Math Toolbox】

disp(' ')
disp(' ***** 例 8.1 ***************************')

clear
format compact

syms s
syms w real
syms kP positive

disp(' ')
disp(' ---- P(s) ---- ')
Ps = 1/(s + 1)^3

disp(' ')
disp(' ---- C(s) ---- ')
Cs = kP

disp(' ')
disp(' ---- L(s) = P(s)C(s) ---- ')
Ls = Ps*Cs

disp(' ')
disp(' ---- L(jw) ---- ')
Ljw = subs(Ls,s,1i*w)

disp(' ')
disp(' ---- Re[L(jw)] ---- ')
Re_Ljw = simplify(real(Ljw))

disp(' ')
disp(' ---- Im[L(jw)] ---- ')
Im_Ljw = simplify(imag(Ljw))

disp(' ')
disp(' ========================================== ')
disp(' ')
disp(' ---- w -> 0 としたときの L(jw) ---- ')
limit_Ljw_0 = limit(Ljw,w,0)

disp(' ')
disp(' ---- w -> infty としたときの L(jw) ---- ')
limit_Ljw_plus_inf = limit(Ljw,w,Inf)

disp(' ')
disp(' ---- w -> -infty としたときの L(jw) ---- ')
limit_Ljw_minus_inf = limit(Ljw,w,-Inf)

disp(' ')
disp(' ========================================== ')
disp(' ')
disp(' ---- Im[L(jw)] = 0 となる w ---- ')
sol_w = solve(Im_Ljw,w)

disp(' ')
disp(' ---- 位相交差角周波数 wpc ---- ')
n = length(sol_w);
for i = 1:n
    if sol_w(i) > 0
        wpc = sol_w(i)
    end
end

disp(' ')
disp(' ---- L(j*wpc) ---- ')
Ljwpc = simplify(subs(Ljw,w,wpc))

disp(' ')
disp('**********************************************')
disp('***** ナイキストの安定判別法による安定条件 *****')
disp('**********************************************')
disp(' ')
disp(' ---- L(j*wpc) > -1 かつ kP > 0 ---- ')
[sol params conds] = solve(Ljwpc > -1 & kP > 0, kP, 'ReturnConditions', true);
conds = subs(conds,kP)




