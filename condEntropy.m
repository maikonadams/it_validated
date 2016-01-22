% VALIDATED
% conditional entropy using the joint probab
% table only ! the equation is
% - Sum Sum f(x,y)* log f(y|x)
% where f(a|p) = f(a,p)/f(p)

function [ch] = condEntropy(matX, matY)

% calculating the joint entropy  and the margins value
% to then calculate the conditional entropy
[jm,mx,my] = jointProbab(matX,matY);

[ROW, COL] = size(jm);

temp=0;
for ii=1:ROW
    for jj=1:COL
        if jm(ii,jj)>0
            temp = temp + jm(ii,jj)*log2( jm(ii,jj)/my(jj)  ); 
        end;
    end;
end;

ch = -temp;
