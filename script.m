clearvars; close all; clc;

%% Skrypt
a = 0.01; 
b = 0.0036; 


clc;
%figure(1);
lena = im2double(rgb2gray(imread('test_images/lena.tiff')));
%subplot(1,2,1);imshow(lena,[]);
%imwrite(lena, 'grayLena.tiff', 'tiff');
wynikA = 0;
wynikB = 0;
wynikStd = 0;
for i = 1 : 30
noisyLena = generatenoise(lena, a, b);
%subplot(1,2,2);imshow(noisyLena,[]);
%imwrite(noisyLena, 'noisyLena.tiff', 'tiff');

noiseStdDev = computenoisestddev(noisyLena);

samples = generatesamples(noisyLena,  0.6, noiseStdDev, 3);


[ k0 k1 ] = leastsquaremethod( noisyLena, samples, noiseStdDev );


[a1, b1] = estimatenoiseparameters(k0, k1);
wynikStd = wynikStd + noiseStdDev;
wynikA = wynikA + a1;
wynikB = wynikB + b1;
end;
%scatter(samples(:,1), samples(:,2), '.');
wynikA / 30
wynikB / 30
wynikStd / 30


%% plot MAE
X = [0.25:0.05:0.5];
Ya = [0.0025, 0.0024, 0.0021, 0.0021, 0.0019, 0.0019];
Yb = [0.0008,0.0006, 0.0006, 0.0004, 0.0007, 0.0008];

grid on
plot(X,Ya,X,Yb);
axis([0.225, 0.525, 0, 0.003]);
xlabel('p');
ylabel('MAE');
text(0.38,0.0022,'MAE dla a');
text(0.38,0.0007,'MAE dla b');
grid off;

%% Script testing signal dependency of noise
backgrounds = [0, 32, 64, 128, 256];

images = [];
for background = backgrounds
    
    %%
newImage = 250 * ones(256);
noiseImage = generatenoise(newImage, 0.005, 0.0036);
noiseImage = noiseImage(:);
[nelements,centers] = hist(noiseImage,500);
max_sigma = 1;
X = linspace(-4*max_sigma, 4*max_sigma, 1000);
normal_pdf = pdf('Normal', X, 0, 1);
hold on; grid on;
plot(X, normal_pdf, 'Color', [1, 0, 0], 'LineStyle', '-', 'LineWidth', 2);
hold on;

plot(centers, nelements ./ trapz(centers, nelements), 'Color', [0, 0, 0], 'LineWidth', 1);

%%
images = [images, noiseImage];
end

imshow(images, []);


%%
%% Script testing signal dependency of noise
backgrounds = [0, 32, 64, 128, 256];

figure(1);
bgCurrent = 1;
bgCount = size(backgrounds, 2)
images = [];
for background = backgrounds
newImage = background * ones(256);
noiseImage = generatenoise(newImage, 0.5, 0.016);
images = [images, noiseImage];
imgDiff = noiseImage - newImage
subplot(1, bgCount, bgCurrent);
histfit(noiseImage(:));
bgCurrent = bgCurrent + 1;
end

figure(2)
imshow(images, []);

%%
%% Script testing signal dependency of noise
backgrounds = [0, 32, 64, 128, 256];

figure(1);
bgCurrent = 1;
bgCount = size(backgrounds, 2)
images = [];
for background = backgrounds
newImage = background * ones(256);
noiseImage = generatenoise(newImage, 0.1, 0.064);
imgDiff = noiseImage - newImage;
images = [images, noiseImage];
subplot(1, bgCount, bgCurrent);
histfit(imgDiff(:), 4500);
bgCurrent = bgCurrent + 1;
end
%%
figure(2)
imshow(images, []);