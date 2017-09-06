function Sw = GetSWithin( X,classIndices )
%GETSWITHIN 此处显示有关此函数的摘要
%   计算 within-class covariance matrix
%   先计算每类的 covariance matrix，然后按比重相加
%   [Return] Sw: within-class covariance matrix
%   [param] X: 数据点，按照类的顺序排列
%   [param] classIndices: 各类数据在 X 中的起始下标；最后一项是总的数据数目+1
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

