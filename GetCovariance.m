function S = GetCovariance( X )
%GETCOVARIANCE 此处显示有关此函数的摘要
%   计算数据点的 covariance 矩阵
%   [Return] S: covariance matrix
%   [param] X: 数据点；一列是一个数据点
[m,n]=size(X);
mean = sum(X,2)/n;
% S = zeros(m);
diff = X(:,1)-mean;
S = diff*diff';
for i=2:n
    diff = X(:,i)-mean;
    S=S+diff*diff';
end
S = sparse(S);
end

