clearvars; close all; clc;

global fileHandle
%% Skrypt testujacy

% testowane obrazy wejsciowe
testImages = {'lena.tiff', 'barbara.jpg', 'boat.png', 'peppers.bmp'};

% testowe wartosci parametru a
testParamsA = [0.005, 0.01, 0.015];

% testowe wartosci parametru b
testParamsB = [0.0016, 0.0036, 0.0064];

% testowe wartosci parametru threshold
testThresholds = 0.25:0.05:0.5;

% testowe rozmiary okien
testWindowSizes = [3, 5, 7];

% ilosc powtorzen testu dla kazdego ustawienia
testRepetitions = 1:1;

% licznik wykonanych testow
currentTest = 1;

% tworzy katalog na wyniki testu
outputDir = ['testout_', datestr(now, 'HHMMSS')];
mkdir(outputDir);

% petla testujaca
for curImage = testImages
    [path, imageName, imageExt] = fileparts(char(curImage));
    outputFile = [outputDir, '/', imageName,'.txt'];
    fileHandle = fopen(outputFile, 'w');
    for curParamA = testParamsA
        for curParamB = testParamsB
            for curThreshold = testThresholds
                for curWindowSize = testWindowSizes
                    for testRepetition = testRepetitions
                        WriteTestHeader([imageName, imageExt], curParamA, curParamB, curThreshold, curWindowSize);
                        testStart = cputime;
                        % RUN TEST
                        testDuration = cputime - testStart;
                        WriteTestResults(1, 1, testDuration);
                        currentTest = currentTest + 1;
                    end 
                end
            end
        end
    end
    fclose(fileHandle);
end






