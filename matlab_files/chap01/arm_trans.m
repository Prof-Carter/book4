% arm_trans.m
% �����ʂ���]����A�[���n�̓`�B�֐�

disp('�A�[���p�x�̕��t�_����͂��ĉ�����');
ye = input('ye = ');
ue = M*l*g*sin(ye)

numP = 1;
denP = [J c M*l*g*cos(ye)];
sysP = zpk(tf(numP,denP))
pole(sysP)
