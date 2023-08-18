clear all
close all
clc

stegoimage = imread('.\cycleGAN\stego_images\secret_o1.jpg');
grayImageS = rgb2gray(stegoimage);
[countS, binLocationS] = imhist(grayImageS);
figure;
bar(binLocationS, countS);
title('Histogram of StegoImage');
xlabel('Pixel Intensity');
ylabel('Frequency');
imageMean = mean(grayImageS(:));
imageMedian = median(grayImageS(:));
imageVariance = var(double(grayImageS(:)));
imageSkewness = skewness(double(grayImageS(:)));
fprintf('STEGO: \n Mean: %.4f \n Median: %.4f \n Variance: %.4f \n Skewness: %.4f \n', imageMean, imageMedian, imageVariance, imageSkewness);

fprintf('\n')

coverImage = imread('.\cycleGAN\samples\originals\o1.jpg');
grayImageC = rgb2gray(coverImage);
[countC, binLocationC] = imhist(grayImageC);
figure;
bar(binLocationC, countC);
title('Histogram of CoverImage');
xlabel('Pixel Intensity');
ylabel('Frequency');
imageMean1 = mean(grayImageC(:));
imageMedian1 = median(grayImageC(:));
imageVariance1 = var(double(grayImageC(:)));
imageSkewness1 = skewness(double(grayImageC(:)));
fprintf('COVER: \n Mean: %.4f \n Median: %.4f \n Variance: %.4f \n Skewness: %.4f \n', imageMean1, imageMedian1, imageVariance1, imageSkewness1);