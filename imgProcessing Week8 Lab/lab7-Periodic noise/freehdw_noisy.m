imNoisy = imread('freehdw_noisy.bmp');
fftR = fft2(imNoisy);
figure(1); imshow(log(abs(fftshift(fftR))),[]);

[M,N] = size(imNoisy);
u = 60;
v = 40;
A = 64;
for x=1:M
    for y=1:N
        fnoise(x,y) = 127 + (A*cos((2*pi*(u*x + v*y))/M)+ A*sin((2*pi*(u*x + v*y))/N));
    end
end
fft_noise = fft2(fnoise);
fft_noise_amplitude = log(abs(fft_noise));
figure(); imshow(fftshift(fft_noise_amplitude),[]);

% setup amplitudeThreshold
meanValue = mean(fft_noise_amplitude);
amplitudeThreshold = meanValue/2;
brightSpikes = fft_noise_amplitude > amplitudeThreshold;
figure(); imshow(fftshift(brightSpikes),[]);

% สร้าง ฺBandreject Filter 
% noiseFilter = 
fftR_filtered = fftR .* ~brightSpikes;
imFiltered = ifft2(fftR_filtered);
% แสดงภาพที่ได้
figure(); imshow(imFiltered, []); title('Filtered Image');

