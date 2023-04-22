% hurwitz_sym.m
% �t���r�b�c�̈��蔻�ʖ@�i�ȗ������������j

alpha = coeffs(Delta,s);

N = length(alpha);
n = N - 1;

% ===== ����A =======================
disp('----- ����A�Fa_i > 0 ------')
for i = 0:n
    str = ['a', num2str(i), '= alpha(i+1)'];
    eval(str)
end

cond_A = ' ';
for i = 0:n
    if i == 0
        cond_A = strcat(cond_A,['simplify(a' num2str(i) '> 0)']);
    else
        cond_A = strcat(cond_A,[' & simplify(a' num2str(i) '> 0)']);
    end
end

% ===== ����B" =======================
for i = 1:n
    for j = 1:n
        k = (N - 1) + (i - 1) - 2*(j - 1);

        if k >= 1 & k <= N
            H(i,j) = alpha(k);
        else
            H(i,j) = 0;
        end
    end
end

disp('----- �t���r�b�c�s��H ------')
H

if mod(n,2) == 0
    i_min = 3; i_max = n - 1;
else
    i_min = 2; i_max = n - 1;
end

disp('----- ����B"�FH_i > 0 ------')
for i = i_min:2:i_max
    h = det(H(1:i,1:i));
    str = ['H', num2str(i), '= h'];
    eval(str)
end

cond_B = ' ';
for i = i_min:2:i_max
    if i == i_min
        cond_B = strcat(cond_B,['simplify(H' num2str(i) '> 0)']);
    else
        cond_B = strcat(cond_B,[' & simplify(H' num2str(i) '> 0)']);
    end
end

% ===== �������=======================
disp('----- �������------')
simplify(eval(cond_A) & eval(cond_B))
