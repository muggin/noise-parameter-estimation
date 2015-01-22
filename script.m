clearvars; close all; clc;

%% Skrypt
a = 0.015; 
b = 0.0064; 


clc;
%figure(1);
lena = im2double(rgb2gray(imread('test_images/lena.tiff')));
%subplot(1,2,1);imshow(lena,[]);

wynikA = 0;
wynikB = 0;
wynikStd = 0;
for i = 1 : 50
noisyLena = generatenoise(lena, a, b);
%subplot(1,2,2);imshow(noisyLena,[]);
%imwrite(noisyLena, 'noisyLena.tiff', 'tiff');

noiseStdDev = computenoisestddev(noisyLena);

samples = generatesamples(noisyLena,  0.35, noiseStdDev, 3);


[ k0 k1 ] = leastsquaremethod( noisyLena, samples, noiseStdDev );


[a1, b1] = estimatenoiseparameters(k0, k1);
wynikStd = wynikStd + noiseStdDev;
wynikA = wynikA + a1;
wynikB = wynikB + b1;
end;
scatter(samples(:,1), samples(:,2), '.');
wynikA / 50
wynikB / 50
wynikStd / 50

