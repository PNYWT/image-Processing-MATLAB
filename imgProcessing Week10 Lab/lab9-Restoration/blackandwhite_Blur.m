image = imread("black_and_white.tif");
len = 180;
theta = 180;

% Step 1 Estimat Noise Parameter by Image Observation
% Select a part of image with reasonably constant background intensity
patch = roipoly(image);

% Compute histogram of the image patch.
noise_hist = imhist(image(patch));
imhist(image(patch));

% Compute mean and variance of noise.
noise_stat = statmoments(noise_hist,2);

% Step 2 Compute the power spectrum pf the noise
% Create a Gaussian noisy image with noise_stat
approx_noise = imnoise(zeros(size(image)), "gaussian", 0, noise_stat(2));
% calculate Svv
Svv = abs(fft2(approx_noise)) .^ 2;

% Step 3 Compute f_hat which is thee estimation of ideal image
filterGaussian = fspecial('gaussian', [3 3]);
f_hat = imfilter(image, filterGaussian);
% calculate Sff
Sff = abs(fft2(double(f_hat)) .^ 2);

% Step 4 Compute the noise-to-signal power ratio
NSR = Svv ./ Sff;

% Step 5 Wiener filtering
PSF = fspecial("motion", len, theta);
image_output = deconvwnr(image, PSF, NSR);
figure, imshow(image), title('Original Image');
figure, imshow(image_output), title('Output Image');

