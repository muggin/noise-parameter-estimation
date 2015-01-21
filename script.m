clearvars; close all; clc;

%% Skrypt
a = 0.005; 
b = 0.0016; 

figure(1);
lena = im2double(imread('lena.bmp'));
subplot(1,2,1);imshow(lena,[]);
noisyLena = addPoissonGaussianNoise(lena, a, b);
subplot(1,2,2);imshow(noisyLena,[]);

CalculateNoiseStdDev(noisyLena)