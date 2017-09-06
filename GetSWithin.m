function Sw = GetSWithin( X,classIndices )
%GETSWITHIN �˴���ʾ�йش˺�����ժҪ
%   ���� within-class covariance matrix
%   �ȼ���ÿ��� covariance matrix��Ȼ�󰴱������
%   [Return] Sw: within-class covariance matrix
%   [param] X: ���ݵ㣬�������˳������
%   [param] classIndices: ���������� X �е���ʼ�±ꣻ���һ�����ܵ�������Ŀ+1
[m,n]=size(X);
% Sw = zeros(m);
[~,nc]=size(classIndices);
nc=nc-1;
weight = (classIndices(2)-classIndices(1))/n;
Sw = weight*GetCovariance(X(:,classIndices(1):classIndices(2)-1));
for i=2:nc
    weight = (classIndices(i+1)-classIndices(i))/n;
    Sw = Sw+weight*GetCovariance(X(:,classIndices(i):classIndices(i+1)-1));
end
Sw = sparse(Sw);
end

