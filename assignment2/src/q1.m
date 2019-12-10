close all;
clear;
barbara = imread("../input_data/barbara.jpg");
bell = imread("../input_data/bell.jpg");
cubes = imread("../input_data/cubes.png");

% Canny edge detection
canny_bell = edge(rgb2gray(bell),'Canny',[0.1 0.2]);
imwrite(canny_bell,'../output_data/canny_bell.jpg');
canny_cubes = edge(rgb2gray(cubes),'Canny',[0.1 0.25]);
imwrite(canny_cubes,'../output_data/canny_cubes.jpg');
canny_barbara = edge(barbara,'Canny',[0.1 0.2]);
imwrite(canny_barbara,'../output_data/canny_barbara.jpg');

% Roberts Filter
Rx = [0 1;-1 0];
Ry = [1 0; 0 -1];

fil_robert_x = convolve_with(barbara,Rx);
fil_robert_y = convolve_with(barbara,Ry);
fil_robert = (fil_robert_x.^2+fil_robert_y.^2).^0.5;
imwrite(uint8(fil_robert),'../output_data/barbara_roberts.jpg');

%  Prewitt Filter
Px = [-1 0 1;-1 0 1;-1 0 1];
Py = [ 1 1 1; 0 0 0;-1 -1 -1];
fil_prewitt_x = convolve_with(barbara,Px);
fil_prewitt_y = convolve_with(barbara,Py);
fil_prewitt = (fil_prewitt_x.^2+fil_prewitt_y.^2).^0.5;
imwrite(uint8(fil_prewitt),'../output_data/barbara_prewitts.jpg');

%  Sobel Filter
Sx = [-1 0 1;-2 0 2;-1 0 1];
Sy = [ 1 2 1; 0 0 0;-1 -2 -1];
fil_sobels_x = convolve_with(barbara,Sx);
fil_sobels_y = convolve_with(barbara,Sy);
fil_sobels = (fil_sobels_x.^2+fil_sobels_y.^2).^0.5;
imwrite(uint8(fil_sobels),'../output_data/barbara_sobels.jpg');

% Laplacian filter
L1 = [0 1 0; 1 -4 1; 0 1 0];
L2 = [1 1 1; 1 -8 1; 1 1 1];
fil_laplacian_1 = convolve_with(barbara,L1);
fil_laplacian_2 = convolve_with(barbara,L2);
imwrite(uint8(fil_laplacian_1),'../output_data/barbara_laplacian_1.jpg');
imwrite(uint8(fil_laplacian_2),'../output_data/barbara_laplacian_2.jpg');



