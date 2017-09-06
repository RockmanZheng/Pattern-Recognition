function [p,newV,newD] = PartitionEigen( V,D,lo,hi )
%PARTITIONEIGEN �˴���ʾ�йش˺�����ժҪ
%   ����Ҫ�õ��ķָ��

% �Ƚ��ԽǾ���ĶԽ�Ԫ��ȫ��ȡ��������ֱ��һ������
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
    % ������С˳��
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

