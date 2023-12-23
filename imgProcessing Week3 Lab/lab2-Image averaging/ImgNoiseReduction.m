numImg = 300;
folderPath = '/Users/CallmeOni/Documents/MATLAB/imgProcessing Week3 Lab/lab2-Image averaging/lab2-noise averaging';
sum_image = 0.00;

for i = 1:numImg
    filename = fullfile(folderPath, sprintf('puppy_%d.jpg', i));
    image = double(imread(filename));
    sum_image = sum_image + image;
end
average_image = sum_image / numImg;
average_image = uint8(average_image);
imshow(average_image);
