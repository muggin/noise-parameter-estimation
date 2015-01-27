%% Script testing signal dependency of noise
backgrounds = [0, 32, 64, 128, 256];

figure(1);
bgCurrent = 1;
bgCount = size(backgrounds, 2)
images = [];
for background = backgrounds
    newImage = background * ones(256);
    noiseImage = generatenoise(newImage, 0.1, 0.064);
    imageDifference = noiseImage - newImage;
    images = [images, noiseImage];
    subplot(1, bgCount, bgCurrent);
    histfit(imageDifference(:), 4500);
    bgCurrent = bgCurrent + 1;
end

figure(2)
imshow(images, []);