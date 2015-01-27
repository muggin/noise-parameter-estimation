%% Script testing signal dependency of noise
backgrounds = [0, 32, 64, 128, 256];

images = [];
for background = backgrounds
    newImage = background * ones(256);
    noiseImage = generatenoise(newImage, 0.05, 0.016);
    images = [images, noiseImage];
end

imshow(images, []);