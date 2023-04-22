% exercise_07_02_sym.m
% ñ‚ëË 7.2
% ÉQÉCÉìÇ∆à ëäç∑
% ÅySymbolic Math ToolboxÅz

clear
format compact

syms s
syms w positive

% -------------------------------------------------------
disp(' ')
disp(' ***** ñ‚ëË 7.2 (1) ***************************')

disp(' ')
disp(' ---- ì`íBä÷êî P(s) ---- ')
Ps = 1/(10*s + 1)

disp(' ')
disp(' ---- é¸îgêîì`íBä÷êî P(jw) ---- ')
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
disp(' ---- ÉQÉCÉì Gg(w) ---- ')
Gg = sqrt(Re_Pjw^2 + Im_Pjw^2);
Gg = simplify(Gg);
Gg = collect(Gg)

disp(' ')
disp(' ---- à ëäç∑ Gp(w) ---- ')
Gp = atan(Im_Pjw/Re_Pjw);
Gp = simplify(Gp);
Gp = collect(Gp)

% -------------------------------------------------------
disp(' ')
disp(' ***** ñ‚ëË 7.2 (2) ***************************')

disp(' ')
disp(' ---- ì`íBä÷êî P(s) ---- ')
Ps = 1/((s + 1)*(10*s + 1))

disp(' ')
disp(' ---- é¸îgêîì`íBä÷êî P(jw) ---- ')
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
disp(' ---- ÉQÉCÉì Gg(w) ---- ')
Gg = sqrt(Re_Pjw^2 + Im_Pjw^2);
Gg = simplify(Gg);
Gg = collect(Gg)

disp(' ')
disp(' ---- à ëäç∑ Gp(w) ---- ')
Gp = atan(Im_Pjw/Re_Pjw);
Gp = simplify(Gp);
Gp = collect(Gp)

% -------------------------------------------------------
disp(' ')
disp(' ***** ñ‚ëË 7.2 (3) ***************************')

disp(' ')
disp(' ---- ì`íBä÷êî P(s) ---- ')
Ps = (s + 10)/(s + 1)

disp(' ')
disp(' ---- é¸îgêîì`íBä÷êî P(jw) ---- ')
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
disp(' ---- ÉQÉCÉì Gg(w) ---- ')
Gg = sqrt(Re_Pjw^2 + Im_Pjw^2);
Gg = simplify(Gg);
Gg = collect(Gg)

disp(' ')
disp(' ---- à ëäç∑ Gp(w) ---- ')
Gp = atan(Im_Pjw/Re_Pjw);
Gp = simplify(Gp);
Gp = collect(Gp)
