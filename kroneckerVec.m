function [ delta ] = kroneckerVec( x, y )
%KRONECKERVEC �˴���ʾ�йش˺�����ժҪ
%   [param] x: ������
% [param] y: ������
[~,n]=size(x);
delta = zeros(1,n);
for i=1:n
    delta(i)=kronecker(x(i),y(i));
end

end

