function writetestheader(fileDescriptor, imageName, aParameter, bParameter, threshold, windowSize)
%PRINTTESTHEADER writes test parameters to file
%   @param  fileDescriptor - output file descriptor
%   @param  imageName - input image name
%   @param  aParameter - parameter a used for noise generation
%   @param  bParameter - parameter b used for noise generation
%   @param  threshold - sample acceptance threshold
%   @param  windowSize - local statistic window size
%
% Copyright 2015 Wojciech Kryscinski, Krzysztof Spytkowski

    fprintf(fileDescriptor, '* TEST PARAMETERS\n');
    fprintf(fileDescriptor, 'Image: %s\na: %.5f\nb: %.5f\nThreshold: %.3f\nWindow Size: %i\n', ...
            imageName, aParameter, bParameter, threshold, windowSize);

end

