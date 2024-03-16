image = imread("girl_gray_sp.jpg");

% adjusts the intensity
enhanced_image = imadjust(image,stretchlim(image),[]);
% Gaussian filter for noise reduction
noise_reduce = fspecial('gaussian',[5 5]);

% convolves 
imageFilter = imfilter(enhanced_image,noise_reduce);
adapImage = adapthisteq(imageFilter);

% reducing salt-and-pepper noise 3x3
reduceNoise = medfilt2(adapImage, [3 3]);

noise_reduce2 = fspecial('gaussian',[5 5]);
imageFilter2 = imfilter(enhanced_image,noise_reduce2);
adapImage = adapthisteq(imageFilter2);

figure, imshow(image), title('Original Image');
% figure, imshow(adapImage, []), title('enhanced_image, noise_reduce');
figure, imshow(reduceNoise, []), title('enhanced_image, noise_reduce');
figure, imshow(imageFilter2, []), title('noise_reduce2');