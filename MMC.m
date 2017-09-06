function W= MMC( X,classIndices,featureDim )
%MMC 此处显示有关此函数的摘要
% 计算 maximum margin criterion 对应的降维变换
% 文章见 Ef?cient and Robust Feature Extraction by Maximum Margin
% Criterion，Haifeng Li 等人
% [Retrun] W: 降维变换；对数据 x，降维后为 W'*x，也叫（新）特征
% [param] X: 数据点，按照类来排好
% [param] classIndices: 各类数据点在 X 中的下标起始点
% [param] featureDim: 要降低到的维数；或者说（新）特征空间的维数

% 获取 within-class covariance matrix
Sw = GetSWithin(X,classIndices);
% 获取 between-class covariance matrix
Sb = GetSBetween(X,classIndices);
% 做一下差分，得到MMC矩阵
S = Sb-Sw;
% 获取MMC矩阵的特征值和特征向量
[V,D] = eig(S);
% 选取前featureDim最大特征值对应的特征向量
% 先按照特征值大小，从小到大排列特征向量和特征值
[newV,newD] = SortEigen(V,D);
[m,n] = size(newV);
% 取最大的 featureDim 个
W = newV(:,n-featureDim+1:n);

end

