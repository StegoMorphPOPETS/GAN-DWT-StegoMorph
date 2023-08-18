clear all
close all
clc
disp("Beginning encoding...")

coverImage = imread('.\cycleGAN\samples\originals\o1.jpg');
message ='Hello World. This is a very secret message that should be kept hidden.';
stegoImage = embedMessageInImage(coverImage, message);

% Calculating & displaying the MSE, PSNR and SSIM
mse = immse(coverImage, stegoImage)
peaksnr = psnr(coverImage, stegoImage)
ssimval = ssim(coverImage, stegoImage)

function stegoImage = embedMessageInImage(coverImage, message)
    % Convert the message into a binary array
    binaryMessage = dec2bin(message, 8);
    binaryMessage = binaryMessage(:)';

    % Normalize the cover image to [0, 1]
    coverImage = im2double(coverImage);

    % Perform Haar DWT on the cover image
    [LL, LH, HL, HH] = dwt2(coverImage, 'haar');

    % Number of available pixels in the cover image & displaying the
    % maximum embedding capacity in bytes
    numPixels = numel(LH);
    maxBytes = floor(numPixels / 8)

    % Check if the message can be embedded in the cover image
    if length(binaryMessage) > numPixels
        error('Message too long to be embedded in the cover image.');
    end

    % Embed the message in the LH sub-band
    LH(:) = embedMessage(binaryMessage, LH(:));

    % Reconstruct the stego image
    stegoImage = idwt2(LL, LH, HL, HH, 'haar');

    % Clip the values to [0, 1] range
    stegoImage(stegoImage > 1) = 1;
    stegoImage(stegoImage < 0) = 0;

    % Convert the stego image back to uint8
    stegoImage = im2uint8(stegoImage);
    imwrite(uint8(stegoImage),'.\cycleGAN\stego_images\secret_o1.jpg','jpg');
end

function stegoSubband = embedMessage(message, subband)
    % Get the number of message bits
    numBits = length(message);

    % Embed the message bits in the subband
    for i = 1:numBits
        bit = str2double(message(i));
        if bit == 0
            subband(i) = floor(subband(i)/2)*2;
        else
            subband(i) = ceil(subband(i)/2)*2 + 1;
        end
    end

    % Return the stego subband
    stegoSubband = subband;
end


