function [ k0 k1 ] = LastSquareMethod( image, samples, noiseStdDev )
%LastSquareMethod funkcja oblicza wartoœci parametrów k0 i k1 
%korzystaj¹c z matody najmniejszych kwadratów
%   @param  image - obraz wejsciowy
%   @return samples - zbior probek ([sample localStdDevs])
%   @param  noiseStdDev - odchylenie standardowe szumu

B = samples(:, 2) - noiseStdDev;
A = samples(:, 1) - mean(image(:));
k1 = (A * B) / (norm(A) ^ 2);
k0 = noiseStdDev - k1 * mean(image(:));

end