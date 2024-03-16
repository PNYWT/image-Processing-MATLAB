Original = imread("girl_gray_sp.jpg");

% adjusts the intensity
enhanced_image = imadjust(Original,stretchlim(Original),[]);
% Gaussian filter for noise reduction
noise_reduce = fspecial('gaussian',[5 5],1.0);

% convolves 
imageFilter = imfilter(enhanced_image,noise_reduce);
adapImage = adapthisteq(imageFilter);

% reducing salt-and-pepper noise 3x3
reduceNoise = medfilt2(adapImage, [3 3]);
noise_reduce = fspecial('gaussian',[5 5],1.0);
imageFilter = imfilter(enhanced_image,noise_reduce);

figure, imshow(Original), title('Original Image');
figure, imshow(adapImage, []), title('enhanced_image, noise_reduce');
figure, imshow(reduceNoise, []), title('enhanced_image, noise_reduce');