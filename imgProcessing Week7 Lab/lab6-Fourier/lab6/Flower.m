image = imread('images.jpg'); 
fftA = fft2(image);

image2 = imread('wood-room.jpg'); 
fftB = fft2(image2);

fftC =(abs(fftB)).* exp(1i*angle(fftA));

image3 = imread('trees.jpg'); 
fftD = fft2(image3);

fftE =(abs(fftD)).* exp(1i*angle(fftC));
X = ifft2(fftE);
img8 = uint8(X);

subplot(1, 1, 1); 
imshow(img8);