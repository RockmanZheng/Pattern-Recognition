function [ p,newX,newY ] = PartitionData(  X,Y,lo,hi  )
%PARTITIONDATA �˴���ʾ�йش˺�����ժҪ
%   ����Ҫ�õ��ķָ��

i=lo-1;
j=hi+1;
pivot = Y(lo);
while 1
    i=i+1;
    while Y(i)<pivot
        i=i+1;
    end
    j=j-1;
    while Y(j)>pivot
        j=j-1;
    end
    if i>=j
        p=j;
        break;
    end
    % ������С˳��
    temp = Y(i);
    Y(i) = Y(j);
    Y(j) = temp;
    tempX = X(:,i);
    X(:,i)=X(:,j);
    X(:,j)=tempX;
end
newX = X;
newY = Y;

end

