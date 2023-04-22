% exercise_07_08_sym.m
% –â‘è 7.8
% 1 Ÿ’x‚ê—v‘f‚ÌƒiƒCƒLƒXƒg‹OÕ

clear
format compact

syms s
syms w positive
syms T positive

disp(' ')
disp(' ---- “`’BŠÖ” P(s) ---- ')
Ps = 1/(1 + T*s)

disp(' ')
disp(' ---- ü”g”“`’BŠÖ” P(jw) ---- ')
Pjw = subs(Ps,s,1i*w)

disp(' ')
disp(' ---- a = Re[P(jw)] ---- ')
a = real(Pjw)

disp(' ')
disp(' ---- b = Im[P(jw)] ---- ')
b = imag(Pjw)

disp(' ')
disp(' ---- eq = (a - 1/2)^2 + b^2 ---- ')
eq = (a - 1/2)^2 + b^2

disp(' ')
disp(' ---- eq ‚ÌŠÈ—ª‰» ---- ')
eq = simplify(eq)

