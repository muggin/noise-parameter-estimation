clearvars; close all; clc;

%% Skrypt
a = 0.015; 
b = 0.0036; 

%figure(1);
lena = im2double(rgb2gray(imread('test_images/lena.tiff')));
%subplot(1,2,1);imshow(lena,[]);
noisyLena = generatenoise(lena, a, b);
%subplot(1,2,2);imshow(noisyLena,[]);
%imwrite(noisyLena, 'noisyLena.tiff', 'tiff');

noiseStdDev = computenoisestddev(noisyLena)

samples = generatesamples(noisyLena,  0.35, noiseStdDev, 3);
scatter(samples(:,1), samples(:,2));

[ k0 k1 ] = leastsquaremethod( noisyLena, samples, noiseStdDev )


[a1, b1] = estimatenoiseparameters(k0, k1)