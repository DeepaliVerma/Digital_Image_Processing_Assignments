function output  = EfficientAverageFilter(im ,h)
n = size(h,1);    
if (mod(n,2) == 1)    
    k = (n-1)/2;
    
else
    k = n/2;    
end

[x,y] = size(im);
im2 = zeros(x+n-1,y+n-1);
im2(k+1:x+k,k+1:y+k) = im(:,:);    
res = zeros(x,y);     
for i = 1:x    
    for j = 1:y    
        if (i == 1 && j == 1)    
            res(i,j) = sum(dot(im2(i:i+n-1,j:j+n-1),h(:,:)));    
        elseif (j == 1)    
            res(i,j) = res(i-1,j) + dot(im2(i+n-1,j:j+n-1),h(n,:)) - dot(im2(i-1,j:j+n-1),h(1,:));     
        elseif (j~=1)    
            res(i,j) = res(i,j-1) + dot(im2(i:i+n-1,j+n-1),h(:,n)) - dot(im2(i:i+n-1,j-1),h(:,1));    
        end    
    end    
end
output  = res;
end