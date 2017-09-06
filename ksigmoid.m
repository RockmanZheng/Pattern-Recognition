function [ y ] = ksigmoid( x, u, weights )
% Multi-variables version of sigmoid function
% Number of categories: k
% Number of entries of sample: n
% Category: v
[~,k]=size(weights);
tempv= weights(:,u);
for i=1:k
    weights(:,i)=weights(:,i)-tempv;
end
y=1/sum(exp(weights'*x));


end

