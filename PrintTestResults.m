function PrintTestResults( estA, estB, duration )
%PRINTTESTHEADER funkcja wypisuje informacje o wykonywanym tescie
%   @param  imageName - 
%   @param  a - 
%   @param  b - 
%   @param  threshold - 
%   @param  windowSize - 
    fprintf('* TEST RESULTS\n');
    fprintf('Estimated a: %.5f\nEstimated b: %.5f\nDuration: %.5f\n', estA, estB, duration);

end

