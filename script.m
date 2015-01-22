clearvars; close all; clc;

%% Skrypt
a = 0.005; 
b = 0.0016; 

figure(1);
lena = im2double(imread('test_images/lena.tiff'));
subplot(1,2,1);imshow(lena,[]);
noisyLena = GenerateNoise(lena, a, b);
subplot(1,2,2);imshow(noisyLena,[]);
%imwrite(noisyLena, 'noisyLena.tiff', 'tiff');

noiseStdDev = computenoisestddev(noisyLena)

samples = generatesamples(rgb2gray(noisyLena),  0.13, noiseStdDev, 5);

[ k0 k1 ] = leastsquaremethod( noisyLena, samples, noiseStdDev )


[a1, b1] = estimatenoiseparameters(k0, k1)