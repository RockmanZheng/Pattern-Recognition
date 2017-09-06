function Sb = GetSBetween( X,classIndices )
%GETSBETWEEN �˴���ʾ�йش˺�����ժҪ
%   ���� between-class covariance matrix
%   �ȼ���ÿ��ļ�Ȩ���ģ��������֮�󣬳��ϸ������Ҫ�ԣ����߱��أ���Ȼ�������Щ���ĵ� covariance matrix
%   [Return] Sb: between-class covariance matrix
%   [param] X: ���ݵ㣬�������˳������
%   [param] classIndices: ���������� X �е���ʼ�±ꣻ���һ�����ܵ�������Ŀ+1
[m,n] = size(X);
[~,nc]=size(classIndices);
nc=nc-1;
% �ȼ�����������
means = zeros(m,nc);
for i=1:nc
    thisNc = classIndices(i+1)-classIndices(i);
    weight = thisNc/n;
    means(:,i)=weight*sum(X(:,classIndices(i):classIndices(i+1)-1),2)/thisNc;
end
Sb = GetCovariance(means);
end

