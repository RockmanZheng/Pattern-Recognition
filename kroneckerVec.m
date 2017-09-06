function [ delta ] = kroneckerVec( x, y )
%KRONECKERVEC 此处显示有关此函数的摘要
%   [param] x: 行向量
% [param] y: 行向量
[~,n]=size(x);
delta = zeros(1,n);
for i=1:n
    delta(i)=kronecker(x(i),y(i));
end

end

