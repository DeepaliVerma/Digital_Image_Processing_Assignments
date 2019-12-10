close all;
clear;


img = rgb2gray(imread('../input_data/lena.jpg'));
figure
imshow(img,[])

[M,N] = size(img)
fil = [0 1 0; 1 2 1; 0 1 0];
[m,n] = size(fil)

pad_fil = padarray(fil, [M-1 N-1],'post');
pad_img = padarray(img, [m-1 n-1],'post');

fft_pad_fil = fft2(pad_fil);
fft_pad_img = fft2(pad_img);

figure
imshow(log(1+abs(fftshift(fft_pad_fil))), []);

fft_mult = fft_pad_fil.*fft_pad_img;
filtered_img = ifft2(fft_mult);

figure
imshow(filtered_img,[])

figure
imshow(filter2(fil,img,'full'),[])