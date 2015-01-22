function [noiseStdDev] = computenoisestddev(image)
% COMPUTENOISESTDDEV computes the estimated noise standard deviation
%   @param  image - input image
%   @return noiseStdDev - estimated noise standard deviation
%
% Copyright 2015 Wojciech Kryscinski, Krzysztof Spytkowski

    % estimating noise standard deviation (ref: equation 8)
    K_SCALE_FACTOR = 0 / 0.674;
    [cA, cH, cV, cD] = dwt2(image, 'db5');
    noiseStdDev = K_SCALE_FACTOR * median(abs(cD(:)));

end 
