function  PlotClass( feature,classIndices )
%PLOTCLASS 此处显示有关此函数的摘要
%   将不同类画出来
[m,n]=size(feature);
[~,nc]=size(classIndices);
nc=nc-1;
figure
for i=1:nc
    scatter(feature(1,classIndices(i):classIndices(i+1)-1),feature(2,classIndices(i):classIndices(i+1)-1));
    hold on
end
end

