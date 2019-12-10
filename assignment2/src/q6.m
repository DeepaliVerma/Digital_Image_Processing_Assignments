close all;
clear;

sky = imread("../input_data/sky.png");
noir = rgb2gray(imread("../input_data/noir.png"));

sky_bilateral = bilateral_filter(sky,25,60);
noir_bilateral = bilateral_filter(noir,60,15);

imshow(uint8(sky_bilateral), []);
imwrite(uint8(sky_bilateral),'../output_data/sky_bilateral.png');
imshow(uint8(noir_bilateral), []);
imwrite(uint8(noir_bilateral),'../output_data/noir_bilateral.png');