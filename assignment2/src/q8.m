close all;
clear;
deg = imread("../input_data/Degraded.jpg");

cleaned = median_img(deg,3);
imshow(uint8(cleaned),[]);
imwrite(uint8(cleaned),"../output_data/cleaned.jpg");

% function filtered_image = median_img(I,sz)
%   [r,c,d] = size(I);
%   filtered_image = I;
%   padded_image =  padarray(I,[floor(sz/2) floor(sz/2)],0,'both');
%   for i  = [1 2 3]
%     [rp,cp] = size(padded_image(:,:,i));
%     columnized_image = median(im2col(padded_image(:,:,i),[sz sz]));
%     filtered_image(:,:,i) = col2im(columnized_image,[sz sz],[rp cp],'sliding');
%   end  
% end

function result = median_img(im,n)
    [x,y,channel] = size(im);
    if (mod(n,2) == 1)
        k = (n-1)/2;
    else
        k = n/2;
    end
    res = zeros(x,y,channel);
    im2 = zeros(x+n-1,y+n-1,channel);
    im2(k+1:x+k,k+1:y+k,:) = im;
    for p  = [1 2 3]
        for i = 1:x
            for j = 1:y
                temp = im2(i:i+n-1,j:j+n-1,p);
                res(i,j,p) = median(temp(:));
            end
        end
    end    
    result = double(res);
end
