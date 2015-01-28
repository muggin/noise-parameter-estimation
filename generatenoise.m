function [newImage] = generatenoise(image, aParameter, bParameter)
%GENERATENOISE generates signal dependent noise
%   @param  image - input image
%   @param  aParameter - signal-dependent component parameter
%   @param  bParameter - signal-independent component parameter
%   @return newImage - output image with added noise
%
% Copyright 2015 Wojciech Kryscinski, Krzysztof Spytkowski

    % signal-independent gaussian noise N(0,1)
    independentRandNoise = randn(size(image));

    % signal-dependent poisson-gaussian noise standard deviation
    overallNoiseStdDev = sqrt(aParameter .* image + bParameter);

    % adding generated noise to the input image (ref: equation 1)
    newImage = image + independentRandNoise .* overallNoiseStdDev;

end

