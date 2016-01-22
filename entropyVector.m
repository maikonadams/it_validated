function entropyValue = entropyVector(probValues)

% first check if the probability is one !!!
% has to be one cos we are working with the 
% entire alphabet 

totalProbab = sum(probValues);
% 
if totalProbab < 0.99
    error('the total sum has to be one'); 
    %entropyValue = -1;
end;

% calculation of the entropy 
numOfSamples = length(probValues);
tempEntropy = 0.0;
for ii=1:numOfSamples
    if probValues(ii) > 0
        tempEntropy = tempEntropy + probValues(ii)*log2( probValues(ii) );
    else
        tempEntropy = tempEntropy + 0;
    end;
end;

entropyValue = -tempEntropy;


