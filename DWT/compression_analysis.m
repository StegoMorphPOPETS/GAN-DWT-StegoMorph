clear all
close all
clc

stegoimage = imread('.\cycleGAN\stego_images\secret_o1.jpg');
% figure
% imshow(stegoimage);
imwrite(stegoimage, '.\cycleGAN\models\compressed\compressed_stegoimage.jpg', 'jpg', 'Quality', 90);
compressed_stegoimage = imread('.\cycleGAN\models\compressed\compressed_stegoimage.jpg');
psnr_value = psnr(stegoimage, compressed_stegoimage);
fprintf('PSNR value: %.2f dB\n', psnr_value);
