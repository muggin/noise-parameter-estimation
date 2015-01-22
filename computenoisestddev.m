function [noiseStdDev] = computenoisestddev(image)
% COMPUTENOISESTDDEV computes the estimated noise standard deviation
%   @param  image - input image
%   @return noiseStdDev - estimated noise standard deviation
%
% Copyright 2015 Wojciech Kryscinski, Krzysztof Spytkowski

    % estimating noise standard deviation (ref: equation 8)
    K_SCALE_FACTOR = 1 / 0.6745;
    [cA, cH, cV, cD] = dwt2(image, 'db9');
    noiseStdDev = K_SCALE_FACTOR * median(abs(cD(:)));

end 
