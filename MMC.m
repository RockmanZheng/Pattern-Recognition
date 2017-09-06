function W= MMC( X,classIndices,featureDim )
%MMC �˴���ʾ�йش˺�����ժҪ
% ���� maximum margin criterion ��Ӧ�Ľ�ά�任
% ���¼� Ef?cient and Robust Feature Extraction by Maximum Margin
% Criterion��Haifeng Li ����
% [Retrun] W: ��ά�任�������� x����ά��Ϊ W'*x��Ҳ�У��£�����
% [param] X: ���ݵ㣬���������ź�
% [param] classIndices: �������ݵ��� X �е��±���ʼ��
% [param] featureDim: Ҫ���͵���ά��������˵���£������ռ��ά��

% ��ȡ within-class covariance matrix
Sw = GetSWithin(X,classIndices);
% ��ȡ between-class covariance matrix
Sb = GetSBetween(X,classIndices);
% ��һ�²�֣��õ�MMC����
S = Sb-Sw;
% ��ȡMMC���������ֵ����������
[V,D] = eig(S);
% ѡȡǰfeatureDim�������ֵ��Ӧ����������
% �Ȱ�������ֵ��С����С����������������������ֵ
[newV,newD] = SortEigen(V,D);
[m,n] = size(newV);
% ȡ���� featureDim ��
W = newV(:,n-featureDim+1:n);

end

