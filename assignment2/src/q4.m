close all;
clear;
bell = rgb2gray(imread("../input_data/bell.jpg"));
clearr = rgb2gray(imread("../input_data/Clear.jpg"));

boosted_bell = highboost(bell,5,75);
imshow(boosted_bell,[]);


function boosted = highboost(I,sz,w)
  kernel = ones(sz,sz)*-1;
  c = floor(sz/2)+1;
  kernel(c,c) = sz*sz-1+w;
  disp(kernel);
  boosted = convolve_with(I,kernel);
end  



