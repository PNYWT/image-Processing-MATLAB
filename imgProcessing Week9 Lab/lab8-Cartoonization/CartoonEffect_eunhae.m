img = imread("eun_hae.png");

threshRGB = multithresh(img, 20);
value = [0 threshRGB(2:end) 255];
quantRGB = imquantize(img, threshRGB, value);

h = fspecial('gaussian', [10 10]);
img_original = imfilter(quantRGB, h);

t = transpose(fspecial('sobel'));
img_edge = imfilter(img, t);
img_original = img_original - img_edge*2;

t_non = fspecial('sobel');
img_edge = imfilter(img,t_non);
img_original = img_original - img_edge*2;
imshow(img_original);