image = imread('mri_txt.tif'); 
imageAdjust = imadjust(image, stretchlim(image), []);

image2 = imread('monet_gray_xlc.jpg'); 
imageAdjust2 = histeq(image2);

% แสดงภาพที่ 1 และภาพที่ปรับแล้วของ image
subplot(2, 2, 1); % ตำแหน่งที่ 1 (บนซ้าย)
imshow(image);
title('mri_txt mri_txt.tif');

subplot(2, 2, 2); % ตำแหน่งที่ 2 (บนขวา)
imshow(imageAdjust);
title('Adjusted mri_txt.tif');

% แสดงภาพที่ 2 และภาพที่ปรับแล้วของ image2
subplot(2, 2, 3); % ตำแหน่งที่ 3 (ล่างซ้าย)
imshow(image2);
title('Original monet_gray_xlc.jpg');

subplot(2, 2, 4); % ตำแหน่งที่ 4 (ล่างขวา)
imshow(imageAdjust2);
title('Adjusted monet_gray_xlc.jpg');
