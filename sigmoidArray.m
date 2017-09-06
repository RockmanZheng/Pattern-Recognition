function [ sigMat ] = sigmoidArray( X, weights )
%SIGMOIDARRAY �˴���ʾ�йش˺�����ժҪ
%   Generate sigmoid matrix of data with weights
% [param] X�����ݵ㣬һ����һ�����ݵ�
[~,m] = size(X);
[~,k]=size(weights);
sigMat = zeros(m,k);
for i=1:m
    for u=1:k
        sigMat(i,u) = ksigmoid(X(:,i),u,weights);
    end
end
end

