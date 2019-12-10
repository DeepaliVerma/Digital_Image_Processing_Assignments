close all;
clear;

rect = imread('../input_data/rectangle.jpg');
rotated_rect = rect'

fft_rect = fft2(rect);
fft_rect_rot = fft2(rotated_rect);

imshow( log(1+abs(fftshift(fft_rect))), []);
figure
imshow( log(1+abs(fftshift(fft_rect_rot))), []);

trans_rect = padarray(rect,[0 100],0,'pre');
fft_trans_rect = fft2(trans_rect);
figure
imshow( log(1+abs(fftshift(fft_trans_rect))), []);  