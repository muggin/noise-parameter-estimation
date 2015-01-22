clearvars; close all; clc;
%% Testing script

% input images
imageArray = {'lena.tiff', 'barbara.jpg'};%, 'boat.png', 'peppers.bmp'};

% parameter a for poisson-gaussian noise generation
aParameterArray = [0.005, 0.01, 0.015];

% parameter b for poisson-gaussian noise generation
bParameterArray = [0.0016, 0.0036, 0.0064];

% threshold for sample set generation
thresholdArray = [0.35];

% local statistics window size
windowSizeArray = [3];

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
                        inputImage = im2double(rgb2gray(imread(['test_images/', char(image)])));
                        testStart = cputime;
                        [noiseStdDev, estimatedA, estimatedB] = runtest(inputImage, paramA, paramB, threshold, windowSize);
                        testDuration = cputime - testStart;
                        WriteTestResults(fileDescriptor, estimatedA, estimatedB, testDuration);
                    end 
                end
            end
        end
    end
    fclose(fileDescriptor);
end






