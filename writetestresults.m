function writetestresults(fileDescriptor, noiseStdDev, estimatedA, estimatedB, testDuration)
%PRINTTESTHEADER writes test results to file
%   @param  fileDescriptor - output file descriptor
%   @param  noiseStdDev - generated noise std dev
%   @param  estimatedA - estimated parameter a
%   @param  estimatedB - estimated parameter b
%   @param  testDuration - test duration (cpu time)
%
% Copyright 2015 Wojciech Kryscinski, Krzysztof Spytkowski

    fprintf(fileDescriptor, '* TEST RESULTS\n');
    fprintf(fileDescriptor, 'Noise StdDev: %.5f\nEstimated a: %.5f\nEstimated b: %.5f\nDuration: %.5f\n\n', ...
        noiseStdDev, estimatedA, estimatedB, testDuration);

end

