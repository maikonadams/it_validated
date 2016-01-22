clc;
clear;

%% loading the picture from the tiff file
tiffobj = Tiff('44n2.1.tif','r');
tiffobj.setTag('SGILogDataFmt', Tiff.SGILogDataFmt.Float);
factor=tiffobj.getTag(37439);
imdata = tiffobj.read();

x_lum = factor*(imdata(:,:,1)+ imdata(:,:,2)+ imdata(:,:,3))/3;
%x_lum = factor*(imdata(1:100,1:100,1)+ imdata(1:100,1:100,2)+ imdata(1:100,1:100,3))/3;
[row, col] = size(x_lum);

[noiseImg,noise] = camModel(x_lum);

noiseHEimg = histeq2(noiseImg);
jingimg = jingtm(noiseImg,1000);

%% 
codEntHE = condEntropy(noiseHEimg,noise);
codEntJing = condEntropy(jingimg,noise);

miHE = mutualinfo(noiseHEimg, noise);
miJing = mutualinfo(jingimg, noise);

%%
% delta=10;
% 
% init=1;
% lim=init+delta;
% 
% miHE_mit = mi(noiseHEimg(init:lim,init:lim), noise(init:lim,init:lim));
% miJing_mit = mi(jingimg(init:lim,init:lim), noise(init:lim,init:lim));
% 
% %%
% codEntHE_mit = condh(noiseHEimg(init:lim,init:lim), noise(init:lim,init:lim));
% codEntJing_mit = condh(jingimg(init:lim,init:lim), noise(init:lim,init:lim));

%% conditional entropy
condEntropyJM = condionalEntropy(jingimg,noise);
condEntropyHE = condionalEntropy(noiseHEimg,noise);

%% 
mi3JM = condionalEntropy(jingimg,noise);
mi3HE = condionalEntropy(noiseHEimg,noise);


%%
%[Mutual_Information2HE,joint_entropy2he]=MutualInformation2(noiseHEimg(init:lim,init:lim), noise(init:lim,init:lim));
%[Mutual_Information2li,joint_entropy2li]=MutualInformation2(jingimg(init:lim,init:lim), noise(init:lim,init:lim));