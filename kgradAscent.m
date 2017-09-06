function [ weights ] = kgradAscent( X, labels )
%KGRADASCENT 此处显示有关此函数的摘要
%   [param] X: 数据，一列是一个数据点
% [param] labels: 标签，行向量，对应X，标记各数据点的类别
[n,m]=size(X);
% 在 X 的最后一行补充 1，用来作为bias terms
X = [X;ones(1,m)];
%k = max(labels);
% k 是类的个数
% m 是数据点的个数
% n 是数据的维数
classes = unique(labels);
[~,k]=size(classes);
% k=max(labels)+1;
alpha = 1;
beta=0.9;
maxCycles = 3000;
% weights 最后一行是 bias terms
weights = ones(n+1,k);
deltaMat = kroneckerArray(labels,unique(labels));
oldWeights = weights;
epislon = 1e-3;
for i=1:maxCycles
    sigMat = sigmoidArray(X,weights);
    errorMat = deltaMat-sigMat;
    alpha=alpha*beta;
    weights=weights+alpha*X*errorMat;
    diff=weights-oldWeights;
    err = max(max(abs(diff)))/max(max(abs(weights)));
    if err<epislon
        break;
    end
    oldWeights = weights;
end

end

