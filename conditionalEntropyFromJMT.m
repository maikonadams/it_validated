function condEntropy = conditionalEntropyFromJMT(jointMat)

[row,col] = size(jointMat);

marginY(1:row) = 0.0;

for rr=1:row
    marginY(rr) = sum(jointMat(rr,:));
end;

temp = 0.0;
for rr=1:row
    
    temprow = jointMat(rr,:)*(marginY(rr)^(-1));
    temp = temp + marginY(rr)*entropyVector(temprow);
    
end;

condEntropy = temp;