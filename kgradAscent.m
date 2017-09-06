function [ weights ] = kgradAscent( X, labels )
%KGRADASCENT �˴���ʾ�йش˺�����ժҪ
%   [param] X: ���ݣ�һ����һ�����ݵ�
% [param] labels: ��ǩ������������ӦX����Ǹ����ݵ�����
[n,m]=size(X);
% �� X �����һ�в��� 1��������Ϊbias terms
X = [X;ones(1,m)];
%k = max(labels);
% k ����ĸ���
% m �����ݵ�ĸ���
% n �����ݵ�ά��
classes = unique(labels);
[~,k]=size(classes);
% k=max(labels)+1;
alpha = 1;
beta=0.9;
maxCycles = 3000;
% weights ���һ���� bias terms
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

