% STEP 1: Posterization
image = imread('honeypot.jpg');

% ทำการ posterize รูปภาพ
threshRGB = multithresh(image, 9);
value = [0 threshRGB(2:end) 255];
quantRGB = imquantize(image, threshRGB, value);

% แปลง quantRGB กลับไปเป็น uint8 ก่อนทำการ filter
quantRGB_uint8 = uint8(quantRGB);

% STEP 2: Image Smoothing with Gaussian
gaussianKernel = fspecial('gaussian', [3 3]);
smoothedImage = imfilter(quantRGB_uint8, gaussianKernel, 'replicate');

% STEP 3: Edge Emphasizing with Sobel
% หาขอบด้วย Sobel filter
edgeHorizontal = imfilter(smoothedImage, fspecial('sobel'));
edgeVertical = imfilter(smoothedImage, fspecial('sobel')');
edgeMagnitude = 3 * (edgeVertical + edgeHorizontal);

% จำกัดช่วงของ edgeMagnitude ให้อยู่ระหว่าง 0 ถึง 255
edgeMagnitude = uint8(min(edgeMagnitude, 255));

% สร้างเอฟเฟ็กต์การ์ตูน
cartoon = smoothedImage - edgeMagnitude;

% แสดงภาพ
figure, imshow(image), title('Original Image');
figure, imshow(smoothedImage), title('Smoothed Image after Quantization with Gaussian Filter');
figure, imshow(edgeMagnitude), title('Edge Detection with Sobel Filter');
figure, imshow(cartoon), title('Cartoon Effect');
