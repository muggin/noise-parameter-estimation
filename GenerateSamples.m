function [ samples ] = GenerateSamples( image, threshold, windowSize )
%GENERATESAMPLES funkcja generuje zbior probek na podstawie ktorych
%dokonana zostanie aproksymacja wartosci k1 przy pomocy LSE.
%   @param  image - obraz wejsciowy
%   @param  threshold - prog akceptacji probki
%   @param  windowSize - rozmiar okna do obliczania statystyk lokalnych
%   @return samples - zbior probek

% odszumienie obrazu w celu znalezienia jednorodnych obszarow (patrz wzor 11)
% TODO: obliczyc yD przy pomocy waveletow. Aktualnie wykorzystujemy druga z
% proponowanych mozliwosci - filtr gaussowski.
G = fspecial('gaussian',[5 5], 2);
yD = imfilter(image, G,'same');

% obliczenie lokalnych srednich w odszumionym obrazie
localMeans = conv2(yD, ones(windowSize) / windowSize ^ 2,'same');
localMeans = localMeans(:);

% obliczenie lokalnych odchylen standardowych w odszumionym obrazie
localStdDevs = stdfilt(yD, ones(windowSize));
localStdDevs = localStdDevs(:);

% wybor obszarow do zbioru probek LSE (patrz wzor 12)
acceptedSamples = find(localStdDevs < threshold);
samples = [localMeans(acceptedSamples), localStdDevs(acceptedSamples)];
end

