close all;
clear;

boxx = rgb2gray(imread("../input_data/box.png"));
blur = rgb2gray(imread("../input_data/blur.jpg"));

%  Prewitt Filter
Px = [-1 0 1;-1 0 1;-1 0 1];
Py = [ 1 1 1; 0 0 0;-1 -1 -1];
fil_prewitt_y = convolve_with(boxx,Py);
imshow(uint8(fil_prewitt_y), []);
imwrite(uint8(fil_prewitt_y),'../output_data/box_prewitts.png');

prewitt_blur_x = convolve_with(blur,Px);
prewitt_blur_y = convolve_with(blur,Py);

imshow(uint8(prewitt_blur_x), []);
imwrite(uint8(prewitt_blur_x),'../output_data/blurx_prewitts.png');
imshow(uint8(prewitt_blur_y), []);
imwrite(uint8(prewitt_blur_y),'../output_data/blury_prewitts.png');