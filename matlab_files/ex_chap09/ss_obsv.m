% �`�B�֐��\�������ԋ�ԕ\���i�ϑ��W���`�j�ւ̕ϊ�
function [Ao Bo Co] = obsv_ss(num_P,den_P)

disp(' ')
disp('--- ��ԋ�ԕ\���i�ϑ��W���`�j     ------')
disp('--- dxo(t)/dt = Ao*xo(t) + Bo*u(t) ------')
disp('---   y(t)    = Co*xo(t)           ------')

M = length(num_P);
N = length(den_P);

num_P_fliplr = zeros(1,N);
temp = fliplr(num_P);
for i = 1:M
    num_P_fliplr(i) = temp(i);
end

den_P_fliplr = fliplr(den_P);

n = length(den_P) - 1;

Ac = zeros(n,n);
Bc = zeros(n,1);
Cc = zeros(1,n);

for i = 1:n-1
    Ac(i,i+1) = 1;
end
for i = 1:n
    Ac(n,i) = -den_P_fliplr(i);
end
Bc(n,1) = 1;
for i = 1:n
    Cc(1,i) = num_P_fliplr(i);
end

Ao = Ac';
Bo = Cc';
Co = Bc';