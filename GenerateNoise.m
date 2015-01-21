function [newImage] = GenerateNoise(image, a, b  )
%GENERATENOISE funkcja dodajaca szum do zdjecia
%   @param  image - obraz wejsciowy
%   @param  a - wspolczynnik szumu zaleznego od sygnalu
%   @param  b - wspolczynnik szumu niezaleznego od syngalu
%   @return newImage - obraz wejsciowy po dodaniu wygenerowanego szumu

% niezalezny szum o rozkladzie N(0,1)
independentRandNoise = randn(size(image));

% odchylenie standardowe szumu Poisson-Gauss
overallNoiseStdDev = sqrt(a .* image + b);

% dodanie szumu do obrazu wejsciowego (patrz wzor 1)
newImage = image + independentRandNoise .* overallNoiseStdDev;
end

