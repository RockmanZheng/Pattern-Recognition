function [ sigMat ] = sigmoidArray( X, weights )
%SIGMOIDARRAY 此处显示有关此函数的摘要
%   Generate sigmoid matrix of data with weights
% [param] X：数据点，一列是一个数据点
[~,m] = size(X);
[~,k]=size(weights);
sigMat = zeros(m,k);
for i=1:m
    for u=1:k
        sigMat(i,u) = ksigmoid(X(:,i),u,weights);
    end
end
end

