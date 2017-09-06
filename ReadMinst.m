function [ trainX,trainY,testX,testY ] = ReadMinst( path )
%READMINST 此处显示有关此函数的摘要
%   读取MINST数据库，获得训练集和测试集以及它们的标签

% 打开训练集和测试集以及对应标签文件
trainDataFile = fopen(strcat(path,'train-images.idx3-ubyte'));
trainLabelFile = fopen(strcat(path,'train-labels.idx1-ubyte'));
testDataFile = fopen(strcat(path,'t10k-images.idx3-ubyte'));
testLabelFile = fopen(strcat(path,'t10k-labels.idx1-ubyte'));

% 先读取训练标签文件
trainLabelMagicNumber = fread(trainLabelFile,1,'int32',0,'b');
trainLabelItemNum = fread(trainLabelFile,1,'int32',0,'b');
trainLabels = fread(trainLabelFile,trainLabelItemNum,'uint8',0,'b');
trainY = trainLabels;
% 读取训练集
trainDataMagicNumber=  fread(trainDataFile,1,'int32',0,'b');
trainDataImgNum = fread(trainDataFile,1,'int32',0,'b');
trainDataRows = fread(trainDataFile,1,'int32',0,'b');
trainDataCols = fread(trainDataFile,1,'int32',0,'b');
trainData = fread(trainDataFile,trainDataImgNum*trainDataRows*trainDataCols,'uint8',0,'b');

% 读取测试标签文件
testLabelMagicNumber = fread(testLabelFile,1,'int32',0,'b');
testLabelItemNum = fread(testLabelFile,1,'int32',0,'b');
testLabels = fread(testLabelFile,testLabelItemNum,'uint8',0,'b');
testY = testLabels;
% 读取测试集
testDataMagicNumber=  fread(testDataFile,1,'int32',0,'b');
testDataImgNum = fread(testDataFile,1,'int32',0,'b');
testDataRows = fread(testDataFile,1,'int32',0,'b');
testDataCols = fread(testDataFile,1,'int32',0,'b');
testData = fread(testDataFile,testDataImgNum*testDataRows*testDataCols,'uint8',0,'b');
% 关闭文件
fclose(trainDataFile);
fclose(trainLabelFile);
fclose(testDataFile);
fclose(testLabelFile);

% 训练集按照图片断开
trainDim = trainDataRows*trainDataCols;
trainX = zeros(trainDim,trainDataImgNum);
for i=1:trainDataImgNum
    trainX(:,i) = trainData((i-1)*trainDim+1:i*trainDim);
end

% 测试集按照图片断开
testDim = testDataRows*testDataCols;
testX = zeros(testDim,testDataImgNum);
for i=1:testDataImgNum
    testX(:,i) = testData((i-1)*testDim+1:i*testDim);
end

% 根据标签排一下数据
[trainX,trainY] = SortData(trainX,trainY);
[testX,testY] = SortData(testX,testY);

% 化成稀疏矩阵
%testX = sparse(testX);
%trainX = sparse(trainX);
% 标准化一下数据
trainX = trainX/max(max(trainX));
testX = testX/max(max(testX));

end

