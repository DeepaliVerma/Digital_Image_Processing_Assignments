close all;
clear;

lena  = rgb2gray(imread('../input_data/lena.jpg'));
[M,N] = size(lena);
fft_lena = fftshift(fft2(lena));

but_fil = zeros(M,N);
d = 50;
n = 2 ;
for i=1:M
    for j=1:N
        duv= ((i-(M/2))^2+(j-(N/2))^2)^0.5;
        but_fil(i,j) = 1/(1+(duv/d)^(2*n));
    end
end        
imshow(but_fil,[]);
but_filt_fft = fft_lena.*but_fil;
but_filtered_img = abs(ifft2(ifftshift(but_filt_fft)));
figure
imshow(but_filtered_img,[])

gauss_fil = zeros(M,N);
d = 10;
for i=1:M
    for j=1:N
        duv= (i-(M/2))^2+(j-(N/2))^2;
        gauss_fil(i,j) = exp(-1*duv/(2*d^2));
    end
end

figure
imshow(gauss_fil,[]);
gauss_filt_fft = fft_lena.*gauss_fil;
gauss_filtered_img = abs(ifft2(ifftshift(gauss_filt_fft)));
figure
imshow(gauss_filtered_img,[])

gauss_filx = zeros(M,N);
d = 100;
for i=1:M
    for j=1:N
        duv= (i-(M/2))^2+(j-(N/2))^2;
        gauss_fil(i,j) = exp(-1*duv/(2*d^2));
    end
end
     
gauss_filx_fft = fft_lena.*gauss_filx;
gauss_filtered_imgx = abs(ifft2(ifftshift(gauss_filx_fft)));

diff_gauss = gauss_filtered_img - gauss_filtered_imgx;
figure
imshow(diff_gauss,[]);