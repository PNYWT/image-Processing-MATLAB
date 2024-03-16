Original = imread("space2_wn.jpg");

enhaced_image = imadjust(Original,stretchlim(Original),[]);

%noise_reduce = adapthisteq(Original);
noise_reduce = fspecial('gaussian',[5 5],1.0);

image1 = imfilter(enhaced_image,noise_reduce);

image2 = adapthisteq(image1);


%subplot(3, 3, 1); 
%imshow(I)
%title('Input');

subplot(1, 3, 1); 
imshow(Original)
title('Original');

subplot(1, 3, 2); 
imshow(image1)
title('show1');

subplot(1, 3, 3); 
imshow(image2)
title('show2');