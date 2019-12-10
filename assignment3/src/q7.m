close all; 
clear;

im = rgb2gray(imread('../input_data/bricks.jpg'));
imb = imgaussfilt(im, 2);

imshow(sample_at(imb,2,2),[]);
figure
imshow(sample_at(imb,3,3),[]);
figure
imshow(sample_at(imb,4,4),[]);
figure
imshow(sample_at(imb,5,5),[]);
figure
imshow(sample_at(imb,6,6),[]);
figure
imshow(sample_at(imb,7,7),[]);

function result = sample_at(im,nx,ny)
    [x,y]=size(im);

    res=zeros(uint8(x/nx),uint8(y/ny));

    for i=nx:nx:x
        for j=nx:ny:y
            res(uint8(i/nx),uint8(j/ny)) = im(i,j);
        end
    end

    imshow(res,[]);
    result = res;
end