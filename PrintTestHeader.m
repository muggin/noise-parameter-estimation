function PrintTestHeader( imageName, a, b, threshold, windowSize )
%PRINTTESTHEADER funkcja wypisuje informacje o wykonywanym tescie
%   @param  imageName - 
%   @param  a - 
%   @param  b - 
%   @param  threshold - 
%   @param  windowSize - 
    fprintf('* TEST PARAMETERS\n');
    fprintf('Image: %s\na: %.5f\nb: %.5f\nThreshold: %.3f\nWindow Size: %i\n', char(imageName), a, b, threshold, windowSize);

end

