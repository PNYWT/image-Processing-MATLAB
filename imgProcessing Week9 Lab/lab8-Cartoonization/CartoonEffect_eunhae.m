image = imread('eun_hae.png');

threshRGB = multithresh(image, 9);
value = [0 threshRGB(2:end) 255];
quantRGB = imquantize(image, threshRGB, value);

gaussianKernel = fspecial('gaussian', [3 3]);
smoothedImage = imfilter(quantRGB, gaussianKernel);

edgeHorizontal = imfilter(smoothedImage, fspecial('sobel'));
edgeVertical = imfilter(smoothedImage, fspecial('sobel')');
edgeMagnitude = 5 * (edgeVertical + edgeHorizontal);
cartoon = smoothedImage - edgeMagnitude;

figure, imshow(image), title('Original Image');
figure, imshow(smoothedImage, []), title('Smoothed Image after Quantization with Gaussian Filter');
figure, imshow(edgeMagnitude, []), title('Edge Detection with Sobel Filter');
figure, imshow(cartoon, []), title('cartoon');