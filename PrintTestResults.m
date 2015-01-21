function PrintTestResults( estA, estB, duration )
%PRINTTESTHEADER funkcja wypisuje informacje o wynikach tescie
%   @param  estA - wyestymowana wartosc a
%   @param  estB - wyestymowana wartosc b
%   @param  duration - czas trwania testu
    fprintf('* TEST RESULTS\n');
    fprintf('Estimated a: %.5f\nEstimated b: %.5f\nDuration: %.5f\n', estA, estB, duration);

end

