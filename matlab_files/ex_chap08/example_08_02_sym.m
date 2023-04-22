% example_08_02_sym.m
% 例 8.2
% ナイキストの安定判別法
% 【Symbolic Math Toolbox】

disp(' ')
disp(' ***** 例 8.3 ***************************')

clear
format compact

syms s
syms w real

disp(' ')
disp(' ---- L(s) = P(s)C(s) ---- ')
Ls = (- s + 6)/((s + 4)*(s - 1))

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
disp(' ========================================== ')
disp(' ')
disp(' ---- 特性多項式 ⊿(s) ---- ')
[numLs denLs] = numden(Ls);

Delta = denLs + numLs;
Delta = collect(Delta,s)

disp(' ')
disp(' ---- 特性方程式 ⊿(s) = 0 の解 ---- ')
solve(Delta,s)




