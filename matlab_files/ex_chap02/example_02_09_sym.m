% example_02_09_sym.m
% �� 2.9
% �������������i�d�����܂܂Ȃ��ꍇ�̃w�r�T�C�h�̌����j�Ƌt���v���X�ϊ�
% �ySymbolic Math Toolbox�z

clear
format compact

syms s
syms t real

% -------------------------------------------------------
disp(' ')
disp(' ***** �� 2.9 ****************************')
disp(' ***** �֐� ilaplace �ɂ��t���v���X�ϊ� **')
fs = 2*(2*s + 1)/(s*(s + 1)*(s + 2))
ft = ilaplace(fs)

% -------------------------------------------------------
disp(' ')
disp(' ***** �� 2.9 ****************************')
disp(' ***** �������������Ƌt���v���X�ϊ� ********')
fs = 2*(2*s + 1)/(s*(s + 1)*(s + 2))

[num den] = numden(fs)
factor_den = factor(den, s, 'FactorMode', 'complex')

fs = num/prod(factor_den)

n = length(factor_den);
for i = 1:n
    p(i) = solve(factor_den(i));
    k(i) = subs(factor_den(i)*fs,s,p(i));
end

for i = 1:n
    if imag(p(i)) == 0
        fprintf('p%d = %f, k%d = %f\n',i,p(i),i,k(i))
    elseif imag(p(i)) > 0 & imag(k(i)) > 0
        fprintf('p%d = %f + %fj, k%d = %f + %fj\n',i,real(p(i)),abs(imag(p(i))),i,real(k(i)),abs(imag(k(i))))  
    elseif imag(p(i)) > 0 & imag(k(i)) < 0
        fprintf('p%d = %f + %fj, k%d = %f - %fj\n',i,real(p(i)),abs(imag(p(i))),i,real(k(i)),abs(imag(k(i))))
    elseif imag(p(i)) < 0 & imag(k(i)) > 0
        fprintf('p%d = %f - %fj, k%d = %f + %fj\n',i,real(p(i)),abs(imag(p(i))),i,real(k(i)),abs(imag(k(i))))
    elseif imag(p(i)) < 0 & imag(k(i)) < 0
        fprintf('p%d = %f - %fj, k%d = %f - %fj\n',i,real(p(i)),abs(imag(p(i))),i,real(k(i)),abs(imag(k(i))))
    end
end

ft = 0;
for i = 1:n
    ft = ft + k(i)*exp(p(i)*t);
end
ft = simplify(ft)
ft = simplify(ft,'Steps',50)    % �I�v�V���� Steps �œ����P�����X�e�b�v���� 50 �Ɏw��i�P���� simplify(ft) �Ƃ��Ă��ȗ����ł��Ȃ��ꍇ������j


