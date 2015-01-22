function [estimatedA, estimatedB] = estimatenoiseparameters(estimatedK0, estimatedK1)
%ESTIMATENOISEPARAMTERES estimated poisson-gaussian noise parameters a, b
%   @param  estimatedK0 - estimated gaussian-gaussian noise parameter K0
%   @param  estimatedK1 - estimated gaussian-gaussian noise parameter K1
%   @return [estimatedA, estimatedB] - estimated poisson-gaussian noise parameters

    % estimating poisson-gaussian noise parameters (ref: equation 19)
    estimatedA = (estimatedK1 + estimatedK0) ^ 2 - estimatedK0 ^ 2;
    estimatedB = estimatedK0 ^ 2;
    
end

