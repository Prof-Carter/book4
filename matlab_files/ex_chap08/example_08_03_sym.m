% example_08_03_sym.m
% —á 8.3
% ƒiƒCƒLƒXƒg‚ÌˆÀ’è”»•Ê–@
% ySymbolic Math Toolboxz

disp(' ')
disp(' ***** —á 8.3 ***************************')

clear
format compact

syms s
syms w real

disp(' ')
disp(' ---- P(s) ---- ')
Ps = 1/(s*(s + 1))

disp(' ')
disp(' ---- C(s) ---- ')
Cs = 1/(2*s + 1)

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
disp(' ---- w -> infty ‚Æ‚µ‚½‚Æ‚«‚Ì L(jw) ---- ')
limit_Ljw_plus_inf = limit(Ljw,w,Inf)

disp(' ')
disp(' ---- w -> -infty ‚Æ‚µ‚½‚Æ‚«‚Ì L(jw) ---- ')
limit_Ljw_minus_inf = limit(Ljw,w,-Inf)

disp(' ')
disp(' ---- w -> 0 ‚Æ‚µ‚½‚Æ‚«‚Ì Re[L(jw)] ---- ')
limit_Re_Ljw_0 = limit(Re_Ljw,w,0)

disp(' ')
disp(' ---- w -> +0 ‚Æ‚µ‚½‚Æ‚«‚Ì Im[L(jw)] ---- ')
limit_Im_Ljw_0 = limit(Im_Ljw,w,0,'right')

disp(' ')
disp(' ---- w -> -0 ‚Æ‚µ‚½‚Æ‚«‚Ì Im[L(jw)] ---- ')
limit_Im_Ljw_0 = limit(Im_Ljw,w,0,'left')

disp(' ')
disp(' ========================================== ')
disp(' ')
disp(' ---- Im[L(jw)] = 0 ‚Æ‚È‚é w ---- ')
sol_w = solve(Im_Ljw,w)

disp(' ')
disp(' ---- ˆÊ‘ŠŒð·ŠpŽü”g” wpc ---- ')
n = length(sol_w);
for i = 1:n
    if sol_w(i) > 0
        wpc = sol_w(i)
    end
end

disp(' ')
disp(' ---- L(j*wpc) ---- ')
Ljwpc = simplify(subs(Ljw,w,wpc))




