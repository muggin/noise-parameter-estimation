clearvars; close all; clc;
%% Testing script

% input images
imageArray = {'lena.tiff', 'barbara.jpg', 'boat.png', 'peppers.bmp'};

% parameter a for poisson-gaussian noise generation
aParameterArray = [0.005, 0.01, 0.015];

% parameter b for poisson-gaussian noise generation
bParameterArray = [0.0016, 0.0036, 0.0064];

% threshold for sample set generation
thresholdArray = [0.25:0.05:0.5];

% local statistics window size
windowSizeArray = [3, 5, 7];

% number of repetitions of each test
nRepetitions = 1;

% create output directory
outputDir = ['testout_', datestr(now, 'HHMMSS')];
mkdir(outputDir);

% run test
for image = imageArray
    [imagePath, imageName, imageExtension] = fileparts(char(image));
    outputFile = [outputDir, '/', imageName,'.txt'];
    fileDescriptor = fopen(outputFile, 'w');
    for paramA = aParameterArray
        for paramB = bParameterArray
            for threshold = thresholdArray
                for windowSize = windowSizeArray
                    for iRepetition = 1:nRepetitions
                        WriteTestHeader(fileDescriptor, [imageName, imageExtension], paramA, paramB, threshold, windowSize);
                        testStart = cputime;
                        % RUN TEST
                        testDuration = cputime - testStart;
                        WriteTestResults(fileDescriptor, 1, 1, testDuration);
                    end 
                end
            end
        end
    end
    fclose(fileDescriptor);
end






