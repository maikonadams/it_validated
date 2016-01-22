% calculating the Entropy of an image
% i'm going to be receiving an image from 0 to 255

function entropyValue = entropyImg(img2d,numBins)

histo = histogram(img2d, numBins);
[row,col] = size(img2d);
NN = sum(histo.Values);
temp = 0.0;
for ii=1:255
    if histo.Values(ii) >0
        temp = temp + ( histo.Values(ii)/(NN) )*log2( histo.Values(ii)/(NN) );
    end;
end;
entropyValue=-temp;


%histNoiseHE = histogram 

%histJing = 