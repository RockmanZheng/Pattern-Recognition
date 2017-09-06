function [p,newV,newD] = PartitionEigen( V,D,lo,hi )
%PARTITIONEIGEN 此处显示有关此函数的摘要
%   快排要用到的分割函数

% 先将对角矩阵的对角元素全部取出来，拉直成一个数组
Da = diag(D);
i=lo-1;
j=hi+1;
pivot = Da(lo);
while 1
    i=i+1;
    while Da(i)<pivot
        i=i+1;
    end
    j=j-1;
    while Da(j)>pivot
        j=j-1;
    end
    if i>=j
        p=j;
        break;
    end
    % 调整大小顺序
    temp = Da(i);
    Da(i) = Da(j);
    Da(j) = temp;
    tempV = V(:,i);
    V(:,i)=V(:,j);
    V(:,j)=tempV;
end
newV = V;
newD = diag(Da);

end

