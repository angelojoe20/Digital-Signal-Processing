% Read the image
img = imread("C:\Users\Angelo\OneDrive\Pictures\1x1 pic.png");

% Step 2: Manipulate the array by reversing columns
flipped_img = img(end:-1:1, :, :);  % Flip horizontally (reverse the columns)

% Step 3: Display the original and flipped images
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(flipped_img);
title('Flipped Image');

%%

% Read the image
img = imread("C:\Users\Angelo\OneDrive\Pictures\1x1 pic.png");

% Step 2: Manipulate the array by reversing columns
flipped_img = img(:, end:-1:1, :);  % Flip horizontally (reverse the columns)

% Step 3: Display the original and flipped images
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(flipped_img);
title('Flipped Image');

%%

% Read the image
img = imread("C:\Users\Angelo\OneDrive\Pictures\1x1 pic.png");

% Step 2: Manipulate the array by reversing columns
flipped_img = img( end:-1:1, end:-1:1, :);  % Flip horizontally (reverse the columns)

% Step 3: Display the original and flipped images
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(flipped_img);
title('Flipped Image');