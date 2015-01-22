function [samples] = generatesamples(image, threshold, noiseStdDev, windowSize)
%GENERATESAMPLES generates a set of estimated signal samples and their 
%                corresponding noise standard deviations 
%   @param  image - input image
%   @param  threshold - sample acceptance threshold
%   @param  noiseStdDev - noise standard deviation
%   @param  windowSize - local statistics window size
%   @return samples - generated set of samples
%
% Copyright 2015 Wojciech Kryscinski, Krzysztof Spytkowski

    % denoising the input image in order to find uniform areas (ref: equation 11)
    G = fspecial('gaussian',[5 5], 1);
    denoisedImage = imfilter(image, G,'same');

    % computing local means of the denoised image
    localMeans = conv2(denoisedImage, ones(windowSize) / windowSize ^ 2, 'same');
    localMeans = localMeans(:);

     % computing local standard deviations of the denoised image
    localStdDevs = stdfilt(denoisedImage, ones(windowSize));
    localStdDevs = localStdDevs(:);

    % selecting estimated signal samples and noise standard deviations (ref: equation 12)
    epsilon = threshold * noiseStdDev
    acceptedSamples = find(localStdDevs < epsilon);
    samples = [localMeans(acceptedSamples), localStdDevs(acceptedSamples)];

end

