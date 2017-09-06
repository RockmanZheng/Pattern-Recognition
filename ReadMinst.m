function [ trainX,trainY,testX,testY ] = ReadMinst( path )
%READMINST �˴���ʾ�йش˺�����ժҪ
%   ��ȡMINST���ݿ⣬���ѵ�����Ͳ��Լ��Լ����ǵı�ǩ

% ��ѵ�����Ͳ��Լ��Լ���Ӧ��ǩ�ļ�
trainDataFile = fopen(strcat(path,'train-images.idx3-ubyte'));
trainLabelFile = fopen(strcat(path,'train-labels.idx1-ubyte'));
testDataFile = fopen(strcat(path,'t10k-images.idx3-ubyte'));
testLabelFile = fopen(strcat(path,'t10k-labels.idx1-ubyte'));

% �ȶ�ȡѵ����ǩ�ļ�
trainLabelMagicNumber = fread(trainLabelFile,1,'int32',0,'b');
trainLabelItemNum = fread(trainLabelFile,1,'int32',0,'b');
trainLabels = fread(trainLabelFile,trainLabelItemNum,'uint8',0,'b');
trainY = trainLabels;
% ��ȡѵ����
trainDataMagicNumber=  fread(trainDataFile,1,'int32',0,'b');
trainDataImgNum = fread(trainDataFile,1,'int32',0,'b');
trainDataRows = fread(trainDataFile,1,'int32',0,'b');
trainDataCols = fread(trainDataFile,1,'int32',0,'b');
trainData = fread(trainDataFile,trainDataImgNum*trainDataRows*trainDataCols,'uint8',0,'b');

% ��ȡ���Ա�ǩ�ļ�
testLabelMagicNumber = fread(testLabelFile,1,'int32',0,'b');
testLabelItemNum = fread(testLabelFile,1,'int32',0,'b');
testLabels = fread(testLabelFile,testLabelItemNum,'uint8',0,'b');
testY = testLabels;
% ��ȡ���Լ�
testDataMagicNumber=  fread(testDataFile,1,'int32',0,'b');
testDataImgNum = fread(testDataFile,1,'int32',0,'b');
testDataRows = fread(testDataFile,1,'int32',0,'b');
testDataCols = fread(testDataFile,1,'int32',0,'b');
testData = fread(testDataFile,testDataImgNum*testDataRows*testDataCols,'uint8',0,'b');
% �ر��ļ�
fclose(trainDataFile);
fclose(trainLabelFile);
fclose(testDataFile);
fclose(testLabelFile);

% ѵ��������ͼƬ�Ͽ�
trainDim = trainDataRows*trainDataCols;
trainX = zeros(trainDim,trainDataImgNum);
for i=1:trainDataImgNum
    trainX(:,i) = trainData((i-1)*trainDim+1:i*trainDim);
end

% ���Լ�����ͼƬ�Ͽ�
testDim = testDataRows*testDataCols;
testX = zeros(testDim,testDataImgNum);
for i=1:testDataImgNum
    testX(:,i) = testData((i-1)*testDim+1:i*testDim);
end

% ���ݱ�ǩ��һ������
[trainX,trainY] = SortData(trainX,trainY);
[testX,testY] = SortData(testX,testY);

% ����ϡ�����
%testX = sparse(testX);
%trainX = sparse(trainX);
% ��׼��һ������
trainX = trainX/max(max(trainX));
testX = testX/max(max(testX));

end

