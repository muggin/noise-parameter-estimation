function [ noiseStdDev, a, b] = runtest(image, paramA, paramB, threshold, windowSize)
%RUNTEST runs single test with input parameters
%   @param  image - input image
%   @param  paramA - parameter a for noise generation
%   @param  paramB - parameter b for noise generation
%   @param  threshold - sample acceptance threshold
%   @param  windowSize - local statistics window size
%   @return [noiseStdDev, a, b] - generated noise standard deviation and estimated noise parameters
%
% Copyright 2015 Wojciech Kryscinski, Krzysztof Spytkowski
    
    % preprocessing - noise generation (ref: equations 1-2)
    noisyImage = generatenoise(image, paramA, paramB);
    
    % noise std dev estimation (ref: equations 7-9)
    noiseStdDev = computenoisestddev(noisyImage);
    
    % generating sample set for parameter estimation (ref: equations 10-12)
    samples = generatesamples(noisyImage,  threshold, noiseStdDev, windowSize);
    %scatter(samples(:,1), samples(:,2));
    
    % estimating GG noise model parameters (ref: equations 14-18)
    [k0, k1] = leastsquaremethod( noisyImage, samples, noiseStdDev );
    
    % estimating PG noise model parameters (ref: equation 19)
    [a, b] = estimatenoiseparameters(k0, k1);
    
end

