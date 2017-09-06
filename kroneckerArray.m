function [ delta ] = kroneckerArray( x, y )
%KRONECKERARRAY �˴���ʾ�йش˺�����ժҪ
%   [param] x: ������
%   [param] y: ������
%   [Return] delta: delta(x,y)�γɵľ���
[~,m]=size(x);
[~,k]=size(y);
delta = zeros(m,k);
for i=1:m
    for j=1:k
        delta(i,j) = kronecker(x(i),y(j));
    end
end

end

