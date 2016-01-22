%% tone-mapping jing
% here we receive the luminance plus noise, num of bins and we
% delivery a new picture tone-mapped in a way to avoid enhancing the 
% noise
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
    % applying normal histogram
    pureHEimg = histeq2(x_lum);
    pureHEimg2 = histeq1(x_lum);
    
    entropyHE = entropy2d(pureHEimg);
    % maybe inserting the normal tone mapping
    % inserting a noise and a different noise each frame
    [noiseImg,noise] = camModel(x_lum);
    
    % fixing the noise the dynamic range with HE
    noiseHEimg = histeq2(noiseImg); 
     noiseHEimg2 = histeq1(noiseImg); 
   
    miInPUREOutHe=mutualInfo(pureHEimg,noise);
    condh_pure=condionalEntropy2(pureHEimg,noise);
    
    miInNoiseOutHe=mutualInfo(noiseHEimg2,noise);
    
    entropyNoiseHE = entropy2d(noiseHEimg);
    condh_he=condionalEntropy2(noiseHEimg2,noise);
    
    % applying jing methong to limit the HE
    jingimg = jingtm(noiseImg,1000);
    
    miInNoiseOutJing=mutualInfo(jingimg,noise);
    entropyJing=entropy2d(jingimg);
    condh_jing=condionalEntropy2(jingimg,noise);
   

