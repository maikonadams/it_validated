function hcxy = condionalEntropy_from_mi(matX , matY)
% VALIDATED
%hjyx = jointEntropy(matY , matX);
hx = entropy2d(matX);

ixy = mutualInfo(matX, matY);

hcxy = hx - ixy;
