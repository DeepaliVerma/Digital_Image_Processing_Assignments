function tim = PlotAverage(im)
    im = imread(im);
    if (size(im,3) == 3)
        im = rgb2gray(im);
    end
    maxsize = 30;
    tim = zeros(maxsize,2);
    j = 1:1:maxsize;
        for i = 1:maxsize
            h = fspecial ('average',i);
            f = @()(EfficientAverageFilter(im,h));
            tim(i,1) = timeit(f)*1000;
            f1 = @() (convolve_with(im,h));
            tim(i,2) = timeit(f1)*1000;
        end
    figure;
    plot(j,tim(:,1),'r');
    hold on;
    plot(j,tim(:,2),'b');
end
