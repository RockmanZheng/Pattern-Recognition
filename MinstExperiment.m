% 用MINST数据库做实验
% 用MMC（maximum margin criterion）技术进行降维
% 用LDA做区分
% 将数据降低到不同的维数，绘制正确率图形
% 设置最大维数
Dim = 320;
% 设置降低的目标维数
featureDim = [5 10 20 40 80 160 320];
[~,expNum]= size(featureDim);
% 错误率数组
errorRate = zeros(1,expNum);
%correctRate = zeros(1,expNum);
% 加载MINST数据
[trainX,trainY,testX,testY] = ReadMinst('');
% 获取classIndices
trainClassIndices = GetClassIndices(trainY);
%testClassInidices = GetClassIndices(testY);

% 获取 within-class covariance matrix
Sw = GetSWithin(trainX,trainClassIndices);
% 除以最大特征值，标准化一下
Sw = Sw/eigs(Sw,1);
% 获取 between-class covariance matrix
Sb = GetSBetween(trainX,trainClassIndices);
% 除以最大特征值，标准化一下
Sb = Sb/eigs(Sb,1);
% 做一下差分，得到MMC矩阵
S = Sb-Sw;
% 获取MMC矩阵的特征值和特征向量，求最大的 350 个特征值和对应的特征向量
% 自动已经按照特征值排好序了
[V,D] = eigs(S,Dim);
% 选取前featureDim最大特征值对应的特征向量
% 先按照特征值大小，从小到大排列特征向量和特征值
%[newV,newD] = SortEigen(V,D);
%[m,n] = size(newV);
[m,n] = size(V);
% 对每一个目标维数做实验
for i=1:expNum
    % 获取降维变换
    W = V(:,n-featureDim(i)+1:n);
    % 获取训练集和测试集的特征
    trainFeature = W'*trainX;
    testFeature = W'*testX;
    % 根据特征用softmax做分类
    weights = kgradAscent(trainFeature,trainY');
    [correctRate,classified]=ktest(testFeature,testY',weights,unique(trainY)');
    errorRate(i) = 1-correctRate;
end
% 画图
figure
plot(featureDim,errorRate);
ylabel('错误率');
xlabel('维数');





