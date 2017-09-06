function [ classIndices ] = GetClassIndices( Y )
%GETCLASSINDICES �˴���ʾ�йش˺�����ժҪ
%   ���� Y �Ѿ����ź���ı�ǩ
[n,~] = size(Y);
tempclassIndices = zeros(1,n);
tempclassIndices(1)=1;
top=2;
lastClass = Y(1);
for i=2:n
    if Y(i)~=lastClass
        tempclassIndices(top)=i;
        top=top+1;
        lastClass = Y(i);
    end
end
tempclassIndices(top)=n+1;
classIndices = tempclassIndices(1:top);

end

