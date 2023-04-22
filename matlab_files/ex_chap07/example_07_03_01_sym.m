% example_07_03_01_sym.m
% ó· 7.3 (1)
% ÉQÉCÉìÅCà ëäç∑ÇÃï÷óòÇ»ãÅÇﬂï˚
% ÅySymbolic Math ToolboxÅz

clear
format compact

syms s
syms w positive

% -------------------------------------------------------
disp(' ')
disp(' ***** ó· 7.3 (1) ***************************')

disp(' ')
disp(' ---- ì`íBä÷êî P(s) ---- ')
Ps = 1/(s + 1)

disp(' ')
disp(' ---- ì`íBä÷êî P(s) = N(s)/D(s) ---- ')
[Ns Ds] = numden(Ps)

Ns = factor(Ns);
Ds = factor(Ds);

% =========================
m = length(Ns);
for i = 1:m
    Njw(i) = subs(Ns(i),s,1j*w);
    
    Re_Njw(i) = real(Njw(i));
    Re_Njw(i) = simplify(Re_Njw(i));
    Re_Njw(i) = collect(Re_Njw(i));

    Im_Njw(i) = imag(Njw(i));
    Im_Njw(i) = simplify(Im_Njw(i));
    Im_Njw(i) = collect(Im_Njw(i));

    abs_Njw(i) = sqrt(Re_Njw(i)^2 + Im_Njw(i)^2);
    abs_Njw(i) = simplify(abs_Njw(i));
    abs_Njw(i) = collect(abs_Njw(i));

    angle_Njw(i) = atan(Im_Njw(i)/Re_Njw(i));
    angle_Njw(i) = simplify(angle_Njw(i));
    angle_Njw(i) = collect(angle_Njw(i));
end

disp(' ')
disp(' ---- N(jw) = N1(jw)N2(jw)ÅcNm(jw) ---- ')
Njw

disp(' ')
disp(' ---- Re[Ni(jw)] ---- ')
Re_Njw

disp(' ')
disp(' ---- Im[Ni(jw)] ---- ')
Im_Njw

disp(' ')
disp(' ---- ÉQÉCÉì |Ni(jw)| ---- ')
abs_Njw

disp(' ')
disp(' ---- à ëäç∑ Å⁄Ni(jw) ---- ')
angle_Njw
    
% =========================
n = length(Ds);
for i = 1:n
    Djw(i) = subs(Ds(i),s,1j*w);
    
    Re_Djw(i) = real(Djw(i));
    Re_Djw(i) = simplify(Re_Djw(i));
    Re_Djw(i) = collect(Re_Djw(i));

    Im_Djw(i) = imag(Djw(i));
    Im_Djw(i) = simplify(Im_Djw(i));
    Im_Djw(i) = collect(Im_Djw(i));

    abs_Djw(i) = sqrt(Re_Djw(i)^2 + Im_Djw(i)^2);
    abs_Djw(i) = simplify(abs_Djw(i));
    abs_Djw(i) = collect(abs_Djw(i));

    angle_Djw(i) = atan(Im_Djw(i)/Re_Djw(i));
    angle_Djw(i) = simplify(angle_Djw(i));
    angle_Djw(i) = collect(angle_Djw(i));
end

disp(' ')
disp(' ---- D(jw) = D1(jw)D2(jw)ÅcDn(jw) ---- ')
Djw

disp(' ')
disp(' ---- Re[Di(jw)] ---- ')
Re_Djw

disp(' ')
disp(' ---- Im[Di(jw)] ---- ')
Im_Djw

disp(' ')
disp(' ---- ÉQÉCÉì |Di(jw)| ---- ')
abs_Djw

disp(' ')
disp(' ---- à ëäç∑ Å⁄Di(jw) ---- ')
angle_Djw

% =========================
Gg = 1;
Gp = 0;
for i = 1:m
    Gg = Gg*abs_Njw(i);
    Gp = Gp + angle_Njw(i);
end
for i = 1:n
    Gg = Gg/abs_Djw(i);
    Gp = Gp - angle_Djw(i);
end

disp(' ')
disp(' ---- ÉQÉCÉì Gg(w) ---- ')
Gg

disp(' ')
disp(' ---- à ëäç∑ Gp(w) ---- ')
Gp


