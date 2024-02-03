image = imread('chest_gray.jpg'); 
imageAdjust = imadjust(image,stretchlim(image),[]);
imageAdjust2 = adapthisteq(image);

subplot(3, 3, 1); 
imshow(image);
title('Original chest_gray.jpg');

subplot(3, 3, 2); 
imshow(imageAdjust);
title('Colormap chest_gray.jpg');

subplot(3, 3, 3); 
imshow(imageAdjust2);
title('CLAHE-ClipLimit chest_gray.jpg');

image_double = im2double(image); % แปลงภาพเป็นประเภท double
low_in = 20 / 255;  % แปลงจาก gray level 20 เป็นช่วง [0, 1]
high_in = 130 / 255; % แปลงจาก gray level 130 เป็นช่วง [0, 1]
low_out = 0;        % ต้องการช่วงเอาต์พุตที่เริ่มต้นที่ 0
high_out = 1;       % ต้องการช่วงเอาต์พุตสิ้นสุดที่ 1
imageAdjust_Inten = imadjust(image_double, [low_in high_in], [low_out high_out]);
imageAdjust_adapt = adapthisteq(imageAdjust_Inten);

subplot(2, 3, 4); 
imshow(image);
title('Original chest_gray.jpg');
subplot(2, 3, 5); 
imshow(imageAdjust_Inten);
title('intensity values chest_gray.jpg');
subplot(2, 3, 6); 
imshow(imageAdjust_adapt);
title('CLAHE chest_gray.jpg');