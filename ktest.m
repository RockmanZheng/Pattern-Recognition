function [ correctRate, classified ] = ktest( X, testY, weights,classes )
%KTEST 此处显示有关此函数的摘要
%   此处显示详细说明
[~,k]=size(weights);
[n,m]=size(X);
% 在 X 下面补充一行 1
X = [X;ones(1,m)];
sigArray = sigmoidArray(X,weights);
classified = zeros(1,m);
for i=1:m
    [~,idx]=max(sigArray(i,:));
    classified(i)=classes(idx);
    %classified(i)=classified(i)-1;
end
deltaVec = kroneckerVec(classified,testY);
correctRate = sum(deltaVec)/m;
end

