clearvars; close all; clc;

%% Skrypt testujacy

% testowane obrazy wejsciowe
testImages = {'lena.tiff', 'barbara.jpg', 'boat.png', 'peppers.bmp'};

% testowe wartosci parametru a
testParamsA = [0.005, 0.01, 0.015];

% testowe wartosci parametru b
testParamsB = [0.0016, 0.0036, 0.0064];

% testowe wartosci parametru threshold
testThresholds = [0.015, 0.025, 0.05, 0.075];

% testowe rozmiary okien
testWindowSizes = [3, 5, 7];

% ilosc powtorzen testu dla kazdego ustawienia
testRepetitions = 1:1;

% licznik wykonanych testow
testCounter = 1;

% petla testujaca
for curImage = testImages
    for curParamA = testParamsA
        for curParamB = testParamsB
            for curThreshold = testThresholds
                for curWindowSize = testWindowSizes
                    for testRepetition = testRepetitions
                        fprintf('==== TEST %i ====\n', testCounter);
                        PrintTestHeader(curImage, curParamA, curParamB, curThreshold, curWindowSize);
                        testStart = cputime;
                        % RUN TEST
                        testDuration = cputime - testStart;
                        PrintTestResults(1, 1, testDuration);
                        testCounter = testCounter + 1;
                        fprintf('\n\n');
                    end 
                end
            end
        end
    end
end








