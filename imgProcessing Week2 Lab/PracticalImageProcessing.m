img = imread("coded_image.tif");
img1 = bitshift(img,3); 
img2 = bitshift(img1,4);
figure(1);
imshow(img);
figure(2);
imshow(img1);
figure(3);
imshow(img2);