function [ classIndices ] = GetClassIndices( Y )
%GETCLASSINDICES 此处显示有关此函数的摘要
%   假设 Y 已经是排好序的标签
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

