function result = convolve_with(im,h)
    n = size(h,1);
    [x,y,channel] = size(im);
    if (mod(n,2) == 1)
        k = (n-1)/2;
    else
        k = n/2;
    end
    res = zeros(x,y);
    im2 = zeros(x+n-1,y+n-1);
    im2(k+1:x+k,k+1:y+k) = im;
    im2 = double(im2);h= double(h);
    h = fliplr(flipud(h));
    for i = 1:x
        for j = 1:y
            res(i,j) = sum(sum(dot(im2(i:i+n-1,j:j+n-1),h)));
        end
    end
    result = double(res);
end