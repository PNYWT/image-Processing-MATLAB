imNoisy = imread('jupitergray_noisy.bmp');
fftR = fft2(imNoisy);
figure(1); imshow(log(abs(fftshift(fftR))),[]);

[M,N] = size(imNoisy);

% Noise pattern แรก
u = 40;
v = 0;
A = 64;
fnoise = zeros(M, N); % เริ่มต้นด้วยการสร้าง array ของ zeros
for x=1:M
    for y=1:N
        fnoise(x,y) = 127 + (A*cos((2*pi*(u*x + v*y))/M) + A*sin((2*pi*(u*x + v*y))/N));
    end
end

% Noise pattern ที่สอง
u = 0;
v = 40;
fnoise_v = zeros(M, N); % สร้าง pattern noise ใหม่
for x=1:M
    for y=1:N
        fnoise_v(x,y) = 127 + (A*cos((2*pi*(u*x + v*y))/M) + A*sin((2*pi*(u*x + v*y))/N));
    end
end

% รวม noise patterns และคำนวณ FFT
fft_noise_combined = fft2(fnoise + fnoise_v);
fft_noise_amplitude = log(abs(fft_noise_combined));
figure(); imshow(fftshift(fft_noise_amplitude),[]);

% Setup amplitudeThreshold
meanValue = mean(fft_noise_amplitude()); % คำนวณ mean จากทั้ง matrix
amplitudeThreshold = meanValue/2;
brightSpikes_combined = fft_noise_amplitude > amplitudeThreshold;

% สร้าง Bandreject Filter โดยใช้การผสมของ bright spikes
fftR_filtered = fftR .* ~brightSpikes_combined;
imFiltered = ifft2(fftR_filtered);

% แสดงภาพที่ได้
figure(); imshow(imFiltered, []); title('Filtered Image');
