im  = imread('../input_data/bell.jpg');
im = rgb2gray(im);
maxsize = 10;
tim = zeros(maxsize,2);
j = 1:1:maxsize;
    for i = 3:maxsize+2
        f = @()(efficient_median(im,i));
        tim(i-2,1) = timeit(f)*1000;
        f1 = @() (median_img(im,i));
        tim(i-2,2) = timeit(f1)*1000;
    end
figure;
plot(j,tim(:,1),'r');
hold on;
plot(j,tim(:,2),'b');

function result = median_img(im,n)
    [x,y,channel] = size(im);
    if (mod(n,2) == 1)
        k = (n-1)/2;
    else
        k = n/2;
    end
    res = zeros(x,y);
    im2 = zeros(x+n-1,y+n-1);
    im2(k+1:x+k,k+1:y+k) = im;
        for i = 1:x
            for j = 1:y
                temp = im2(i:i+n-1,j:j+n-1);
                res(i,j) = median(temp(:));
            end
        end
    result = double(res);
end

function output = efficient_median(img,fs)
    bins = zeros(1,256);
    [x,y] = size(img);
    % fs = 5;
    output = zeros(x-fs+1,y-fs+1);
    sum = 0;

    for i = 1:x-fs+1
        bins = zeros(1,256);
        for l = i:i+fs-1
            for m = 1:fs
                bins(1,img(l,m)+1) = bins(1,img(l,m)+1)+1;
                % add 1 to the corresponding pixel value 
            end
        end
        for j = 1:y-fs+1
            if(j>1)
                for k = 1:fs
                    bins(1,img(i+k-1,j-1)+1) = bins(1,img(i+k-1,j-1)+1) - 1;
                    bins(1,img(i+k-1,j+fs-1)+1) =  bins(1,img(i+k-1,j+fs-1)+1) + 1;   
                end
            end
            sum = 0;
            for t = 1:256
                if(sum<floor(fs/2))
                    sum = sum+bins(1,t);
                end
                if(sum>=floor(fs/2))
                    output(i,j) = t-1;
                    break;
                end        
            end
        end
    end
end    
