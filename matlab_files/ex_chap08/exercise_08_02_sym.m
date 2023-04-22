% exercise_08_02_sym.m
% ñ‚ëË 8.2
% à¿íËó]óT
% ÅySymbolic Math ToolboxÅz

close all

clear
format compact

disp(' ')
disp(' ***** ñ‚ëË 8.2 ***************************')

syms s
syms w positive
syms kP positive

disp(' ')
disp(' ---- P(s) ---- ')
Ps = 1/(s + 1)^4

disp(' ')
disp(' ---- C(s) ---- ')
Cs = kP

disp(' ')
disp(' ---- L(s) = P(s)C(s) ---- ')
Ls = Ps*Cs

% --------------------------------------------------
disp(' ')
disp(' ---- L(s) = N(s)/D(s) ---- ')
[Ns Ds] = numden(Ls)

% --------------------------------------------------
disp(' ')
disp(' ---- N(s) ---- ')
factor_Ns = factor(Ns);
Ns = prod(factor_Ns)

disp(' ')
disp(' ---- N(jw) ---- ')
factor_Njw = subs(factor_Ns,s,1i*w);
Njw = prod(factor_Njw)

disp(' ')
disp(' ---- Re[N(jw)], Im[N(jw)] ---- ')
Re_factor_Njw = real(factor_Njw)
Im_factor_Njw = imag(factor_Njw)

m = length(factor_Njw);

abs_Njw   = 1;
angle_Njw = 0;
for i = 1:m
    abs_Njw   = abs_Njw*sqrt(Re_factor_Njw(i)^2 + Im_factor_Njw(i)^2);
    angle_Njw = angle_Njw + atan(Im_factor_Njw(i)/Re_factor_Njw(i));
end

disp(' ')
disp(' ---- |N(jw)|, Å⁄N(jw) ---- ')
abs_Njw
angle_Njw

% --------------------------------------------------
disp(' ')
disp(' ---- D(s) ---- ')
factor_Ds = factor(Ds);
Ds = prod(factor_Ds)

disp(' ')
disp(' ---- D(jw) ---- ')
factor_Djw = subs(factor_Ds,s,1i*w);
Djw = prod(factor_Djw)

disp(' ')
disp(' ---- Re[D(jw)], Im[D(jw)] ---- ')
Re_factor_Djw = real(factor_Djw)
Im_factor_Djw = imag(factor_Djw)

n = length(factor_Djw);

abs_Djw   = 1;
angle_Djw = 0;
for i = 1:n
    abs_Djw   = abs_Djw*sqrt(Re_factor_Djw(i)^2 + Im_factor_Djw(i)^2);
    angle_Djw = angle_Djw + atan(Im_factor_Djw(i)/Re_factor_Djw(i));
end

disp(' ')
disp(' ---- |D(jw)|, Å⁄D(jw) ---- ')
abs_Djw
angle_Djw

% --------------------------------------------------
disp(' ')
disp(' ---- |L(jw)|, Å⁄L(jw) ---- ')
abs_Ljw = abs_Njw/abs_Djw
angle_Ljw = angle_Njw - angle_Djw

% --------------------------------------------------
disp(' ')
disp(' ========================================== ')
disp(' ')
disp(' ---- à ëäåç∑äpé¸îgêî wpc ---- ')
wpc = solve(angle_Ljw == -pi, w)

disp(' ')
disp(' ---- |L(j*wpc)| ---- ')
abs_Ljwpc = subs(abs_Ljw,w,wpc)

disp(' ')
disp(' ---- Gm = 20*log10(|L(j*wpc)|) ---- ')
Gm = - 20*log10(abs_Ljwpc)

% --------------------------------------------------
disp(' ')
disp(' ========================================== ')
disp(' ')
disp(' ---- ÉQÉCÉìåç∑äpé¸îgêî wgc ---- ')
[wgc params conds] = solve(abs_Ljw==1, w, 'ReturnConditions', true);
wgc
conds

disp(' ')
disp(' ---- Pm = 180 + Å⁄L(jwgc) ---- ')
Pm = pi + subs(angle_Ljw,w,wgc)

% --------------------------------------------------
figure(1)
yyaxis left

fplot(Gm,[0 5],'LineWidth',1.5)

xlim([0 5])
set(gca,'XTick',0:0.5:5)
ylim([-2.5 42.5]) 
set(gca,'YTick',0:10:40)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('${k}_{\rm P}$','Interpreter','latex','FontSize',14)
ylabel('${G}_{\rm m}$ [dB]','Interpreter','latex','FontSize',14)

% --------------------------------------------------
figure(1)
yyaxis right

fplot((180/pi)*Pm,[0 5],'LineWidth',1.5)

xlim([0 5])
set(gca,'XTick',0:0.5:5)
ylim([-11.25 180+11.25])
set(gca,'YTick',0:45:180)

set(gca,'FontSize',12,'FontName','Arial')

xlabel('${k}_{\rm P}$','Interpreter','latex','FontSize',14)
ylabel('${P}_{\rm m}$ [deg]','Interpreter','latex','FontSize',14)

grid on

% --------------------------------------------------
disp(' ')
disp(' ========================================== ')
disp(' ')
disp(' ---- Pm = 60 [deg] Ç∆Ç»ÇÈ kP ---- ')
sol_kP = solve(Pm*180/pi == 60, kP)
double(sol_kP)

figure(1)
hold on
plot([0 5],[60 60])
plot(double(sol_kP),60,'.','MarkerSize',25)
hold off




