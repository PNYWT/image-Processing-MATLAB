Original = imread("girl_gray_sp.jpg");

enhanced_image = imadjust(Original,stretchlim(Original),[]);
enhanced_image2 = adapthisteq(Original);
%imageAdjust = adapthisteq(Original);
noise_reduce = fspecial('gaussian',[5 5],1.0);
%B = fspecial('average',[5 5]);

image1 = medfilt2(enhanced_image, [3 3]);

%image3 = imfilter(J,A) 
image2 = imfilter(enhanced_image,noise_reduce);

%subplot(3, 3, 1); 
%imshow(I)
%title('Input');

subplot(1, 4, 1); 
imshow(Original)
title('Original');

subplot(1, 4, 2); 
imshow(enhanced_image)
title('show1');

subplot(1, 4, 3);
imshow(image1)
title('show2');

subplot(1, 4, 4);
imshow(image2)
title('show3');
