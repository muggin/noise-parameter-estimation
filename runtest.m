function [ noiseStdDev, a, b] = runtest(image, paramA, paramB, threshold, windowSize)
    %RUNTEST runs single teset
    %   @param
      
    noisyImage = generatenoise(image, paramA, paramB);
    noiseStdDev = computenoisestddev(noisyImage);
    samples = generatesamples(noisyImage,  threshold, noiseStdDev, windowSize);
    %scatter(samples(:,1), samples(:,2));
    [ k0 k1 ] = leastsquaremethod( noisyImage, samples, noiseStdDev );
    [a, b] = estimatenoiseparameters(k0, k1);
    
end

