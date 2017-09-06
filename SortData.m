function [ newX,newY ] = SortData( X,Y )
[~,n] = size(X);
lo = zeros(1,n);
loTop=1;
hi = zeros(1,n);
hiTop = 1;
lo(loTop) = 1;
loTop=loTop+1;
hi(hiTop) = n;
hiTop=hiTop+1;
newX = X;
newY = Y;
while loTop>1 && hiTop>1
    loTop = loTop-1;
    templo = lo(loTop);
    hiTop = hiTop-1;
    temphi = hi(hiTop);
    if templo>=temphi
        continue;
    end
    [p,newX,newY] = PartitionData(newX,newY,templo,temphi);
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

