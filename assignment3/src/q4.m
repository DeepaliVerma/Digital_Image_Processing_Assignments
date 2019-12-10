clc;
close all;
clear all;

% Read the image
I1 = imread('../input_data/land.png');

% Convert to black and whites
I2 = rgb2gray(I1);
I2=double(I2);
figure, imshow(uint8(I2));

% Take fft
I3=fft2(I2);
I3=fftshift(I3);
figure
I4=log(1+abs(I3));
imshow(mat2gray(I4));

[r,c]=size(I2);
orgr=r/2;
orgc=c/2;
mf= zeros(r,c)+1;
D0= 50;

t = 1
w = 3

for i = floor(r/2)-t:floor(r/2)+t
    for j = 1:floor(c/2)-w
        mf(i,j) = 0;
    end
    for j = floor(c/2)+w:c
        mf(i,j) = 0;
    end
end

for j = floor(c/2)-t:floor(c/2)+t
    for i = 1:floor(r/2)-w
        mf(i,j) = 0;
    end
    for i = floor(r/2)+w:r
        mf(i,j) = 0;
    end
end

figure
imshow(uint8(255*mf));
title('frequency domain filter used');
I5=I3.*mf;
figure,
I4=log(1+abs(I5));
imshow(mat2gray(I4));
title('filtered image in frequency domain');
I6=ifft2(ifftshift(I5));
figure,
imshow(uint8(abs(I6)));
title('filtered gray scale image');