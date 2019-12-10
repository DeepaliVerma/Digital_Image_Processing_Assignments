clear;
close all;

x = [1 ;2 ;3 ;4 ;5 ;6 ;7 ;8];
fftx = fft(x)
fft_x = rec_fft(x)

im = rgb2gray(imread('../input_data/lena.jpg'));
% im = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16]; 
% fft_im = matrix_fft(im);
fft_in = fft2(im);
imshow( log(1+abs(fftshift(fft_in))), []);

function matrix = matrix_fft(mat)
  for i = 1:size(mat,1)
     p =  rec_fft(mat(i,:).');
     mat(i,:) = p.';
  end
  for i = 1:size(mat,2)
    mat(:,i) = rec_fft(mat(:,i));
  end
   matrix = mat;
end

function y = rec_fft(x)
  n = size(x,1);
  if n<=1
    y=x;return;
  end
  y = zeros(n,1);
  even = x(1:2:end);
  odd = x(2:2:end);
  yeven = rec_fft(even);
  yodd = rec_fft(odd); 
  for k=0:floor(n/2)-1
    wk = exp((-2*pi*i*k)/n);
    y(k+1) = double(yeven(k+1)) + double(wk*yodd(k+1));
    y(k+floor(n/2)+1) = double(yeven(k+1)) - double(wk*yodd(k+1));     
  end
end