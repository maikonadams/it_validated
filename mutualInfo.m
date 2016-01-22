function ixy = mutualInfo(matX , matY)
% mutual info validated
% VALIDATED
hx = entropy2d(matX);

hy = entropy2d(matY);

hx_comma_y = jointEntropy(matX,matY);

ixy = hx + hy - hx_comma_y;
