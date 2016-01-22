% calculating the Entropy of an image
% i'm going to be receiving an image from 0 to 255
% validated

function entropyValue = entropy2d(img2d)

% histo = histogram(img2d);
% NN = sum(histo.Values);
% pp=histo.Values/NN;

histo = histc(img2d(:), unique(img2d(:)));
NN = sum(histo);
pp = histo/NN;

temp = 0.0;
for ii=1:length(pp)
    if pp(ii) >0
        temp = temp + ( pp(ii) )*log2( pp(ii) );
    end;
end;
entropyValue=-temp;


%histNoiseHE = histogram 

%histJing = 