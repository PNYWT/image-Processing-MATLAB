image = imread("space2_wn.jpg");

% adjusts the intensity
enhaced_image = imadjust(image,stretchlim(image),[]);

% Gaussian filter for noise reduction
noise_reduce = fspecial('gaussian',[5 5],1.0);

% convolves 
convolves = imfilter(enhaced_image,noise_reduce);

% contrast of the original imag
adapImage = adapthisteq(convolves);

figure, imshow(image), title('Original Image');
figure, imshow(convolves, []), title('convolves');
figure, imshow(adapImage, []), title('enhanced_image, noise_reduce');