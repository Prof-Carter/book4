% example_07_04.m
% 例 7.4
% ベクトル軌跡の描画

close all

clear
format compact

% -------------------------------------------------------
disp(' ')
disp(' ***** 例 7.4 ********************')

s = tf('s');
sysP = 1/(s + 1);

for w = [0 1/2 1 2 4 Inf]
    [Re_Pjw Im_Pjw] = nyquist(sysP,w);
    abs_Pjw = sqrt(Re_Pjw^2 + Im_Pjw^2);
    angle_Pjw = atan(Im_Pjw/Re_Pjw);
    
    fprintf('\n++++++++++++++++++++++++ \n')
    fprintf('w = %2.1f [rad/s]\n',w)
    fprintf('Re[P(jw)] = %5.3f\n',Re_Pjw)
    fprintf('Im[P(jw)] = %5.3f\n',Im_Pjw)
    fprintf('|P(jw)| = %5.3f\n',abs_Pjw)
    fprintf('∠P(jw) = %5.3f [deg]\n',angle_Pjw*180/pi)
end

options = nyquistoptions;
options.ShowFullContour = 'off';
options.Title.String = ' ベクトル軌跡';

options.Title.FontSize  = 14;
options.XLabel.FontSize = 14;
options.YLabel.FontSize = 14;
options.TickLabel.FontSize = 12;

figure(1)
subplot('Position',[0.2 0.15 0.6 0.8])  
nyquist(sysP,options)

h = findobj(gcf,'type','Line');
set(h,'LineWidth',1.5)

set(gca,'FontName','Arial')

xlim([-0.25 1.25])
set(gca,'XTick',-0.25:0.25:1.25)
ylim([-1 0.5])
set(gca,'YTick',-1:0.25:0.5)

hold on
plot(-1,0,'r+','MarkerSize',10,'LineWidth',1.5)
hold off

h = findall(gcf,'String','虚軸'); % 文字列 "虚軸" を検索
set(h,'position',[-35 158 0])     % 位置(Position)を変更
