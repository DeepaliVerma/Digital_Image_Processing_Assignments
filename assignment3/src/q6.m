close all;
clear;

img1 = rgb2gray(imread('../input_data/lena.jpg'));
% img1 = [1 2 3;4 5 6; 7 8 9; 10 11 12];
[M,N] = size(img1);
img2 = rgb2gray(imread('../input_data/cty.jpg'));
% img2 = [1 2 3 4 5 6 7 8; 9 10 11 12 13 14 15 16; 17 18 19 20 21 22 23 24];
[m,n] = size(img2);

tic
pad_img1 = padarray(img1, [m-1 n-1],'post');
pad_img2 = padarray(img2, [M-1 N-1],'post');
fft_pad_img2 = fft2(pad_img2);
fft_pad_img1 = fft2(pad_img1);
fft_mult = fft_pad_img2.*fft_pad_img1;
filtered_img = ifft2(fft_mult);
fourier_time = toc

tic
filtered_conv_img = conv2(img1,img2);
conv_time = toc

figure
imshow(filtered_img,[]);

figure
imshow(filtered_conv_img,[]);

% conv_fft = fft2(conv2(img1,img2));

% figure
% imshow( log(1+abs(fftshift(conv_fft))), []);
% figure
% imshow( log(1+abs(fftshift(fft_mult))), []);

