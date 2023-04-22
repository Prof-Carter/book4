% example_08_02_sym.m
% �� 8.2
% �i�C�L�X�g�̈��蔻�ʖ@
% �ySymbolic Math Toolbox�z

disp(' ')
disp(' ***** �� 8.3 ***************************')

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
disp(' ========================================== ')
disp(' ')
disp(' ---- ���������� ��(s) ---- ')
[numLs denLs] = numden(Ls);

Delta = denLs + numLs;
Delta = collect(Delta,s)

disp(' ')
disp(' ---- ���������� ��(s) = 0 �̉� ---- ')
solve(Delta,s)




