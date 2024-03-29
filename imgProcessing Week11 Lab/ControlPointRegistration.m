% Step 1 Load image and Grayscale.
image_moving = imread("image_054_year_1.png");
image_reference = imread('image_054_year_2.png');
moving_image_gray = rgb2gray(image_moving);
reference_gray = rgb2gray(image_reference);

% Step 2 Control Point Selection tool using function.
[movingPoints, fixedPoints] = cpselect(moving_image_gray, reference_gray, 'wait', true);

% Step 3 Estimate transformation using function
transformationType = 'affine'; 
tform = fitgeotform2d(movingPoints, fixedPoints, transformationType);

% Recover the original imageStep 4 Create three different output views for the image and transformation.
sameAsInput = affineOutputView(size(moving_image_gray), tform, 'BoundsStyle', 'SameAsInput');

% Step 5
B = imwarp(moving_image_gray, tform, 'OutputView', sameAsInput);
imshowpair(reference_gray, B, 'montage'); 
imshowpair(reference_gray, B, 'diff');
