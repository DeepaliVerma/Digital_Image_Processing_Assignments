clear;
close all;

% im1 = imread("../input_data/pots_flash.jpg");
% im2 = imread("../input_data/pots_no_flash.jpg");
% imshow(uint8(cross_bilateral_filter(im2,im1,50,50)));
% figure
cubes = imread("../input_data/cubes.png");
imshow(uint8(inverse_bilateral_filter(cubes,30,30)),[]);

function arr = cross_bilateral_filter(im1,im2,sigd,sigr)
    [s1,s2,s3] = size(im1);
    n = 5;                            
    k = (n-1)/2;
    sigd = 2*(sigd.^2);       
    sigr = 2*(sigr.^2);       
    
    I1 = zeros(s1+n-1,s2+n-1,s3);              
    I1(k+1:s1+k,k+1:s2+k,:) = im1(:,:,:);
    I1 = double(I1);
    
    I2 = zeros(s1+n-1,s2+n-1,s3);              
    I2(k+1:s1+k,k+1:s2+k,:) = im2(:,:,:);
    I2 = double(I2);
    
    arr = zeros(s1,s2);
    for d  = 1:s3
        for r = 1:s1
            for c = 1:s2
                for i = r:r+2*k
                    for j = c:c+2*k
                        dat = -1*((((r+k-i).^2)+((c+k-j).^2))/sigd);
                        rang = -1*(abs((I2(i,j)-I2(r+k,c+k)))^2/sigr);
                        fil(i+1-r,j+1-c) = exp(dat+rang);
                    end
                end
                nor = sum(sum(fil));
                arr(r,c,d) = (sum(dot(I1(r:r+n-1,c:c+n-1,d),fil(:,:))))/nor;
            end
        end
    end        
    arr = uint8(arr);
end

function arr = inverse_bilateral_filter(im,sigd,sigr)
    [s1,s2,s3] = size(im);
    n = 3;                            
    k = (n-1)/2;
    sigd = 2*(sigd.^2);       
    sigr = 2*(sigr.^2);       
    I1 = zeros(s1+n-1,s2+n-1,s3);              
    I1(k+1:s1+k,k+1:s2+k,:) = im(:,:,:);
    I1 = double(I1);
    arr = zeros(s1,s2);
    for d  = 1:s3
        for r = 1:s1
            for c = 1:s2
                for i = r:r+2*k
                    for j = c:c+2*k
                        dat = -1*((((r+k-i).^2)+((c+k-j).^2))/sigd);
                        rang = -1*(abs(1-(I1(i,j)-I1(r+k,c+k)))^2/sigr);
                        fil(i+1-r,j+1-c) = exp(dat+rang);
                    end
                end
                nor = sum(sum(fil));
                arr(r,c,d) = (sum(dot(I1(r:r+n-1,c:c+n-1,d),fil(:,:))))/nor;
            end
        end
    end        
    arr = uint8(arr);
end