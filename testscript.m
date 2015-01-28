clearvars; close all; clc;
%% Testing script

% input images
imageArray = {'lena.jpg', 'barbara.jpg', 'boat.png'};

% parameter a for poisson-gaussian noise generation
aParameterArray = [0.005, 0.01, 0.015];

% parameter b for poisson-gaussian noise generation
bParameterArray = [0.0016, 0.0036, 0.0064];

% threshold for sample set generation
thresholdArray = [0.4];

% local statistics window size
windowSizeArray = [3];

% number of repetitions of each test
nRepetitions = 10;

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
                    WriteTestHeader(fileDescriptor, [imageName, imageExtension], paramA, paramB, threshold, windowSize);
                    noiseStdDevAvg = 0;
                    estimatedAAvg = 0;
                    estimatedBAvg = 0;
                    testDurationAvg = 0;
                    for iRepetition = 1 : nRepetitions
                        if (strcmp(image, 'boat.png'))
                            inputImage = im2double(imread(['test_images/', char(image)]));
                        else
                            inputImage = im2double(rgb2gray(imread(['test_images/', char(image)])));
                        end
                        testStart = cputime;
                        [noiseStdDev, estimatedA, estimatedB] = runtest(inputImage, paramA, paramB, threshold, windowSize);
                        testDuration = cputime - testStart;
                        noiseStdDevAvg = ((iRepetition - 1) * noiseStdDevAvg + noiseStdDev) / iRepetition;
                        estimatedAAvg = ((iRepetition - 1) * estimatedAAvg + estimatedA) / iRepetition;
                        estimatedBAvg = ((iRepetition - 1) * estimatedBAvg + estimatedB) / iRepetition;
                        testDurationAvg = ((iRepetition - 1) * testDurationAvg + testDuration) / iRepetition;
                    end 
                    WriteTestResults(fileDescriptor, noiseStdDevAvg, estimatedAAvg, estimatedBAvg, testDurationAvg);
                end
            end
        end
    end
    fclose(fileDescriptor);
end