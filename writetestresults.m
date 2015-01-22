function writetestresults(fileDescriptor, estimatedA, estimatedB, testDuration)
%PRINTTESTHEADER funkcja wypisuje informacje o wynikach tescie
%   @param  fileDescriptor - output file descriptor
%   @param  estimatedA - estimated parameter a
%   @param  estimatedB - estimated parameter b
%   @param  testDuration - test duration (cpu time)
%
% Copyright 2015 Wojciech Kryscinski, Krzysztof Spytkowski

    fprintf(fileDescriptor, '* TEST RESULTS\n');
    fprintf(fileDescriptor, 'Estimated a: %.5f\nEstimated b: %.5f\nDuration: %.5f\n\n', ...
            estimatedA, estimatedB, testDuration);

end

