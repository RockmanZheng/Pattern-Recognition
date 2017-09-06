function Sb = GetSBetween( X,classIndices )
%GETSBETWEEN 此处显示有关此函数的摘要
%   计算 between-class covariance matrix
%   先计算每类的加权中心（算出中心之后，乘上该类的重要性，或者比重），然后计算这些中心的 covariance matrix
%   [Return] Sb: between-class covariance matrix
%   [param] X: 数据点，按照类的顺序排列
%   [param] classIndices: 各类数据在 X 中的起始下标；最后一项是总的数据数目+1
[m,n] = size(X);
[~,nc]=size(classIndices);
nc=nc-1;
% 先计算各类的中心
means = zeros(m,nc);
for i=1:nc
    thisNc = classIndices(i+1)-classIndices(i);
    weight = thisNc/n;
    means(:,i)=weight*sum(X(:,classIndices(i):classIndices(i+1)-1),2)/thisNc;
end
Sb = GetCovariance(means);
end

