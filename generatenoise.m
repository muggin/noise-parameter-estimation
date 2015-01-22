function [newImage] = generatenoise(image, aParameter, bParameter )
%GENERATENOISE generates signal dependent noise
%   @param  image - input image
%   @param  aParameter - signal-dependent component parameter
%   @param  bParameter - signal-independent component parameter
%   @return newImage - output image with added noise
%
% Copyright 2015 Wojciech Kryscinski, Krzysztof Spytkowski

    % niezalezny szum o rozkladzie N(0,1)
    independentRandNoise = randn(size(image));

    % odchylenie standardowe szumu Poisson-Gauss
    overallNoiseStdDev = sqrt(aParameter .* image + bParameter);

    % dodanie szumu do obrazu wejsciowego (patrz wzor 1)
    newImage = image + independentRandNoise .* overallNoiseStdDev;

end

