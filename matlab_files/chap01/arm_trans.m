% arm_trans.m
% 鉛直面を回転するアーム系の伝達関数

disp('アーム角度の平衡点を入力して下さい');
ye = input('ye = ');
ue = M*l*g*sin(ye)

numP = 1;
denP = [J c M*l*g*cos(ye)];
sysP = zpk(tf(numP,denP))
pole(sysP)
