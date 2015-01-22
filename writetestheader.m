function writetestheader(fileDescriptor, imageName, aParameter, bParameter, threshold, windowSize)
%PRINTTESTHEADER funkcja wypisuje informacje o wykonywanym tescie
%   @param  fileDescriptor - output file descriptor
%   @param  imageName - nazwa testowanego obrazka
%   @param  aParameter - wartosc parametru a uzyta przy generowaniu szumu
%   @param  bParameter - wartosc parametru b uzyta przy generowaniu szumu
%   @param  threshold - wartosc progu
%   @param  windowSize - rozmiar okna
%
% Copyright 2015 Wojciech Kryscinski, Krzysztof Spytkowski

    fprintf(fileDescriptor, '* TEST PARAMETERS\n');
    fprintf(fileDescriptor, 'Image: %s\na: %.5f\nb: %.5f\nThreshold: %.3f\nWindow Size: %i\n', ...
            imageName, aParameter, bParameter, threshold, windowSize);

end

