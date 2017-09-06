% ��MINST���ݿ���ʵ��
% ��MMC��maximum margin criterion���������н�ά
% ��LDA������
% �����ݽ��͵���ͬ��ά����������ȷ��ͼ��
% �������ά��
Dim = 320;
% ���ý��͵�Ŀ��ά��
featureDim = [5 10 20 40 80 160 320];
[~,expNum]= size(featureDim);
% ����������
errorRate = zeros(1,expNum);
%correctRate = zeros(1,expNum);
% ����MINST����
[trainX,trainY,testX,testY] = ReadMinst('');
% ��ȡclassIndices
trainClassIndices = GetClassIndices(trainY);
%testClassInidices = GetClassIndices(testY);

% ��ȡ within-class covariance matrix
Sw = GetSWithin(trainX,trainClassIndices);
% �����������ֵ����׼��һ��
Sw = Sw/eigs(Sw,1);
% ��ȡ between-class covariance matrix
Sb = GetSBetween(trainX,trainClassIndices);
% �����������ֵ����׼��һ��
Sb = Sb/eigs(Sb,1);
% ��һ�²�֣��õ�MMC����
S = Sb-Sw;
% ��ȡMMC���������ֵ������������������ 350 ������ֵ�Ͷ�Ӧ����������
% �Զ��Ѿ���������ֵ�ź�����
[V,D] = eigs(S,Dim);
% ѡȡǰfeatureDim�������ֵ��Ӧ����������
% �Ȱ�������ֵ��С����С����������������������ֵ
%[newV,newD] = SortEigen(V,D);
%[m,n] = size(newV);
[m,n] = size(V);
% ��ÿһ��Ŀ��ά����ʵ��
for i=1:expNum
    % ��ȡ��ά�任
    W = V(:,n-featureDim(i)+1:n);
    % ��ȡѵ�����Ͳ��Լ�������
    trainFeature = W'*trainX;
    testFeature = W'*testX;
    % ����������softmax������
    weights = kgradAscent(trainFeature,trainY');
    [correctRate,classified]=ktest(testFeature,testY',weights,unique(trainY)');
    errorRate(i) = 1-correctRate;
end
% ��ͼ
figure
plot(featureDim,errorRate);
ylabel('������');
xlabel('ά��');





