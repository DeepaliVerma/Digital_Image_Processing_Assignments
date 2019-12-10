function arr = bilateral_filter(im,sigd,sigr)
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
                        rang = -1*(abs((I1(i,j)-I1(r+k,c+k)))^2/sigr);
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