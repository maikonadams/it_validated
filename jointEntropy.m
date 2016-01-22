function hjxy = jointEntropy(matX , matY)
% validated
% receiving the joint Matrix
[jointMat, marginX, marginY] = jointProbab(matX, matY);

% scanning the joint Matrix
[row, col]=size(jointMat);

% scanning the entire matrix
temp=0;
for ii=1:row
    for jj=1:col
        if jointMat(ii,jj) >0
            temp = temp + jointMat(ii,jj)*log2(jointMat(ii,jj)); 
        end;    
    end;
end;
hjxy = -temp;

