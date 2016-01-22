function hcxy = condionalEntropy2(matX , matY)
% validated by hand !!! TWICE
% receiving the joint Matrix
[jointMat2, marginX, marginY] = jointProbab(matX, matY);

jointMat = jointMat2';

[row, col] = size(jointMat);
temp = 0.0;
for rr=1:row
    
    temprow = jointMat(rr,:)*(marginY(rr)^(-1));
    temp = temp + marginY(rr)*entropyVector(temprow);
    
end;

hcxy = temp;