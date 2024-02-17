image = imread('lion-cub.jpg'); 
fftA = fft2(image);

image2 = imread('curve_brighter.jpg'); 
fftB = fft2(image2);

fftC =(abs(fftB)).* exp(1i*angle(fftA));
X = ifft2(fftC);
img8 = uint8(X);

subplot(1, 1, 1); 
imshow(img8);