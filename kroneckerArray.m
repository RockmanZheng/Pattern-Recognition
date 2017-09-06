function [ delta ] = kroneckerArray( x, y )
%KRONECKERARRAY 此处显示有关此函数的摘要
%   [param] x: 行向量
%   [param] y: 行向量
%   [Return] delta: delta(x,y)形成的矩阵
[~,m]=size(x);
[~,k]=size(y);
delta = zeros(m,k);
for i=1:m
    for j=1:k
        delta(i,j) = kronecker(x(i),y(j));
    end
end

end

