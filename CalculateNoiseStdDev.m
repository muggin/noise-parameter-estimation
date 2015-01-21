function [noiseStdDev] = CalculateNoiseStdDev(image)
% CALCULATENOISESTDDEV funkcja obliczajaca odchylenie standardowe szumu
%   @param  image - obraz wejsciowy
%   @return noiseStdDev - odchylenie standardowe szumu

% aproksymacja odchylenia standardowego szumu w obrazie (patrz wzor 8)
[CA, CH, CV, CD] = dwt2(image, 'db5');
noiseStdDev = median(abs(CD(:))) / 0.6745;
end 
