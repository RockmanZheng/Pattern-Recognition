function [ newV,newD ] = SortEigenImpl( V,D,lo,hi )
%SORTEIGEN 此处显示有关此函数的摘要
%   根据特征值的大小，从小排序特征值和对应的特征向量
% [Return] newV: 根据特征值排好序的（右）特征值
% [Return] newD: 排好序的特征值，对角矩阵
% [param] V: 原来的（右）特征向量
% [param] D: 原来的特征向量
% 用快速排序

[p,newV,newD] = PartitionEigen(V,D,lo,hi);
[newV,newD]=SortEigenImpl(newV,newD,lo,p);
[newV,newD]=SortEigenImpl(newV,newD,p+1,hi);
end




