clearvars; close all; clc;

%% Skrypt
a = 0.005; 
b = 0.0016; 

figure(1);
lena = im2double(rgb2gray(imread('test_images/lena.tiff')));
subplot(1,2,1); imshow(lena,[]);
noisyLena = GenerateNoise(lena, a, b);
subplot(1,2,2); imshow(noisyLena,[]);
GenerateSamples(noisyLena, 0.5, 3);