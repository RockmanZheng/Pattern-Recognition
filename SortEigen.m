function [ newV,newD ] = SortEigen( V,D )

[~,n] = size(V);
lo = zeros(1,n);
loTop=1;
hi = zeros(1,n);
hiTop = 1;
lo(loTop) = 1;
loTop=loTop+1;
hi(hiTop) = n;
hiTop=hiTop+1;
newV = V;
newD = D;
while loTop>1 && hiTop>1
    loTop = loTop-1;
    templo = lo(loTop);
    hiTop = hiTop-1;
    temphi = hi(hiTop);
    if templo>=temphi
        continue;
    end
    [p,newV,newD] = PartitionEigen(newV,newD,templo,temphi);
    lo(loTop) = templo;
    loTop=loTop+1;
    hi(hiTop) = p;
    hiTop = hiTop+1;
    lo(loTop)=p+1;
    loTop = loTop+1;
    hi(hiTop)=temphi;
    hiTop = hiTop+1;
end
end

