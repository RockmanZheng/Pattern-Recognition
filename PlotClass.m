function  PlotClass( feature,classIndices )
%PLOTCLASS �˴���ʾ�йش˺�����ժҪ
%   ����ͬ�໭����
[m,n]=size(feature);
[~,nc]=size(classIndices);
nc=nc-1;
figure
for i=1:nc
    scatter(feature(1,classIndices(i):classIndices(i+1)-1),feature(2,classIndices(i):classIndices(i+1)-1));
    hold on
end
end

