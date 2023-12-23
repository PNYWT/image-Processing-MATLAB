folderPath = '/Users/CallmeOni/Documents/MATLAB/imgProcessing Week3 Lab/lab2-Image averaging/lab2-long exposure/waterfall';
sum_image = 0.00;

for i = 1:50
    filename = fullfile(folderPath, sprintf('%d.jpg', i));
    image = double(imread(filename));
    sum_image = sum_image + image;
end
average_image = sum_image/50;
average_image = uint8(average_image);
imshow(average_image);