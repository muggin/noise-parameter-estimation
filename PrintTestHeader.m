function PrintTestHeader( imageName, a, b, threshold, windowSize )
%PRINTTESTHEADER funkcja wypisuje informacje o wykonywanym tescie
%   @param  imageName - nazwa testowanego obrazka
%   @param  a - wartosc parametru a uzyta przy generowaniu szumu
%   @param  b - wartosc parametru b uzyta przy generowaniu szumu
%   @param  threshold - wartosc progu
%   @param  windowSize - rozmiar okna
    fprintf('* TEST PARAMETERS\n');
    fprintf('Image: %s\na: %.5f\nb: %.5f\nThreshold: %.3f\nWindow Size: %i\n', char(imageName), a, b, threshold, windowSize);

end

