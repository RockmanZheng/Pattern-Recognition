function [ newV,newD ] = SortEigenImpl( V,D,lo,hi )
%SORTEIGEN �˴���ʾ�йش˺�����ժҪ
%   ��������ֵ�Ĵ�С����С��������ֵ�Ͷ�Ӧ����������
% [Return] newV: ��������ֵ�ź���ģ��ң�����ֵ
% [Return] newD: �ź��������ֵ���ԽǾ���
% [param] V: ԭ���ģ��ң���������
% [param] D: ԭ������������
% �ÿ�������

[p,newV,newD] = PartitionEigen(V,D,lo,hi);
[newV,newD]=SortEigenImpl(newV,newD,lo,p);
[newV,newD]=SortEigenImpl(newV,newD,p+1,hi);
end




