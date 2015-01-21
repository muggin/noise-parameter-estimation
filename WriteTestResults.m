function WriteTestResults( estA, estB, duration )
%PRINTTESTHEADER funkcja wypisuje informacje o wynikach tescie
%   @param  estA - wyestymowana wartosc a
%   @param  estB - wyestymowana wartosc b
%   @param  duration - czas trwania testu
    global fileHandle
    fprintf(fileHandle, '* TEST RESULTS\n');
    fprintf(fileHandle, 'Estimated a: %.5f\nEstimated b: %.5f\nDuration: %.5f\n\n', estA, estB, duration);

end

