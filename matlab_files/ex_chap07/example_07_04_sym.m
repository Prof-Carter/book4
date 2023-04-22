% example_07_04.m
% 例 7.4
% ベクトル軌跡の特徴点

disp(' ')
disp(' ***** 例 7.4 ********************')

clear
format compact

syms s
syms w positive

disp(' ')
disp(' ---- 伝達関数 P(s) ---- ')
Ps = 1/(s + 1)

disp(' ')
disp(' ---- 周波数伝達関数 P(jw) ---- ')
Pjw = subs(Ps,s,1j*w)
Pjw = simplify(Pjw);
Pjw = collect(Pjw)

disp(' ')
disp(' ---- Re[P(jw)] ---- ')
Re_Pjw = real(Pjw);
Re_Pjw = simplify(Re_Pjw);
Re_Pjw = collect(Re_Pjw)

disp(' ')
disp(' ---- Im[P(jw)] ---- ')
Im_Pjw = imag(Pjw);
Im_Pjw = simplify(Im_Pjw);
Im_Pjw = collect(Im_Pjw)

disp(' ')
disp(' ---- |P(jw)| ---- ')
abs_Pjw = sqrt(Re_Pjw^2 + Im_Pjw^2);
abs_Pjw = simplify(abs_Pjw);
abs_Pjw = collect(abs_Pjw)

disp(' ')
disp(' ---- 位相差 ∠P(jw) ---- ')
angle_Pjw = atan(Im_Pjw/Re_Pjw);
angle_Pjw = simplify(angle_Pjw);
angle_Pjw = collect(angle_Pjw)

for w_data = [0 1/2 1 2 4 Inf]    
    fprintf('\n++++++++++++++++++++++++ \n')
    fprintf('w = %2.1f [rad/s]\n',w_data)
    
    fprintf('Re[P(jw)]\n')
    limit(Re_Pjw,w,w_data)
        
    fprintf('Im[P(jw)]\n')
    limit(Im_Pjw,w,w_data)
    
    fprintf('|P(jw)|\n')
    limit(abs_Pjw,w,w_data)
    
    fprintf('∠P(jw) [rad]\n')
    limit(angle_Pjw,w,w_data)
    
    fprintf('∠P(jw) [deg]\n')
    double(limit(angle_Pjw,w,w_data)*180/pi)
end
