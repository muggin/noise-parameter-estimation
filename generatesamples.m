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
    %G = fspecial('gaussian',[5 5], 1);
    %yD = imfilter(image, G,'same');
    %yD = dwt(image, 'db9');
    yD = wden(image, 'heursure', 's', 'one', 1, 'db9');

    % computing local means of the input image
    localMeans = conv2(image, ones(windowSize) / (windowSize ^ 2), 'same');
    localMeans = localMeans(:);

    % computing local standard deviations of the input image
    localStdDevs = stdfilt(image, ones(windowSize));
    localStdDevs = localStdDevs(:);
    
    denoisedLocalStdDevs = stdfilt(yD, ones(windowSize)); 
    denoisedLocalStdDevs = denoisedLocalStdDevs(:);

    % selecting estimated signal samples and noise standard deviations (ref: equation 12)
    epsilon = threshold * noiseStdDev;
    acceptedSamples = find(denoisedLocalStdDevs < epsilon);
    samples = [localMeans(acceptedSamples), localStdDevs(acceptedSamples)];

end

