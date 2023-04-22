% exercise_07_03_sym.m
% –â‘è 7.3
% ü”g”‰“š
% ySymbolic Math Toolboxz

clear
format compact

syms s
syms w positive
syms t real

% -------------------------------------------------------
disp(' ')
disp(' ***** –â‘è 7.3 ***************************')

disp(' ')
disp(' ---- “`’BŠÖ” P(s) ---- ')
Ps = (s + 2)/(s^2 + 2*s + 2)

disp(' ')
disp(' ---- ü”g”“`’BŠÖ” P(jw) ---- ')
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
disp(' ---- ƒQƒCƒ“ Gg(w) ---- ')
Gg = sqrt(Re_Pjw^2 + Im_Pjw^2);
Gg = simplify(Gg);
Gg = collect(Gg)

disp(' ')
disp(' ---- ˆÊ‘Š· Gp(w) ---- ')
Gp = atan(Im_Pjw/Re_Pjw);
Gp = simplify(Gp);
Gp = collect(Gp)

disp(' ')
disp(' ---- ³Œ·”g“ü—Í u(t) = sin(t) ‚É‘Î‚·‚é      ---- ')
disp(' ---- ’èíó‘Ô y_app(t) = B*sin(w*t + phi)  ---- ')
B = subs(Gg,w,1)
phi = subs(Gp,w,1)

y_app = B*sin(w*t + phi)

