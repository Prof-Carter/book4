% exercise_08_01_02_nyquist_sym.m
% ��� 8.1 (2)
% �i�C�L�X�g�̈��蔻�ʖ@
% �ySymbolic Math Toolbox�z

disp(' ')
disp(' ***** ��� 8.1 (2) ***************************')

clear
format compact

syms s
syms w real
syms kP positive

disp(' ')
disp(' ---- P(s) ---- ')
Ps = 1/(s*(s + 1)*(s + 2))

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
disp(' ---- w -> infty �Ƃ����Ƃ��� L(jw) ---- ')
limit_Ljw_plus_inf = limit(Ljw,w,Inf)

disp(' ')
disp(' ---- w -> -infty �Ƃ����Ƃ��� L(jw) ---- ')
limit_Ljw_minus_inf = limit(Ljw,w,-Inf)

disp(' ')
disp(' ---- w -> 0 �Ƃ����Ƃ��� Re[L(jw)] ---- ')
limit_Re_Ljw_0 = limit(Re_Ljw,w,0)

disp(' ')
disp(' ---- w -> +0 �Ƃ����Ƃ��� Im[L(jw)] ---- ')
limit_Im_Ljw_0 = limit(Im_Ljw,w,0,'right')

disp(' ')
disp(' ---- w -> -0 �Ƃ����Ƃ��� Im[L(jw)] ---- ')
limit_Im_Ljw_0 = limit(Im_Ljw,w,0,'left')

disp(' ')
disp(' ========================================== ')
disp(' ')
disp(' ---- Im[L(jw)] = 0 �ƂȂ� w ---- ')
sol_w = solve(Im_Ljw,w)

disp(' ')
disp(' ---- �ʑ������p���g�� wpc ---- ')
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
disp('***** �i�C�L�X�g�̈��蔻�ʖ@�ɂ�������� *****')
disp('**********************************************')
disp(' ')
disp(' ---- L(j*wpc) > -1 ���� kP > 0 ---- ')
[sol params conds] = solve(Ljwpc > -1 & kP > 0, kP, 'ReturnConditions', true);
conds = subs(conds,kP)


