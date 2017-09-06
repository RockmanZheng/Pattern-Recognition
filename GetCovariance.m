function S = GetCovariance( X )
%GETCOVARIANCE �˴���ʾ�йش˺�����ժҪ
%   �������ݵ�� covariance ����
%   [Return] S: covariance matrix
%   [param] X: ���ݵ㣻һ����һ�����ݵ�
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

