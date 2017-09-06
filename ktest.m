function [ correctRate, classified ] = ktest( X, testY, weights,classes )
%KTEST �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[~,k]=size(weights);
[n,m]=size(X);
% �� X ���油��һ�� 1
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

