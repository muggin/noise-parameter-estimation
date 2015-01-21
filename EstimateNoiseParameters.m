function [ a, b ] = EstimateNoiseParameters( estK0, estK1)
%ESTIMATENOISEPARAMTERES funkcja estymuje parametry szumu PG
%   @param  estK0 - wyestymowany wspolczynnik K0
%   @param  estK1 - wyestymowany wspolczynnik K1
%   @return noiseParameters - wyestymowane parametry szumu PG

    % estymacja parametrow szumu PG (patrz wzor 19)
    a = (estK1 + estK0) ^ 2 - estK0;
    b = estK0 ^ 2;
end

