clearvars; close all; clc;

%% Skrypt testujacy

a = [0.005, 0.01, 0.015];
b = [0.0016, 0.0036, 0.0064];


for currentGeneratingA = a
    for currentGeneratingB = b
        fprintf('=== TEST ===\n');
        fprintf('genParamA: %.3f\ngenParamB: %.3f\n', currentGeneratingA, currentGeneratingB);
    end
end