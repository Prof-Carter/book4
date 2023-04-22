% 伝達関数表現から状態空間表現（可制御標準形）への変換
% （シンボリック変数を利用する場合）
function [Ac Bc Cc] = ctrb_ss(num_P,den_P)

disp(' ')
disp('--- 状態空間表現（可制御標準形）     ------')
disp('--- dxc(t)/dt = Ac*xc(t) + Bc*u(t) ------')
disp('---   y(t)    = Cc*xc(t)           ------')

M = length(num_P);
N = length(den_P);

num_P_fliplr = sym(zeros(1,N));
temp = fliplr(num_P);
for i = 1:M
    num_P_fliplr(i) = temp(i);
end
den_P_fliplr = fliplr(den_P);

n = length(den_P) - 1;

Ac = sym(zeros(n,n));
Bc = sym(zeros(n,1));
Cc = sym(zeros(1,n));

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

