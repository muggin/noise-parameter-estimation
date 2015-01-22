function [k0, k1] = leastsquaremethod(image, samples, noiseStdDev)
%LEASTSQUAREMETHOD estimates gaussian-gaussian noise parameters k0, k1
%   @param  image - input image
%   @param	samples - set of samples used for estimation
%   @param  noiseStdDev - odchylenie standardowe szumu
%   @return [k0, k1] - estimated noise parameters	
%
% Copyright 2015 Wojciech Kryscinski, Krzysztof Spytkowski

    % estimating noise parameters using least square method (ref: equation 14-18)
    B = samples(:, 2) - noiseStdDev;
    A = samples(:, 1) - mean(image(:));
    k1 = (A * B) / (norm(A) ^ 2);
    k0 = noiseStdDev - k1 * mean(image(:));

end